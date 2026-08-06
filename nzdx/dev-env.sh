#!/usr/bin/env bash
# nzdx 本地开发环境快捷脚本
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NZDX="$ROOT/nzdx"
TOOLS="$ROOT/tools"
export JAVA_HOME="${JAVA_HOME:-$TOOLS/jdk8u502-b07}"
export PATH="$JAVA_HOME/bin:$PATH"
GRADLE="${GRADLE:-$ROOT/gradle-6.1.1/bin/gradle}"
TOMCAT="${TOMCAT:-$TOOLS/tomcat}"

usage() {
  cat <<EOF
用法: $0 <command>

  status   查看 MySQL / Redis / Tomcat 状态
  mysql    确保 nzdx-mysql 容器运行
  build    Gradle 构建 WAR（跳过 test/javadoc）
  deploy   构建并部署到 Tomcat (context=/ (ROOT))
  start    启动 Tomcat
  stop     停止 Tomcat
  logs     跟踪 catalina.out
  open     打印访问地址与默认账号
EOF
}

cmd_status() {
  echo "== Java =="; java -version 2>&1 | head -1
  echo "== MySQL =="; docker ps --filter name=nzdx-mysql --format '{{.Names}} {{.Status}} {{.Ports}}' || true
  echo "== Redis =="; ss -tlnp 2>/dev/null | grep 6379 || true
  echo "== Tomcat ==";
  if [[ -f "$TOMCAT/bin/catalina.sh" ]]; then
    if pgrep -f "catalina.base=$TOMCAT|org.apache.catalina.startup.Bootstrap" >/dev/null 2>&1; then
      echo "running"
    else
      echo "stopped ($TOMCAT)"
    fi
  else
    echo "not installed at $TOMCAT"
  fi
}

cmd_mysql() {
  if ! docker ps --format '{{.Names}}' | grep -q '^nzdx-mysql$'; then
    if docker ps -a --format '{{.Names}}' | grep -q '^nzdx-mysql$'; then
      docker start nzdx-mysql
    else
      docker run -d --name nzdx-mysql \
        -e MYSQL_ROOT_PASSWORD='123qweasd.com' \
        -e MYSQL_DATABASE=nzdx \
        -e MYSQL_ROOT_HOST='%' \
        -p 3306:3306 \
        --restart unless-stopped \
        mysql:5.7 \
        --character-set-server=utf8 \
        --collation-server=utf8_general_ci \
        --lower-case-table-names=1
    fi
  fi
  for i in $(seq 1 30); do
    if docker exec -e MYSQL_PWD='123qweasd.com' nzdx-mysql mysqladmin ping -uroot --silent 2>/dev/null; then
      echo "MySQL ready"
      return 0
    fi
    sleep 2
  done
  echo "MySQL not ready" >&2
  return 1
}

cmd_build() {
  cd "$NZDX"
  "$GRADLE" build -x test -x javadoc -x javaDocJar
}

cmd_deploy() {
  cmd_build
  mkdir -p "$TOMCAT/webapps"
  cp "$NZDX/bboss-pdp-web/build/libs/bboss-pdp-web-5.0.9.war" "$TOMCAT/webapps/ROOT.war"
  echo "deployed -> $TOMCAT/webapps/ROOT.war"
}

cmd_start() {
  cmd_mysql
  export CATALINA_HOME="$TOMCAT"
  export CATALINA_BASE="$TOMCAT"
  export JAVA_OPTS="${JAVA_OPTS:--Xms512m -Xmx2048m -Dfile.encoding=UTF-8}"
  "$TOMCAT/bin/startup.sh"
  echo "Tomcat starting... http://127.0.0.1:8080/"
}

cmd_stop() {
  "$TOMCAT/bin/shutdown.sh" || true
}

cmd_logs() {
  tail -f "$TOMCAT/logs/catalina.out"
}

cmd_open() {
  cat <<EOF
访问地址: http://127.0.0.1:8080/
管理登录: admin / 123456
MySQL:    root / 123qweasd.com @ 127.0.0.1:3306 / nzdx
Redis:    127.0.0.1:6379
模型目录: $ROOT/nzdx-data/
JDK8:     $JAVA_HOME
Tomcat:   $TOMCAT
EOF
}

main() {
  local c="${1:-}"
  case "$c" in
    status) cmd_status ;;
    mysql) cmd_mysql ;;
    build) cmd_build ;;
    deploy) cmd_deploy ;;
    start) cmd_start ;;
    stop) cmd_stop ;;
    logs) cmd_logs ;;
    open) cmd_open ;;
    *) usage; exit 1 ;;
  esac
}

main "$@"
