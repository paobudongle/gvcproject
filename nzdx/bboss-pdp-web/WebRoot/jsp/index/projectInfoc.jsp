<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>项目架构及研发技术</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="平台服务主要包括提供量化经济分析平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持" />
    <meta name="keywords" content="量化经济分析平台" />
    <meta name="generator" content="量化经济分析平台" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/show.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/xajd/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/css/home.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/bootstrap.min.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/index/xajd/js/jquery-1.8.3.min.js" ></script>
    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
	<style>
		.indx{
			color: #666666;
		}
		#menu_888{
			padding: 10px 15px;
			background: #438adc;
			border-radius: 3px;
		}
	</style>
</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->
<body>
<%@ include file="title.jsp" %>
<div class="hed"></div>
<div class="container xjjs">
	<div class="col-lg-12">
		<ul class="list-unstyled">
			<li class="txts">系统架构图及简要说明</li>
			<li>
				<div class="imgss" align="center">
					<img src="${pageContext.request.contextPath}/jsp/index/xajd/images/tu_10.png" />
				</div>
			</li>
		</ul>
		<ul class="list-unstyled">
			<li>（1）基础设施层</li>
			<li class="indx">支撑层是虚拟仿真实验教学与开放共享平台的的底层支撑。支撑平台包括：应用服务器、数据库软件、GTAP软件等。</li>
			<li>（2）数据层</li>
			<li class="indx">虚拟仿真项目涉及到多种类型数据，这里分别设置应用数据库、文件数据库、GATP数据库等来实现对相应数据的存放和管理。</li>
			<li>（3）业务逻辑层</li>
			<li class="indx">作为平台的核心部分，服务于应用层，实现业务的定制与业务流程的实现。</li>
			<li>（4）应用层</li>
			<li class="indx">基于业务逻辑的服务，实现人机交互，实现虚拟仿真实验的可操作性，面向学校开展实验教学应用。</li>
		</ul>
		<div class="row">
			<ul class="list-unstyled">
				<li class="txts">实验教学项目</li>
				<li class="indx">开发技术：Spring MVC + Mybatis + Echars</li>
				<li class="indx">开发工具：ItelliJ IDEA</li>
				<li class="indx">运行环境：服务器CPU 8 核以上、内存16GB以上、磁盘 2048GB、显存 2  GB、GPU型号 NVIDIA GeForce GTX 760，操作系统Windows Server</li>
				<li class="indx">数据库 Mysql</li>
				<li class="indx">项目品质：分辨率大于等于1366*768</li>
			</ul>
		</div>
	</div>
</div>




<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>
</body>
</html>
