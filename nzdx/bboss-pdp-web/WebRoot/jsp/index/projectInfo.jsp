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
	<link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/show.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/xajd/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/css/home.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/bootstrap.min.css"/>
	<!--[if lte IE 9]>
	<script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/index/js/jquery-1.8.3.min.js"></script>
	<%
		//获得id
		String id=request.getParameter("id");
	%>
	<style>

		.experiment-body{
			display: none;
		}
		.experiment-body.active{
			display: block;
		}
		.subcolumn_nav_met_16_1 .subcolumn_nav_met_16_1-ul > li a.active
		{
			background: #bd0a10;
		}
		.top .lists li a.active {
			padding: 8px 15px;
			line-height: 22px;
			background: #dc1111;
			border-radius: 3px;
		}
		.scdw table {
			width: 100%;
			border-collapse: collapse;
			min-width: 700px;
			border-radius: 3px;
			border: 1px solid #ddd; /* 表格外边框 */
		}

		.scdw thead {
			background-color: #f5698f;
			color: white;
		}

		.scdw th {
			padding: 18px 15px;
			text-align: left;
			font-weight: 600;
			font-size: 1.1rem;
			border-radius: 3px;

		}

		.scdw th:first-child {
			border-top-left-radius: 10px;
		}

		.scdw th:last-child {
			border-top-right-radius: 10px;
		}

		.scdw tbody tr {
			border-bottom: 1px solid #eaeaea;
			transition: background-color 0.2s;
		}

		.scdw td {
			padding: 16px 15px;
			vertical-align: top;
			border: 1px solid #eaeaea; /* 数据单元格边框 */
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var v=1000;
			var w = $(".ac .thp").height();
			if (w<v) {
				$(".ac .thp").css("height",v);
			}else {
				$(".ac .thp").css("height",w);
			}
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
<body>
<%@ include file="title.jsp" %>
<div class="hed"></div>
<div class="subcolumn_nav_met_16_1 border-bottom1" m-id='8' m-type='nocontent'>
	<div class="container">
		<div class="subcolumn-nav text-xs-center col-lg-2" style="padding: 0px 10px;">
			<ul class="subcolumn_nav_met_16_1-ul experiment-menu" style="border: solid 1px silver;padding: 0px 0px;border-radius: 3px;">
				<li>
					<a href="javascript:void(0)" data-val="1" title="实验室建设目的" class="experiment-menu-item active">实验室建设目的</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="2" title="模型原理" class="experiment-menu-item">模型原理</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="3" title="仿真模拟实验方法" class="experiment-menu-item">仿真模拟实验方法</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="4" title="模拟案例" class="experiment-menu-item">模拟案例▼</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="4" title="模拟案例一" class="experiment-menu-item">&nbsp;&nbsp;模拟案例一</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="5" title="模拟案例二" class="experiment-menu-item">&nbsp;&nbsp;模拟案例二</a>
				</li>
				<li>
					<a href="javascript:void(0)" data-val="6" title="模拟案例三" class="experiment-menu-item">&nbsp;&nbsp;模拟案例三</a>
				</li>
			</ul>
		</div>
		<div class="col-lg-10 ac" style="border: solid 1px #cccccc;background: white;padding: 10px 10px;margin-bottom: 25px;overflow: hidden;overflow-y: auto;">
			<section class="">
				<div class="experiment-body active" data-val="1">
					<div class="thp">
						<div class="mint">
							<span>实验室建设目的</span>
						</div>
						<div class="scdw">
							<div class="ind">本实验旨在通过“妇女发展CGE政策评估模型”虚拟仿真平台，使学生能够量化评估各类妇女发展政策（如就业促进、生育支持、教育补贴等）对女性就业、收入分配及家庭福祉的系统性影响。最终目标是培养学生设计政策方案、运行仿真模型及撰写评估报告的综合实践能力，深化对性别平等与公共政策互动关系的理解。</div>
							<div class="ind">可计算一般均衡模型（CGE，Computable General Equilibrium）被广泛地运用于量化政策影响评估与研究。但现有的CGE模型（如ORANI-G或ChinaGEM模型等）通常对劳动力供给进行简化处理，往往假设劳动力供给外生给定，或仅通过简单的加总替代弹性进行模拟。</div>
							<div class="ind">这类模型虽然区分了职业或技能，但缺乏对年龄、性别、教育等微观人口特征的捕捉；此外，劳动力供给通常被设定为外生或通过简单的加总替代弹性来模拟，无法反映家庭内部的时间配置决策；而且缺失对妇女、家庭、家务和生育关系的刻画，忽略了家务劳动、老人照料、孩童照料，对劳动力供给的贡献，
								以及其对社会福利和长期人口增长（生育率）的反馈。传统模型对劳动力市场的处理方式无法捕捉人口结构转型（老龄化、少子化）、妇女发展与支持政策，以及家庭内部时间配置（家务、照料、闲暇）对经济、劳动力市场的影响。</div>
							<div class="ind">
								中华女子学院妇女发展CGE模型（CUWLM, China Women University Labor Module）旨在填补这一空白。本模型构建了一个高度细分的微观人口与时间配置账户，将其嵌入到宏观CGE框架中，并构建了相应的行为方程模块、数据库、参数，以及可以实现动态模拟的动态递归机制。
							</div>
						</div>

					</div>
				</div>
				<div class="experiment-body" data-val="2">
					<div class="thp" style="height: auto;">
						<div class="mint">
							<span>模型原理</span>
						</div>
						<div class="scdw">
							<div class="ind">实验以“可计算一般均衡（CGE）”模型为核心理论框架。该模型通过模拟经济系统中生产、消费、贸易等行为的联动关系，构建了一个多部门、多要素的量化分析基础。其核心创新在于嵌入了性别、年龄、城乡等差异化变量，从而能够精准刻画不同女性群体在劳动力市场参与、家庭决策及政策冲击下的响应差异，为政策模拟提供微观行为基础与宏观系统支撑。</div>
							<div class="ind">本模型构建了一个高度细分的微观人口与时间配置账户，将其嵌入到宏观CGE框架中，并构建了相应的行为方程模块、数据库、参数，以及可以实现动态模拟的动态递归机制。模型的核心特征包括：（1）多维细分：涵盖性别、城乡、年龄、教育程度，四个维度的异质性；（2）引入时间禀赋论：基于时间配置理论（Gary Becker，1965），将总时间禀赋分配为市场劳动、
								闲暇、老人照料和孩童照料；（3）建立丰富的劳动力与经济内生反馈：劳动力供给对实际工资有弹性响应；照料时间的投入会对未来的生育率产生正向反馈；（4）构建动态递归模型：通过存量更新机制，刻画人口结构和劳动参与率随时间的演变。</div>
						</div>
						<img src="${pageContext.request.contextPath}/jsp/index/picture/model_yl.png"/>
					</div>
				</div>
				<div class="experiment-body" data-val="3">
					<div class="thp">
						<div class="mint">
							<span>仿真模拟实验方法</span>
						</div>
						<div class="scdw">
                            <div class="ind" style="word-wrap: break-word; word-break: break-all;">我国当前在推动性别平等与妇女全面发展方面面临新的机遇与挑战。如何在经济社会转型过程中，科学评估妇女发展政策的影响，促进妇女在就业、教育、健康、家庭与社会参与等领域的全面发展，已成为政策制定者关注的重要议题。本实验课程将以妇女发展理论为基础，结合我国妇女发展规划目标，构建并运用“妇女发展CGE政策评估模型”，系统模拟和分析各类妇女发展政策（如就业促进、社会保障、教育投入、生育支持等）在经济系统中的传导机制及其对妇女地位提升、家庭福祉改善和经济社会协调发展的综合影响。</div>
                            <div class="ind" style="word-wrap: break-word; word-break: break-all;">在《中国妇女发展纲要（2021—2030年）》的指引下，我国政府将促进妇女全面发展纳入国家发展战略体系，明确提出要“优化妇女发展环境，保障妇女合法权益”。随着人口结构变化、家庭功能转型和劳动力市场结构调整，如何科学设计并评估妇女发展政策，提升政策的精准性和有效性，具有重要的现实意义。本实验教学将结合妇女发展理论、家庭经济学与公共政策分析工具，深入探讨妇女发展政策对经济社会结构的系统性影响。</div>
                            <div class="ind" style="word-wrap: break-word; word-break: break-all;">与传统的性别研究方法不同，妇女发展CGE模型以可计算一般均衡模型为核心建模框架，依据微观经济行为与宏观经济结构的联动机制，构建了一个多部门、多生产要素的政策仿真平台。该模型嵌入了性别、年龄、城乡等差异化变量，能够精准刻画不同妇女群体在劳动力市场参与、家庭分工、消费决策及政策干预中的响应差异。传统教学中受限于数据与方法的局限，难以实现政策影响的量化评估，学生往往停留在定性理解层面。本实验教学借助前沿的虚拟仿真技术，构建妇女发展政策仿真系统，使学生能够直观、量化地分析政策冲击对不同妇女群体的影响路径与效果。</div>
                            <div class="ind" style="word-wrap: break-word; word-break: break-all;">在虚拟仿真实验教学环境中，学生将学习构建妇女发展数据库、设定政策情景、运行模型并解读仿真结果，掌握从政策设计到评估的全流程实践技能。通过这一过程，学生不仅能够深化对妇女发展理论与政策的理解，还能提升运用现代分析工具解决实际问题的能力，为未来从事妇女工作、公共政策研究与性别平等推动等领域的工作奠定坚实基础。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">具体来说，本实验教学目的包括：</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">1.学习掌握妇女发展的基本理论与政策框架，理解妇女发展政策制定的理论依据、目标体系及其在经济系统中的传导机制。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">2.理解我国妇女发展的现状与挑战，掌握妇女发展CGE模型的基本结构与变量设置，特别是性别、年龄、城乡等维度在模型中的嵌入方式与政策含义。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">3.掌握设计“妇女发展政策方案”及其虚拟仿真场景的技能。学生需基于我国妇女发展目标，结合模型特点，提出具有可操作性的政策建议，并完成政策情景设定与参数配置。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">4.掌握妇女发展CGE模型的运行与政策冲击量化技术，完成政策虚拟仿真实验。学生应能独立操作仿真平台，运行不同政策情景，并记录、整理仿真结果。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">5.学会运用妇女发展理论与统计方法进行实验结果分析与政策评估。学生需撰写“妇女发展政策评估报告”，分析政策对妇女就业、收入、家庭福祉及性别平等的影响，并提出优化建议。</div>
							<div class="ind" style="word-wrap: break-word; word-break: break-all;">6.培养学生的政策研究与创新能力。鼓励学生结合当前妇女发展热点问题（如生育支持政策、女性就业促进、家庭照料服务等），在实验平台上进行拓展性研究，开展自主式、探究式学习，提升综合实践能力与创新意识。</div>
						</div>
					</div>
				</div>


				<div class="experiment-body" data-val="4">
					<div class="thp" style="height: auto;">
						<div class="mint">
							<span>案例一：数字经济发展对女性及家庭的影响</span>
						</div>
						<div class="scdw">
							<div class="ind">——技术替代与“再生产危机”：基于性别视角的非对称冲击模拟</div>
						</div>

						<div class="mint">
							<span>1.案例分析与现实背景</span>
						</div>
						<div class="scdw">
							<div class="ind">本案例旨在评估若无特定的性别平等干预政策，数字经济的自然演进可能带来的结构性风险。当前，数字经济已成为中国经济增长的新引擎，根据中国信通院（2023）数据，我国数字经济规模已突破50万亿元。</div>
							<div class="ind">然而，技术进步并非中性，世界经济论坛（WEF,2023）《未来就业报告》指出，人工智能正在加速替代行政、客服、会计等常规性认知岗位，而这些岗位中女性从业者占比超过60%。相比之下，男性集中的建筑、运输及高端工程岗位短期内替代率较低。这种非对称冲击可能加剧性别不平等，引发“再生产危机”。</div>
						</div>

						<div class="mint">
							<span>2. 理论与机制分析</span>
						</div>
						<div class="scdw">
							<div class="ind">本模拟基于Acemoglu和Restrepo(2018)的任务替代模型和Becker(1981)的家庭分工理论。首先，技能偏向性技术进步导致女性密集型行业的劳动需求下降，产生替代效应，压低女性相对工资。</div>
							<div class="ind">其次，根据家庭新经济学理论，当女性市场工资相对于男性下降时，家庭最优决策将倾向于让女性回归家庭生产。最后，依据Galor和Weil(1996)的理论，女性收入预期的下降会通过收入效应抑制生育意愿，形成“技术进步—女性失业—生育下降”的负向循环。</div>
							<div class="ind">
								<ul>
									<li>第一轮效应（工资结构）：数字资本替代劳动（特别是女性密集的常规认知任务）。女性相对劳动需求下降女性工资承压性别工资差距扩大。</li>
									<li>第二轮效应（时间配置）：家庭决策逻辑显示，男性工资相对上升（互补效应），激励其增加市场工作；女性面临“双重负担”，在市场受挫后，社会规范促使其回归家庭承担照料。</li>
									<li>第三轮效应（再生产危机）：女性职业发展与生育冲突加剧，导致生育意愿下降，人力资本再生产受损。</li>
								</ul>
							</div>
						</div>

						<div class="mint">
							<span>3. 冲击设计与数据依据</span>
						</div>
						<div class="scdw">
							<div class="ind">根据前文的机理分析，模拟设定包含两个冲击向量：一是全要素生产率（TFP）提升，依据蔡昉（2020）关于数字经济对TFP贡献的测算，设定全社会TFP年均增长；二是偏向性劳动节约冲击，依据麦肯锡全球研究院（2017）关于中国服务业自动化替代率的预测，设定女性密集的服务业部门劳动投入系数下降，模拟岗位的直接替代</div>
							<div class="ind">Shock 1:全要素生产率(TFP)提升</div>
							<div class="ind">
								<ul>
									<li>冲击：shocka1tot=1.0；模拟数字技术带来的全要素生产率提升；</li>
									<li>数据来源：根据蔡昉(2020)及中国社会科学院(2021)的测算，数字经济对中国TFP增长的贡献率约为30%-40%，折合对GDP增长率的净贡献约为0.8%-1.2%。取中间值1.0%。</li>
								</ul>
							</div>

							<div class="ind">Shock 2:偏向性劳动节约</div>
							<div class="ind">
								<ul>
									<li>冲击：shocka1_lab_o("Service_Sectors")=-2.0；</li>
									<li>数据来源：麦肯锡全球研究院(MGI,2017)《中国数字经济：成为全球领先力量》预测，到2030年，中国约有1.5%-2.5%的工时将被自动化技术替代。考虑到服务业行业的高替代性，设定为-2.0%。</li>
								</ul>
							</div>
						</div>

						<div class="mint">
							<span>4. 模拟结果</span>
						</div>
						<div class="scdw">
							<div class="ind">宏观经济概况：技术进步的生产率效应推动宏观经济总量扩张，实际GDP增长0.92%，居民消费（x3tot）增长0.45%，投资（x2tot）增长1.10%。然而，由于资本和技术对劳动的替代，总就业（employ_i）反而下降了0.35%，呈现出“有增长、无就业”的特征。进出口方面，成本下降提升了国际竞争力，出口（x4tot）增长0.80%，进口（x0tot）随生产需求增长0.60%。</div>
							<div class="ind">劳动力模块核心结果：在供给维度，性别分化显著。受技术替代冲击，女性各细分群体的劳动供给（lab_sup）平均下降1.20%，导致分性别的总劳动供给增长（l_sup_gen）出现负值；相比之下，男性由于互补效应，供给微增0.20%。全社会总有效劳动供给（agg_lab_sup）净下降0.4%。</div>
							<div class="ind">在时间配置维度，女性被迫退出市场后，时间重新分配至家庭生产。女性孩童照料时间（child_care_t）增加1.5%，老人照料时间（eld_care_t）增加1.2%，闲暇时间（leis_time）增加0.8%。这验证了Becker的分工理论，即女性“被动回归”家庭。</div>
							<div class="ind">在价格/效率维度，女性实际工资（realwage）相对男性下降，性别工资差距扩大。值得注意的是，女性干中学带来的生产率提升（a1_lbd_g）下降了0.08%，意味着女性因就业减少而丧失了经验积累的机会，陷入“低技能陷阱”。</div>
							<div class="ind">在人口与社会维度，虽然照料时间增加，但由于家庭收入受损严重，生育意愿指数（fert_index）反而下降0.75%。受此影响，新生儿增长率（p_pop_newborn）下降，各细分群体人口增长（pop_matrix_var）在未来年份将呈现收缩趋势。此外，由于家庭照料投入增加，通过健康资本机制，医疗行业效率提升（f_care_eff）了0.1%，但这实际上反映了家庭对公共支出的隐性补贴。</div>
							<table style=" border: 1px solid #ddd;width: 95%">
								<thead>
								<tr>
									<th>关键变量</th>
									<th>变化</th>
									<th>机理解释</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td >Real GDP</td>
									<td >+0.92%</td>
									<td >数字技术带来的全要素生产率提升推动了产出扩张</td>
								</tr>
								<tr>
									<td >Agg Employment</td>
									<td >-0.35%</td>
									<td >技术的替代效应（机器换人）超过了产出规模效应，导致就业总量收缩</td>
								</tr>
								<tr>
									<td >Female Labor Supply</td>
									<td >-1.20%</td>
									<td >女性密集的常规岗位受冲击最重，被挤出劳动力市场</td>
								</tr>
								<tr>
									<td >Gender Wage Gap</td>
									<td >+2.10%</td>
									<td >女性相对劳动需求下降，导致女性工资增速显著低于男性</td>
								</tr>
								<tr>
									<td >Female Care Time</td>
									<td >+1.50%</td>
									<td >被动回归：失业或工时减少的女性被迫承担更多家务照料（Becker效应）</td>
								</tr>
								<tr>
									<td >Fertility Index</td>
									<td >-0.75%</td>
									<td >再生产危机：虽然照料时间增加，但家庭收入不安全感导致生育意愿下降</td>
								</tr>
								<tr>
									<td >LBD Effect (Female)</td>
									<td >-0.08%</td>
									<td >低技能陷阱：女性就业减少导致经验积累中断，进一步损害未来生产率</td>
								</tr>
								</tbody>
							</table>
						</div>

						<div class="mint">
							<span>5. 简要结论</span>
						</div>
						<div class="scdw">
							<div class="ind">如果不加干预，数字经济发展虽然能做大“蛋糕”使宏观经济GDP实现增长，但会加剧性别分工的恶化。</div>
							<div class="ind">女性不仅面临更高的失业风险，还可能会被迫退回家庭，导致收入和生育意愿双降，形成劳动时间变长，收入下降的“越穷越忙、越忙越穷”的恶性循环。</div>
						</div>
					</div>
				</div>



				<div class="experiment-body" data-val="5">
					<div class="thp" style="height: auto;">
						<div class="mint">
							<span>案例2：生育支持政策效果评估</span>
						</div>
						<div class="scdw">
							<div class="ind">——现金补贴与育儿假：降低生育机会成本的边际效应分析</div>
						</div>

						<div class="mint">
							<span>1. 案例分析与现实背景</span>
						</div>
						<div class="scdw">
							<div class="ind">面对低生育率挑战，降低养育成本成为政策核心。育娲人口研究（2022）数据显示，中国抚养孩子的直接成本占人均GDP倍数高达6.9倍。国家卫健委《关于进一步完善和落实积极生育支持措施的指导意见》明确提出建立生育补贴制度。本案例模拟政府通过财政转移支付提供育儿津贴，直接降低家庭养育的影子价格。</div>
						</div>

						<div class="mint">
							<span>2. 理论与机制分析</span>
						</div>
						<div class="scdw">
							<div class="ind">该政策主要基于Becker(1960)的生育需求理论和Mincer(1962)的劳动供给理论。现金补贴产生两种效应：一是“价格效应”，降低了孩子的相对价格，提升生育需求；二是“收入效应”，非劳动收入的增加会提高闲暇的保留工资，导致女性减少市场劳动供给。本模拟旨在量化这两种效应的净结果。</div>
							<div class="ind">影响机制：现金补贴产生收入效应（Becker,1960），提高对孩子的需求；但非劳动收入增加可能通过Mincer(1962)效应减少女性劳动供给。</div>
							<div class="ind">收入效应与生育：Becker(1960)认为孩子是“耐用消费品”，收入增加会提升需求。现金补贴直接降低了养育的净成本。</div>
							<div class="ind">机会成本与劳动供给：Mincer(1962)指出，纯粹的非劳动收入（Non-laborIncome，如津贴）增加，会产生收入效应，诱导人们增加闲暇消费，减少市场劳动供给。对于女性，如果津贴与孩童照料挂钩，可能强化传统的性别分工。</div>

						</div>

						<div class="mint">
							<span>3. 冲击设计与数据依据</span>
						</div>
						<div class="scdw">
							<div class="ind">根据前文的机制分析，和政策背景调研。本案例设定两个冲击：首先，依据OECD家庭福利支出标准及Laroque&Salanié(2014)的弹性估算，模拟生育响应弹性（FERT_RESP）增强10.0%，代表补贴对意愿的直接激励；其次，模拟政府对居民转移支付增加，设定f_trn_gov_h增加5.0%，资金来源于政府支出结构调整。</div>
							<div class="ind">Shock1:通过补贴切实实现对生育意愿的正向刺激</div>
							<div class="ind">
								<ul>
									<li>冲击：shock FERT_RESP = 10.0；</li>
									<li>数据来源：假设补贴额度覆盖家庭年收入的3%-5%（参照经合组织OECD国家平均水平）。根据Laroque&Salanié(2014)的估计，育儿成本每降低10%，生育率约上升2.5%-4%。我们设定FERT_RESP冲击10%，以模拟这一敏感度变化。</li>
								</ul>
							</div>

							<div class="ind">Shock2:转移支付，财政支出</div>
							<div class="ind">
								<ul>
									<li>冲击：shock f_trn_gov_h = 5.0；</li>
									<li>数据来源：参考OECD Family Database，高福利国家家庭福利支出占GDP比重约为2%-3%，中国目前尚不足0.5%。模拟政府将该比例提升至1%左右，即转移支付规模显著扩大。</li>
								</ul>
							</div>
						</div>

						<div class="mint">
							<span>4. 模拟结果</span>
						</div>
						<div class="scdw">
							<div class="ind">宏观经济概况：政策刺激了内需，实际GDP增长0.30%，主要由居民消费（x3tot）增长0.85%拉动。投资（x2tot）微增0.10%。由于劳动供给略有收缩，总就业（employ_i）微降0.10%。内需旺盛推高了国内价格，导致出口（x4tot）微降0.05%，进口（x0tot）增长0.40%。</div>
							<div class="ind">劳动力模块核心结果：在社会与人口维度，政策效果显著。生育意愿指数（fert_index）大幅上升2.80%。通过内生反馈机制，新生儿增长率（p_pop_newborn）显著增加0.64%，各细分群体人口（pop_matrix_var）中低龄组增速明显加快，长期人口结构得到改善。</div>
							<div class="ind">在供给维度，出现了预期的负面影响。受收入效应影响，女性各群体劳动供给（lab_sup）平均下降0.50%，导致全社会总有效劳动供给（agg_lab_sup）微跌。</div>
							<div class="ind">在时间配置维度，随着新生儿增加，女性孩童照料时间（child_care_t）刚性增加1.20%。同时，由于不再急于工作养家，女性闲暇时间（leis_time）增加0.30%，老人照料时间（eld_care_t）基本持平。</div>
							<div class="ind">在价格/效率维度，由于劳动力供给收缩，实际工资（realwage）上涨0.3%。但由于就业减少，干中学效应（a1_lbd_g）微降0.02%，显示出单纯的现金补贴可能不利于女性职业生涯的长期积累。</div>
							<table style=" border: 1px solid #ddd;width: 95%">
								<thead>
								<tr >
									<th>关键变量</th>
									<th>变化</th>
									<th>机理解释</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td >Real GDP</td>
									<td >+0.30%</td>
									<td >主要由政府转移支付带来的居民消费增加拉动，生产侧动力不足</td>
								</tr>
								<tr>
									<td >Agg Employment</td>
									<td >-0.10%</td>
									<td >现金补贴产生了“收入效应”，导致部分劳动力选择减少工作</td>
								</tr>
								<tr>
									<td >Newborn Growth</td>
									<td >+0.64%</td>
									<td >通过模型内生反馈，意愿提升成功转化为下一期的新生儿增量</td>
								</tr>

								<tr>
									<td >Female Labor Supply</td>
									<td >-0.50%</td>
									<td >Mincer 效应：补贴提高了保留工资，部分女性选择“回归家庭”</td>
								</tr>

								<tr>
									<td >Female Care Time</td>
									<td >1.20%</td>
									<td >孩子数量增加，导致刚性的照料时间需求上升</td>
								</tr>
								<tr>
									<td >Real Wage</td>
									<td >+0.30%</td>
									<td >劳动力供给减少导致市场工资被动微升</td>
								</tr>
								</tbody>
							</table>
						</div>

						<div class="mint">
							<span>5. 结论与启示</span>
						</div>
						<div class="scdw">
							<div class="ind">通过直接补贴确实能有效提高生育率，但代价是牺牲了部分女性的职业发展。这是一种“用女性就业换人口增长”的策略，短期内虽然提升了生育率，但长期看可能会削弱女性的经济独立性，固化“男主外女主内”的传统模式。</div>
						</div>
					</div>
				</div>


				<div class="experiment-body" data-val="6">
					<div class="thp" style="height: auto;">
						<div class="mint">
							<span>案例3：家庭政策效果评估</span>
						</div>
						<div class="scdw">
							<div class="ind">——托育与养老服务供给：社会化照料对女性时间的“解放效应”</div>
						</div>

						<div class="mint">
							<span>1. 案例分析与现实背景</span>
						</div>
						<div class="scdw">
							<div class="ind">现实趋势：照料负担重。现实趋势：中国“三明治一代”女性面临严重的照料负担。国家卫健委数据显示，0-3岁婴幼儿入托率仅5.5%；CHARLS数据显示，45-65岁女性中约30%承担高强度养老照料。</div>
							<div class="ind">政策背景：《“十四五”公共服务规划》提出具体指标：到2025年，每千人口拥有3岁以下婴幼儿托位数达到4.5个（较2020年的1.8个增长150%）。</div>
							<div class="ind">数据来源：国家卫健委(2021)数据显示，中国3岁以下婴幼儿入托率仅为5.5%，远低于OECD国家35%的平均水平。超过80%的婴幼儿由祖辈或母亲全职照料。</div>
						</div>

						<div class="mint">
							<span>2. 理论与机制分析</span>
						</div>
						<div class="scdw">
							<div class="ind">家庭生产替代：Gronau(1977)模型表明，当市场替代服务（托育/养老）价格下降或可及性提高时，家庭会减少自制时间，增加市场劳动时间。</div>
							<div class="ind">时间预算约束释放：公共服务打破了家务刚性，使得劳动和闲暇可以同时增加。实证支撑：陈斌开等(2020)研究发现，托育服务可及性每提高10%，女性劳动参与率提高约3-5个百分点。</div>

						</div>

						<div class="mint">
							<span>3. 冲击设计与数据依据</span>
						</div>
						<div class="scdw">
							<div class="ind">冲击变量为时间偏好移位器。依据“十四五”托位增长目标（覆盖率翻倍）和长护险试点数据（照料负担减轻约12%），设定孩童照料时间偏好（f_time_prefforKidCare）下降10.0%，老人照料时间偏好（f_time_prefforEldCare）下降12.0%。</div>
							<div class="ind">Shock1:通过补贴切实实现对生育意愿的正向刺激</div>
							<div class="ind">
								<ul>
									<li>冲击：shock f_time_pref("childcare") = -10.0</li>
									<li>数据来源：如果按照“十四五”目标，托位数从1.8增至4.5，覆盖率将接近15%-20%。保守估计，这将替代家庭10%的刚性照料时间（假设原本母亲每天花4小时照料，现在有0.4-0.5小时被托育机构分担）。</li>
								</ul>
							</div>

							<div class="ind">Shock2:老人照料</div>
							<div class="ind">
								<ul>
									<li>冲击：shock f_time_pref("eldcare") = - 12.0；</li>
									<li>数据来源：基于北京大学(2020)关于长护险试点效果的评估报告，长护险试点使得家庭照料时间平均减少了12.4%，同时使得照料者的就业概率提高了7%。</li>
								</ul>
							</div>
						</div>

						<div class="mint">
							<span>4. 模拟结果</span>
						</div>
						<div class="scdw">
							<div class="ind">宏观经济概况：劳动供给的释放带来了显著的供给侧红利。实际GDP增长1.60%，总就业（employ_i）大幅增长1.90%，这是隐性失业显性化的结果。居民消费（x3tot）增长1.20%，投资（x2tot）增长1.30%，进出口（x4tot,x0tot）分别增长0.50%和0.90%，经济呈现全面繁荣。</div>
							<div class="ind">劳动力模块核心结果：在时间配置维度，发生结构性逆转。女性孩童照料时间（child_care_t）下降10.0%，老人照料时间（eld_care_t）下降12.0%。释放出的时间主要流向市场，闲暇时间（leis_time）也适度增加2.0%，实现了“工作与生活平衡”。</div>
							<div class="ind">在供给维度，女性劳动供给（lab_sup）激增4.50%，分性别的总劳动供给增长（l_sup_gen）女性显著高于男性，全社会总有效劳动供给（agg_lab_sup）大幅提升。</div>
							<div class="ind">在价格/效率维度，大量女性进入职场触发了干中学正反馈，女性生产率提升（a1_lbd_g）达到0.25%，形成良性循环。其次，由于家庭减少了老人照料（eld_care_t下降），根据健康资本机制，照料带来的医疗效率提升（f_care_eff）变为正值（即成本上升0.15%），这反映了社会化养老虽然解放了劳动力，但也增加了医疗/护理行业的资源消耗成本，但这部分成本被GDP的巨大增量所覆盖。</div>
							<div class="ind">在社会维度，生育意愿指数（fert_index）大幅上升4.80%，新生儿增长率（p_pop_newborn）随之上升0.96%。这证明了“减负”比“发钱”更能有效促进人口再生产。</div>
							<table style=" border: 1px solid #ddd;width: 95%">
								<thead>
								<tr>
									<th>关键变量</th>
									<th>变化</th>
									<th>机理解释</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td >Real GDP</td>
									<td >+1.60%</td>
									<td >劳动力供给大规模释放，叠加托育养老产业发展，推动经济高增长</td>
								</tr>
								<tr>
									<td >Agg Employment</td>
									<td >+1.90%</td>
									<td >隐性失业显性化：原本被家务束缚的劳动力（主要是女性）进入市场</td>
								</tr>

								<tr>
									<td >Female Labor Supply</td>
									<td >+4.50%</td>
									<td >解放效应：社会化服务替代了家庭劳动，女性时间从家务转向工作</td>
								</tr>

								<tr>
									<td >Fertility Index</td>
									<td >+4.80%</td>
									<td >减负效应：时间成本的降低比金钱补贴更能激励生育意愿</td>
								</tr>

								<tr>
									<td >Female Care Time</td>
									<td >-11.00%</td>
									<td >托育和长护险直接替代了家庭内部的无酬照料时间</td>
								</tr>

								<tr>
									<td >LBD Effect (Female)</td>
									<td >+0.25%</td>
									<td >干中学红利：大量女性就业加速了经验积累，内生提升了全社会生产率</td>
								</tr>




								<tr>
									<td >Medical Efficiency</td>
									<td >-0.15%</td>
									<td >隐性成本：家庭减少照料老人，导致社会医疗/护理资源消耗略有增加</td>
								</tr>
								</tbody>
							</table>
						</div>

						<div class="mint">
							<span>5. 结论与启示</span>
						</div>
						<div class="scdw">
							<div class="ind">提供托育和养老服务是性价比最高的“双赢”政策。它不仅把女性从繁重的家务中解放出来创造GDP，还通过降低育儿的时间门槛显著提升了生育率。相比于直接补贴，这种“减负”策略更能实现经济增长与人口再生产的良性互促。</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<div class="container">

</div>
<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/show.js"></script>
</body>
</html>
<script>
	$(document).ready(function() {
		var menuId = '${menu_id}'
		$("#menu_"+menuId).addClass("active");
		var id="<%=id%>";
		if(!id || id == 'null'){
			id = 1
		}
		if(id){
			setTimeout(function() {
				$(".experiment-menu-item").removeClass('active')
				$(".experiment-menu-item[data-val='"+id+"']").addClass('active')
				$(".experiment-body").removeClass('active')
				$(".experiment-body[data-val='"+id+"']").addClass('active')
			}, 100);
		}

		$(".experiment-menu-item").on('click',function(){
			$(".experiment-menu-item").removeClass('active')
			$(this).addClass('active')
			var bodyIndex = $(this).data().val
			$(".experiment-body").removeClass('active')
			$(".experiment-body[data-val='"+bodyIndex+"']").addClass('active')
		})
	})
</script>
