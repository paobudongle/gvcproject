<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="贸易政策经济影响虚拟仿真实验教学项目" />
    <meta name="generator" content="贸易政策经济影响虚拟仿真实验教学项目" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/home.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/bootstrap.min.css"/>
    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/index/js/jquery-1.8.3.min.js"></script>
	<script>
		$(document).ready(function(){
		 	$("#nav16").addClass("active");
		});
	</script>
	<script>
	$(function(){
		var h=$(".td img:eq(0)").height();
		$(".td img").each(function(){
		   	$(this).css("height",h);
		});
	})
</script>
</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->
<body class="">
<%@ include file="title.jsp" %>
<div class="hed"></div>
<div class="container home">
	<h3>妇女发展政策虚拟仿真实验室</h3>
	<div class="col-lg-12">
		<div class="row">
			<div class="col-lg-6">
<%--				<video src="${pageContext.request.contextPath}/jsp/index/ppt/dwjm01.m4v" controls="controls" style="width:100%;border: solid 1px silver;" poster="${pageContext.request.contextPath}/jsp/index/picture/font-video.png">--%>
<%--					您的浏览器不支持 video 标签。--%>
<%--				</video>--%>
                <img src="${pageContext.request.contextPath}/jsp/index/picture/pic110.png" style="width:100%;border: solid 1px silver;">
			</div>
			<div class="col-lg-6">
				<ul class="list-unstyled listu">
					<li class="txs">嵌入生育决策、家庭模块与细分劳动力数据库的动态CGE模型</li>
					<li class="tec"><span>所属学科：</span><span class="sp">女性学、人口学、经济学</span></li>
					<li class="tec"><span>实验平台负责人：</span><span class="sp"> </span></li>
					<li class="tec"><span>实验介绍：</span><span class="sp">平台以可计算一般均衡模型（CGE）为核心建模框架，依据微观经济行为与宏观经济结构的联动机制，为妇女发展政策的系统性模拟提供支撑。此模型以多部门、多生产要素为基础，嵌入了性别、年龄、城乡等差异化变量。通过这些变量，模型能够精准刻画不同群体在劳动力市场、家庭行为以及政策干预中的响应差异。</span></li>
					<li class="tecb adsa"><button class="cmsd">
						<span data-toggle="modal" data-target="#myModal" style="font-size:1.5em">开始实验</span>
					</button></li>
						<div class="modal fade" id="myModal" style="margin-top: 10%;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel">
											实验说明
										</h4>
									</div>
									<div class="modal-body" style="text-indent: 2em;color: #666666;line-height: 1.7em;">
										<p>中华女子学院妇女发展CGE模型实验室以“可计算一般均衡（CGE）”模型为核心理论框架。构建了一个高度细分的微观人口与时间配置账户，将其嵌入到宏观CGE框架中，并构建了相应的行为方程模块、数据库、参数，以及可以实现动态模拟的动态递归机制。
										</p>
										<p>模型的核心特征包括：（1）多维细分：涵盖性别、城乡、年龄、教育程度，四个维度的异质性；（2）引入时间禀赋论：基于时间配置理论（Gary Becker，1965），将总时间禀赋分配为市场劳动、闲暇、老人照料和孩童照料；（3）建立丰富的劳动力与经济内生反馈：劳动力供给对实际工资有弹性响应；照料时间的投入会对未来的生育率产生正向反馈；（4）构建动态递归模型：通过存量更新机制，刻画人口结构和劳动参与率随时间的演变。</p>
									</div>
									<div class="modal-footer">
										<form action="${pageContext.request.contextPath}/index/toExperIndex.page" method="post">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary" style="background: #1f87e8">开始实验</button>
										</form>
									</div>
								</div>
							</div>
						</div>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-12 linst">
		<div class="row adsa">
			<ul class="list-inline">
				<li style="background: #3e9ef8;">
					<a href="${pageContext.request.contextPath}/index/toProjectInfo.page?id=1">
						<img src="${pageContext.request.contextPath}/jsp/index/images/wenz_1.png" />
						<div class="">实验室建设目的</div>
					</a>
				</li>
				<li style="background: #a24efc;">
					<a href="${pageContext.request.contextPath}/index/toProjectInfo.page?id=2">
						<img src="${pageContext.request.contextPath}/jsp/index/images/wenz_9.png" />
						<div class="">模型原理</div>
					</a>
				</li>
                <li style="background: #512da7;">
                    <a href="${pageContext.request.contextPath}/index/toProjectInfo.page?id=3" >
                        <img src="${pageContext.request.contextPath}/jsp/index/images/wenz_2.png" />
                        <div class="">仿真模拟实验方法</div>
                    </a>
                </li>
				<li style="background: rgb(0,135,129);">
					<a href="${pageContext.request.contextPath}/index/toProjectInfo.page?id=4" >
						<img src="${pageContext.request.contextPath}/jsp/index/images/wenz_5.png" />
						<div class="">模拟案例</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>
<script>
    jQuery(document).ready(function () {
        var menuId = '${menu_id}'
        $("#menu_"+menuId).addClass("active");
	});
</script>
</body>
</html>
