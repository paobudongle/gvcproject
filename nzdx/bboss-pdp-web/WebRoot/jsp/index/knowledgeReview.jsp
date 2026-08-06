<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <%@ include file="front_head.jsp" %>
    <meta name="description" content="" />
    <meta name="keywords" content="贸易政策经济影响虚拟仿真实验教学项目" />
    <meta name="generator" content="贸易政策经济影响虚拟仿真实验教学项目" data-variable=""/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/news.css"/>
</script>
</script>

    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
</script>

    <style>
        .container.preview{
            min-height: 300px;
            color: #666;
            font-size: 14px;
        }
        .container.preview .preview-nav{

        }
        .container.preview .preview-nav ul{
            border: 1px solid #c0c0c0;
            border-radius: 4px;
        }
        .container.preview .preview-nav ul li{
            line-height: 40px;
            padding: 0 10px;
        }
        .container.preview .preview-nav ul li:hover{
            cursor: pointer;
            background: #1f87e8;
            color:#fff;
        }
        .container.preview .preview-nav ul li.active{
            background: #1e50ae;
            color:#fff;
        }
        .container.preview .preview-body{
            border: 1px solid #c0c0c0;
            min-height: 277px;
        }
        .container.preview .preview-body #theory{
            line-height: 30px;
            word-break: break-all;
        }
        .container.preview .preview-body #theory .theory-title{
            text-align: center;
            font-weight: bold;
            line-height: 45px;
        }
        .container.preview .preview-body #theory p{
            text-indent:35px;
        }
        .container.preview .preview-body #courseware{
            line-height: 30px;
            word-break: break-all;
            color: #1e50ae;
        }
        .container.preview .preview-body #courseware .courseware-title{
            line-height: 45px;
            border-bottom: 1px solid #c0c0c0;
            margin-bottom: 10px;
        }
        .container.preview .preview-body #courseware .courseware-title .title-text{
            text-align: center;
            padding: 0 20px;
            line-height: 45px;
            display: inline-block;
            border-bottom: 2px solid  #1e50ae;
            position: relative;
            top:2px;
        }
        .container.preview .preview-body #courseware ul li{
            border-bottom:1px dashed #c0c0c0;
            line-height: 40px;
        }
        .container.preview .preview-body #courseware ul li:hover{
            cursor: pointer;
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

<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="title.jsp" %>
<div class="site-page-main">
<div class="hed"></div>

