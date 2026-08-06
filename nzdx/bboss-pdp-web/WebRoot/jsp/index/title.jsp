<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.frameworkset.platform.security.AccessControl"%>
<%@ page import="org.frameworkset.platform.common.SessionMapUtil" %>
<%
    AccessControl control = AccessControl.getAccessControl();
%>
<style>
    /* ============================================
       头部和布局样式
       ============================================ */
    header {
        height: 360px;
    }

    @media (min-width: 768px) {
        header {
            height: 170px;
        }
    }

    .head_nav_met_11_5 .nav-item .nav-link {
        color: #ffffff;
    }

    /* ============================================
       导航菜单基础样式
       ============================================ */
    .top .lists {
        margin-bottom: 0px;
        padding: 5px 0px;
        margin-top: 5px;
        display: inline-block;
    }

    .top .lists li {
        font-size: 1.1em;
        list-style-type: none;
        float: left;
        padding: 5px 2px;
    }

    @media (min-width: 768px) {
        .top .lists li {
            padding: 3px 2px;
        }
    }

    /* 菜单项链接样式：统一宽高，避免 active/hover/nav-link 尺寸不一致 */
    .top .lists li > a,
    .top .lists li > a.nav-link {
        padding: 8px 15px;
        line-height: 22px;
        height: 38px;
        box-sizing: border-box;
        color: #ffffff;
        display: block;
        text-decoration: none;
    }

    /* 菜单项悬停和激活状态 */
    .top .lists li > a:hover,
    .top .lists li > a.active,
    .top .lists li > a.nav-link:hover,
    .top .lists li > a.nav-link.active {
        padding: 8px 15px;
        line-height: 22px;
        height: 38px;
        background: #dc1111;
        color: #ffffff;
        border-radius: 3px;
        text-decoration: none;
    }

    /* 菜单项最后一个元素无边框 */
    .top .lists li:last-child {
        border: 0px;
    }

    /* 链接所有状态样式 */
    .top .lists a:link,
    .top .lists a:hover,
    .top .lists a:visited,
    .top .lists a:active {
        color: white;
        text-decoration: none;
    }


    /* 下拉菜单定位 - 消除位移和间隙 */
    .dropdown-menu {
        margin-top: 0 !important;
        top: 100% !important;
    }

    /* 下拉菜单容器样式 */
    .nav-item.dropdown .dropdown-menu {
        background-color: #bd0a10;
        border: none;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        padding: 5px 0;
    }

    /* 下拉菜单项样式 */
    .nav-item.dropdown .dropdown-menu .dropdown-item {
        color: #ffffff;
        padding: 8px 20px;
        background-color: #bd0a10;
        transition: background-color 0.3s ease;
        line-height: 1.5;
        display: flex;
        align-items: center;
        min-height: 30px;
    }

    /* 下拉菜单项悬停效果 */
    .nav-item.dropdown .dropdown-menu .dropdown-item:hover {
        background-color: #dc1111;
        color: #ffffff;
    }

       .dropdown-menu {
           margin-top: 0 !important;
           top: 100% !important;
       }

    /* 下拉菜单容器样式 - 使用 !important 确保覆盖 Bootstrap 默认样式 */
    .nav-item.dropdown .dropdown-menu,
    .top .lists .dropdown-menu {
        background-color: #bd0a10 !important;
        border: none;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        padding: 5px 0;
    }

    /* 下拉菜单项样式 - 使用 !important 确保覆盖 Bootstrap 默认样式 */
    .nav-item.dropdown .dropdown-menu .dropdown-item,
    .top .lists .dropdown-menu .dropdown-item,
    .dropdown-menu .dropdown-item {
        color: #ffffff !important;
        padding: 8px 20px;
        background-color: #bd0a10 !important;
        transition: background-color 0.3s ease;
        line-height: 1.5;
        display: flex;
        align-items: center;
        min-height: 30px;
    }

    /* 下拉菜单项悬停效果 */
    .nav-item.dropdown .dropdown-menu .dropdown-item:hover,
    .top .lists .dropdown-menu .dropdown-item:hover,
    .dropdown-menu .dropdown-item:hover {
        background-color: #dc1111 !important;
        color: #ffffff !important;
    }

</style>


<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/home.css"/>
</head>
<body>
<header style="background: #bd0a10;position: relative;width: 100%;">
	<div style="position: absolute;width: 100%;background: #bd0a10;z-index: 100;">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-xs-8" style="">
                <a href="/" class="met-logo" title="妇女发展数智实验室">
                    <div class="vertical-align-middle">
                        <table>
                            <tr data-width="100%">
                                <td style="width: 25%;"><img src="${pageContext.request.contextPath}/jsp/index/picture/head113.png" style="height: 108px;" alt="妇女发展政策虚拟仿真实验室"/></td>
                                <td style="width: 10%;"></td>
                                <td><h2 style="color: #ecf1f5;">妇女发展学院</h2><h4 style="color: #ecf1f5;">妇女发展政策虚拟仿真实验室</h4></td>
                            </tr>
                        </table>
                    </div>
                </a>
            </div>
            <div class="col-lg-5 col-xs-4" style="text-align: right;line-height: 108px;">
                <% if(control.getUserID() == "-1")
                    {
                %>
                    <p class="m-0">
                        <span class="tel"><a style="color: #eee" href="${pageContext.request.contextPath}/login.page?accesscontrol_check_referpath=0" >注册</a></span>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="tel"><a style="color: #eee" href="${pageContext.request.contextPath}/login.page?accesscontrol_check_referpath=/">登录</a></span>
                    </p>
                <% } else {%>
                        <p class="m-0 adsa" style="color: white;">
                            <span class="tel" style="color: #eee">
								<a href="${pageContext.request.contextPath}/notifcation/toNotificationindex.page?type=1" target="_blank"><%=control.getUserName() %></a>
							</span>
                            &nbsp;&nbsp;|&nbsp;&nbsp;
                            <span class="tel"><a style="color: #eee" href="${pageContext.request.contextPath}/jsp/logout.jsp?_redirectPath=/">退出</a></span>
                        </p>
                <%
                 }
                %>
            </div>
        </div>
    </div>
	<!-- 会员注册登录 -->
	<div class="row top" style="padding:0px 0px 10px 0px;border-top: solid 1px white;">
		<div class="container" style="padding:0px 0px 0px 0px;padding:0px 25px;">
			<ul class="lists nav-top">
				<li><a id="menu_1" href="/" title="系统首页" data-title="系统首页" >系统首页</a></li>
