<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>实验教学项目特色</title>
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
		#menu_555{
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
		<div class="row">
			<ul class="list-unstyled">
				<li class="txts">一、实验方案设计思路</li>
				<li class="txts indx" style="margin-bottom:5px">1) 该实验教学项目建设的必要性和先进性主要有：</li>
				<li class="indx">（1）培育发展战略性新兴产业，加快产业结构升级与调整，推动我国经济转型，以应对不稳定的外部环境成为决策者制定经济发展政策的首要目标。</li>
				<li class="indx">（2）产业政策是我国四大宏观经济政策之一。</li>
				<li class="indx">（3）产业经济学常用的计量方法更多属于“事后分析”方法，难以量化评价产业政策的经济效应，易于引发人们对产业政策制定和实施的争论。</li>
				<li class="indx">（4）由于传统产业经济学教学难以对经济系统整体进行复制，这使得对产业政策的分析仅局限于具体的行业部门，难于基于整个经济系统，对产业政策经济效应进行全面评价。</li>
				<li class="txts indx" style="margin-bottom:5px">2) 该实验教学项目实验方案设计思路为：</li>
				<li class="indx">（1）将产业政策制定过程设置成为可虚拟的虚拟仿真实验，弥补了产业政策经济效应学习与研究中难以测量的不足。对产业政策进行评估、了解产业政策存在的风险和不合理性，是产业经济学中的核心内容。但是由于产业政策的经济效应难以量化，目前产业经济学教学中的政策评估仍以定性和事后评价为主。本实验教学内容设计将产业政策制定过程设置成为可虚拟仿真的实验，弥补了传统产业经济学教学中产业政策经济效应难以测量的不足。</li>
				<li class="indx">（2）将虚拟仿真实验过程设计为一个多方位交互的、沉浸式教学过程。该项目在实验教学过程中，考虑到学生的主动参与性，要求学生在学习产业经济学理论基础上，通过计量方法完成政策虚拟仿真的参数设置和变量选择，并在政策虚拟仿真平台中实现具体产业政策的虚拟冲击实验，激发了学生自主学习的兴趣，使学生感受到虚拟仿真的真实体验。</li>
				<li class="indx">（3）将全球CGE模型以及计算机编程转化为直观的产业政策虚拟仿真界面，帮助学生掌握政策虚拟（CGE模型）仿真的基本理论与应用。CGE模型已经发展成为国际主流的政策虚拟仿真工具，但由于CGE模型涉及庞大的建模过程和复杂的编码过程，对本科生学习有一定难度。面对这一难题，此实验教学运用信息化技术手段将全球CGE模型以及计算机编程转化为直观的产业政策虚拟仿真界面，在提高学生综合实践能力以及对模型的实际应用能力的同时，帮助学生掌握政策虚拟仿真的基本理论。</li>
				<li class="indx">（4）此实验教学使用的数据库是基于真实的经济数据、投入产出表所构建的，使学生可以在实验过程中了解经济运行的规律和产业经济的结构性特征，符合虚拟仿真实验教学的主题意义。</li>
				<li class="indx">（5）基于现实的产业经济问题，提高学生产业分析技能。重点关注我国产业结构调整的战略目标，结合具体的产业政策虚拟仿真实验，使学生在宏观经济和产业规划的分析框架中，融入专业分析技能。同时，实验课题是以现实的产业经济问题出发，注重新信息时代背景下学生的需求，引进前沿的计算机虚拟仿真和经济模型技术，使学生能掌握到实际的经济政策分析技巧，提高学生产业分析技能。</li>
			</ul>
			<ul class="list-unstyled">
				<li class="txts">二、教学方法创新</li>
				<li class="indx">（1）综合运用互动式、研讨式、案例讨论等实验教学手段。利用信息化技术构建虚拟仿真实验平台，并将互动式、研讨式、案例讨论等实验教学方法融入仿真虚拟，满足产业经济学中对产业政策评估分析的教学需求。</li>
				<li class="indx">（2）最大程度地构建了仿真虚拟现实情境。该实验教学项目提供在线虚拟功能，学生可根据具体的产业政策目标设置虚拟仿真场景，并运用计量经济学相关知识对冲击参数进行设置，最大程度满足仿真实验条件与现实政策情境。</li>
				<li class="indx">（3）该实验教学平台综合运用多媒体、大数据、经济建模、计算机虚拟等技术手段，将仿真虚拟、线上讨论、线下交流方式相结合，满足学生多样化学习需求，调动学生学习积极性，提升实验教学质量。</li>
			</ul>
			<ul class="list-unstyled">
				<li class="txts">三、评价体系创新</li>
				<li class="indx">评价体系具有多角度、全过程和双向反馈特征。</li>
				<li class="indx">多角度评价主要体现为从知识点的掌握、实验报告的规范性、实验报告分析的深度、实验操作掌握、工程价值认可度等角度的评价；</li>
				<li class="indx">全过程评价主要体现为从实验准备、实验过程、实验分析和实验心得分享、实验考核等4个方面20个步骤进行全面评价；</li>
				<li class="indx">双向反馈评价主要体现为实验过程16个步骤之间的交互反馈评价。</li>
			</ul>
			<ul class="list-unstyled">
				<li class="txts">四、对传统教学的延伸与拓展</li>
				<li class="indx">（1）本实验教学手段引入先进的政策虚拟量化工具，在实验仿真环境里讨论具体的产业政策对我国产业经济的影响，解决了传统的产业经济学教学偏重理论、案例、有限数据和技术实验授课，以及学生对理论的理解缺乏现实依据问题，拓展了传统教学方法、研究视野、实验数据和实验技术，也提升了学生对现实问题的理解和分析能力。</li>
				<li class="indx">（2）丰富了产业经济学学习内容和学习气氛，改变了传统产业经济学理论学习过程较为枯燥的现象，突破了由于数据和技术不足对实验学习的限制。该实验教学项目鼓励学生从现实经济问题出发，结合我国政策环境、政策目标，通过互动性的政策虚拟仿真环境学习相关知识点，可以帮助学生克服对于经济学公式和计量经济学方法学习的畏难情绪。本实验教学项目通过循序渐进的教学方法，帮助学生从简单的政策虚拟仿真界面入手，再到对政策虚拟仿真过程的理解，以及数据库建构特点和结果解读，帮助学生构建完整的、系统的知识体系。</li>
				<li class="indx">（3）注重培养具有扎实理论功底的研究型、综合型、创新型高素质人才，符合高校经管类学科人才培养目标。本实验教学既注重产业经济学基础理论学习，又强调培养学生理解产业政策制定的过程，为学生提供政策评估、分析的实践机会，也为以后开展相关专业工作积累经验，有利于培养具有扎实理论功底的研究型、综合型、创新型高素质人才。</li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>
</body>
</html>