<div class="container home">
    <div class="row">
        <div class="col-md-12 preview-body">
            <div id="theory">
                <div class="theory-title">理论知识</div>
                <p>通过全球价值链一般均衡模型量化自由贸易区关税减免、贸易便利化提升、技术进步以及贸易救济等的经济效应。本实验通过对以下6个知识点的学习和实践运用，使学生掌握国际贸易基本理论、熟识古典CGE模型、全球CGE模型及全球价值链理论模型，掌握比较静态分析以及模型闭合选择等基本操作技能。</p>
                <P>知识点：共  6   个</P>
                <P> 1）国际贸易理论学习及应用</P>
                <P>&nbsp;&nbsp;国际贸易理论的发展大致经历古典、新古典、新贸易理论、新新贸易理论等阶段；特别是由于全球价值链的发展，很多学者将全球价值链贸易理论作为“新新新”贸易理论。在教学中，我们全面系统梳理并教授这些贸易理论的关键内容、相互关系及其演化路径。特别是，在模拟方案中，可设定不同政策情景方案印证相关贸易理论。譬如，当一国劳动力供给降低后对贸易结构的影响，以印证赫克歇尔-俄林（HO）模型。对于专业素养较高的学生，甚至根据不同贸易理论，改动模型中相应的贸易模块，在同样经济冲击和不同贸易设定下，定量分析冲击对经济系统的不同影响，进而深度理解不同贸易理论及其影响的差异。</P>
                <P> 2）古典CGE模型基本原理及其分析框架</P>
                <p>古典CGE是以瓦尔拉斯一般均衡理论为基础的经济学量化研究方法，目前已发展成为经济学研究的主流方法，被广泛运用于包括国际贸易政策在内的研究领域中。古典CGE模型通过构建庞大的联立方程组，涵盖经济体系中生产、需求、贸易、收入等各种经济活动。模型基于“理性人”假设，考虑完全竞争市场下，消费者最大化效用、生产商最小化生产成本、投资者最大化预期资本回报、市场出清等条件，求得市场均衡价格（如图1所示）。CGE模型理论学习与应用有助于学生将微观经济学、宏观经济学、国际贸易、国际投资等多学科综合在一个分析框架内对问题进行研究，建立系统性分析思维。</p>
                <div class="imgs">
                    <img src="${pageContext.request.contextPath}/jsp/index/dwjm/ll_01.png">
                    <div>图1：古典CGE模型市场均衡的分析体系</div>
                </div>
                <P> 3）全球贸易CGE模型</P>
                <p>全球贸易CGE模型进一步完善标准GTAP模型基础上构建的，而且主要用于虚拟仿真项目的政策仿真分析。标准的GTAP是一个比较静态模型，基于古典经济学理论构建，假设生产者生产成本最小化，消费者效用最大化，模型均衡时所有产品和投入要素全部出清。每种产品的生产采用嵌套的常系数替代弹性（CES）方程，假设规模报酬不变。GTAP模型中的各种流向关系见图5-5。其中，中间投入品是由国内和国外产品通过常系数替代弹性方程复合而成，不同来源的国外产品按原产地进行分类，通过常系数替代弹性方程复合为单一的进口产品（阿明顿假设）。在要素市场，劳动力在国内可以自由流动的；土地在部门间不是完全流动的，即不同用途的土地价格不一致。每个国家只有一个本地帐户（national account），所有的税收和禀赋收入都积聚到本地帐户，并通过柯布-道格拉斯（C-D）效用方程，将收入分配到私人消费，存款和政府消费。私人部门的效用函数采用常差弹性方程（CDE）形式（消费收入弹性是非齐次性的，对于长期预测非常重要），政府的效用方程采用C-D方程形式。GTAP 模型包含两个国际部门：国际银行和国际运输部门。每个国家的储蓄汇总到国际银行帐户，并根据资本的回报率在各个国家间进行分配；国际运输部门可以平衡到岸价（CIF）和离岸价（FOB）之间差异，并通过双边贸易将世界各国联系起来。</p>
                <div class="imgs">
                    <img src="${pageContext.request.contextPath}/jsp/index/dwjm/ll_02.png">
                    <div>图2：全球贸易CGE模型结构图</div>
                </div>

                <P> 4）全球价值链理论与分解方法</P>
                <p>随着中间品贸易的快速增长和国际垂直专业化分工的日益细化，全球经济进入了以生产过程分节化和中间品贸易为主要特征的全球价值链时代，全球价值链分工对于各国贸易、经济增长和利益分配具有重要影响，是国际贸易发展的最新领域，被部分学者称为“新新新”贸易理论。得益于近些年来世界多区域投入产出表的编制和公开发布，全球价值链核算研究得以快速发展。其中全球价值链生产分解包括：生产的前向分解（增加值/行业GDP的生产分解）和生产的后向分解（最终品生产分解）两种。WWZ 模型在双边贸易分解模型中，可以把一国对另一国的出口分解成16个部分。假设有G 个国家，N 个部门。同时，使用表示s 国国内里昂惕夫逆矩阵，用表示国家或地区s 对国家或地区r 的总出口的话，对其具体分解结果如下：</p>
                <div class="imgs">
                    <img src="${pageContext.request.contextPath}/jsp/index/dwjm/ll_03.png">
                </div>
                <P>目前，已经根据近期研发的总贸易分解框架（KWW, 2014; WWZ, 2013） 和生产活动分解框架，WWYZ, 2017a），采用优化软件GEMPACK，编写了全球价值链核算方法的计算程序（与对外经济贸易大学全球价值链研究院开发的R语言程序结果完全相同）。可以让学生深度掌握分解方法的同时，兼顾实际分析应用。</P>

                <P>  5) 模型比较静态分析</P>
                <p比较静态分析是相对于动态经济分析而言的，指不考虑技术、资本和劳动力等初级生产要素变化的情况下，外部政策冲击是经济系统从初始均衡态调整到新的均衡状态，对产业结构、资源分配和要素利益所得等造成影响。通过初始和新的均衡态各种变量之间的比较，就可以分析外部政策变化导致的影响幅度。比较静态分析有两大突出优势：第一，凸显了生产资源的有限性，生产资源将配置给相对生产效益更好的部门。即便一个部门的收益不变，但是由于其他部门收益提高，它也将间接受损；即便一个部门的收益不变，但是由于其他部门受损，它也将间接受益。第二，充分反映了经济系统自我修复机制：当一个产品的价格上升，需求将降低（负的自价格弹性，正的交叉价格弹性）；与此同时，生产资源将重新配置，产出增长，进口也将增加，导致供给增长。供需再次达到新平衡状态。</p>


                <P> 6） 经济福利分析</P>
                <p>福利经济分析是经济分析中的重要内容。在静态分析中，导致福利变化的主要来源自三个方面：资源分配效率、贸易条件变化和投资效应等是三个层面。其中，资源分配效率和贸易条件变化是主要的福利变化原因，对经贸学科学生深刻理解经济政策改变导致的经济福利影响、来源及其逻辑机制具有重要价值。相对于实际GDP，经济福利在经济分析中属于更为完备的评价指标。例如，一个国家即便实际GDP没有发生任何变化，但由于其贸易条件（term of trade）改善，其国经济福利也会极大地改进。如图3所示，在一个存在资源配置扭曲的经济体，技术进步导致了边际劳动产值更高部门的劳动力配置，除了技术进步本身导致的效率提高效应以外，还有很重要的资源配置效率的改进，共同促进该国的福利提高。</p>
                <div class="imgs">
                    <img src="${pageContext.request.contextPath}/jsp/index/dwjm/ll_04.png">
                    <div>图3：技术进步导致的技术进步效应和资源配置效应分析图</div>
                </div>
            </div>
        </div>
    </div>
</div>
</div><!-- site-page-main -->
<%@ include file="foot.jsp" %>

</div><!-- site-page-wrap -->


</body>
</html>

<script>
    $(function(){
        var menuId = '${menu_id}'
        $("#menu_"+menuId).addClass("active");
        $(".preview-nav-item").on('click',function(){
            var navActive = $(this).data().val
            $(".preview-nav-item").removeClass("active")
            $(this).addClass("active")
            if (navActive == 'theory') {
                $("#theory").show()
                $("#courseware").hide()
            } else {
                $("#theory").hide()
                $("#courseware").show()
            }
        })
    })
</script>