<%--                <li><a id="menu_2" href="${pageContext.request.contextPath}/index/toReview.page" title="理论知识" data-title="理论知识" >理论知识</a></li>--%>
                <li><a id="menu_3" href="${pageContext.request.contextPath}/index/toProjectInfo.page?id=1" title="实验室介绍" data-title="实验室介绍" >实验室介绍</a></li>

<%--                <li> <a  id="menu_4"  href="javascript:void(0);" title="妇女发展CGE模型" data-title="妇女发展CGE模型" class="nav-link dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"--%>
<%--                         target='_self'>妇女发展CGE模型</a></li>--%>
                <li class="nav-item dropdown m-l-10">
                    <a  id="menu_4"  href="javascript:void(0);" title="妇女发展CGE模型" data-title="妇女发展CGE模型" class="nav-link dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                        target='_self'>妇女发展CGE模型</a>
                    <div class="dropdown-menu dropdown-menu-right secondmenu animation-slide-top10">
                        <a href="${pageContext.request.contextPath}/modeljz/toSimulate.page?type=CHN-GEO"    title="妇女与健康" class='dropdown-item  navlist-2'  target='_self'>妇女与健康</a>
                        <a href="${pageContext.request.contextPath}/modeljz/toSimulate.page?type=CHN-AUS"  title="妇女与教育" class='dropdown-item  navlist-2'  target='_self'>妇女与教育</a>
                        <a href="${pageContext.request.contextPath}/modeljz/toSimulate.page?type=CHN-UKR"  title="妇女与经济" class='dropdown-item  navlist-2'  target='_self'>妇女与经济</a>
                        <a href="${pageContext.request.contextPath}/modeljz/toSimulate.page?type=RCEP"  title="妇女与社会保障" class='dropdown-item  navlist-2'  target='_self'>妇女与社会保障</a>
                        <a href="${pageContext.request.contextPath}/modeljz/toSimulate.page?type=self-df"  title="其他模型" class='dropdown-item  navlist-2'  target='_self'>其他模型</a>
                    </div>
                </li>

<%--                <li><a id="menu_5" href="${pageContext.request.contextPath}/index/toResource.page"   title="妇女发展数据库" data-title="妇女发展数据库" >妇女发展数据库</a></li>--%>
<%--                <li><a id="menu_4" href="${pageContext.request.contextPath}/index/toExperIndex.page"  target='_self' title="妇女发展CGE模型">CGE模型</a></li>--%>
                <li><a id="menu_6" href="${pageContext.request.contextPath}/examinationreport/index.page"   title="实验记录" data-title="实验记录" >实验记录</a></li>
			</ul>
		</div>
	</div>
	</div>
</header>
</body>


<%=SessionMapUtil.getSynInform(control.getUserAccount())%>

// ... existing code ...
<script>
    // 获取当前页面URL路径（不含 query）
    var currentPath = window.location.pathname || '/';
    var contextPath = "${pageContext.request.contextPath}" || '';
    var homePaths = {};
    homePaths['/'] = true;
    homePaths[contextPath] = true;
    homePaths[contextPath + '/'] = true;

    function normalizePath(path) {
        if (!path) return '';
        var q = path.indexOf('?');
        if (q >= 0) path = path.substring(0, q);
        if (path.length > 1 && path.charAt(path.length - 1) === '/') {
            path = path.substring(0, path.length - 1);
        }
        return path;
    }

    currentPath = normalizePath(currentPath);

    // 获取所有菜单链接（不含下拉子项）
    var menuLinks = document.querySelectorAll('.top .lists > li > a');

    // 移除所有菜单的active状态
    menuLinks.forEach(function(link) {
        link.classList.remove('active');
    });

    // 根据当前URL精确匹配选中态，避免 href="/" 误匹配所有路径
    var matched = false;
    menuLinks.forEach(function(link) {
        if (matched) return;
        var href = link.getAttribute('href');
        if (!href || href.indexOf('javascript') === 0) return;
        var hrefPath = normalizePath(href);
        if (homePaths[hrefPath]) {
            if (homePaths[currentPath]) {
                link.classList.add('active');
                matched = true;
            }
            return;
        }
        if (hrefPath && (currentPath === hrefPath || currentPath.indexOf(hrefPath) === 0)) {
            link.classList.add('active');
            matched = true;
        }
    });

    // 如果没有匹配到，默认选中第一个（系统首页）
    if (!matched) {
        document.getElementById('menu_1').classList.add('active');
    }

    // 为父级下拉菜单添加点击事件
    var dropdownToggle = document.getElementById('menu_4');
    if (dropdownToggle) {
        dropdownToggle.addEventListener('click', function(e) {
            // 如果需要点击父级菜单也跳转到某个页面，可以在这里添加
            window.location.href = "${pageContext.request.contextPath}/index/toExperIndex.page";
        });
    }
</script>
// ... existing code ...


</html>
