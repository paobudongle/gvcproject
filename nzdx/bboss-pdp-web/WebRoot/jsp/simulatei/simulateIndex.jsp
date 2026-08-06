<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>在线模拟</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="description" content="平台服务主要包括提供量化经济分析平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持"/>
    <meta name="keywords" content="量化经济分析平台"/>
    <meta name="generator" content="量化经济分析平台" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/demo.css">
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/product.css"/>

    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/fSelect/css/fSelect.css">
    <style>
        .ptext {
            margin-top: 1px;
            margin-bottom: 1px;
            line-height: 2;
            font-size: 12pt;
            word-break: break-all;
            text-indent: 35px;
        }
        .mt-element-step .step-line .mt-step-col {
            padding: 20px 0;
        }

        .dropdown-toggle::after {
            margin-top: -3px;
        }
        .dropdown-toggle:after {
            margin-right: 0;
            margin-left: .3em;
        }
        .dropdown-toggle::after {
            display: inline-block;
            width: 0;
            height: 0;
            margin-left: .286rem;
            content: '';
            vertical-align: middle;
            border-top: .286rem solid;
            border-right: .286rem solid transparent;
            border-left: .286rem solid transparent;
        }
        *, ::after, ::before {
            -webkit-box-sizing: inherit;
            -moz-box-sizing: inherit;
            box-sizing: inherit;
        }
    </style>





</head>
<body class="met-navfixed">
<%@ include file="../index/title.jsp" %>

<div class="news_list_met_21_4 met-index-body met-index-imgnews bgcolor" m-id='4' style="padding: 100px 0 0 0;">
    <div class="container">
        <div class="row">

            <!-- END HEAD -->

            <div class="product_list_page_met_16_1 met-product animsition   type-1 " m-id='14' style="background:none;">
                <div class="container">
                    <form action="#" class="form-horizontal form_sys_addModelRun" id="form_sys_addModelRun">
                        <input type="hidden" id="jzId" name="jzId"/>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mt-element-step">
                                    <div class="row step-line">

                                        <div class="col-md-1 mt-step-col"></div>
                                        <div id="t_div_1" class="col-md-2 mt-step-col first active"
                                             style="cursor:pointer;" href="#tab_1" data-toggle="tab"
                                             onclick="setTab('1')">
                                            <div class="mt-step-number bg-white">1</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">简介/Overview</div>
                                        </div>

                                        <div id="t_div_2" class="col-md-2 mt-step-col"
                                             style="cursor:pointer;" href="#tab_2" data-toggle="tab"
                                             onclick="setTab('2')">
                                            <div class="mt-step-number bg-white">2</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">数据/DATA</div>
                                            <%-- <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_3" class="col-md-2 mt-step-col" style="cursor:pointer;"
                                             href="#tab_3" data-toggle="tab" onclick="setTab('3')">
                                            <div class="mt-step-number bg-white">3</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">闭合/Closure</div>
                                        </div>
                                        <div id="t_div_4" class="col-md-2 mt-step-col " style="cursor:pointer;"
                                             href="#tab_4" data-toggle="tab" onclick="setTab('4')">
                                            <div class="mt-step-number bg-white">4</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">冲击/Shocks</div>
                                        </div>
                                        <div id="t_div_5" class="col-md-2 mt-step-col last" style="cursor:pointer;"
                                             href="#tab_5" data-toggle="tab" onclick="setTab('5')">
                                            <div class="mt-step-number bg-white">5</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">结果/result</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-content" id="model_tab">
                                    <div class="tab-pane fade active in" id="tab_1">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-1"></div>
                                                    <div class="col-md-10">
                                                        <div class="view">
                                                            <p class="ptext">
                                                                全球模型量化经济分析平台是基于可计算一般均衡（CGE）框架和微观理论，以全球视角分析政治、环境以及经济冲击的政策模拟工具。 模型通过进出口贸易以及投入产出表数据连接了各国经济部门
                                                                ，包括各行业的生产商，消费者以及政府。在各国经济体中，消费者和政府组成了区域家庭，其收入主要来源于政府部门的税收和私人消费者的生产要素（如劳动、资本和土地）收入。
                                                                区域家庭将收入进行了重新分配，主要流向了三个领域：消费者的支出，政府支出以及国家总储蓄。其中消费者和政府的支出包括本国和进口产品。国家总储蓄流向了世界银行，为各国投资者提供了资本。
                                                                世界银行将各国的资本集中后分配成为各国企业的投资。公司在模型中起到了非常重要的作用。首先，生产商作为生产要素的需求方，向消费者支付要素报酬以获得生产投入；其次，
                                                                生产商将本国其他行业的产出以及进口品作为中间原材料进行再生产；最后，公司的产品除了在本国销售外，还将以出口的形式进入世界市场。通过实体经济各国家、部门和产业之间的联动效应，模型在财税、国际贸易、环境与自然资源、行业与区域经济等领域具有广泛的应用价值。
                                                            </p>
                                                            <p class="ptext">
                                                                在使用平台前，浏览以下材料能更好地帮助用户了解和使用全球模型量化经济分析平台：
                                                            </p>
                                                            <ul class="list-group ptext">
                                                                <li><a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=00">●全球模型量化经济分析平台帮助文档</a></li>
                                                                <%--<li><a href="#">●全球模型量化经济分析平台常见问题</a></li>--%>
                                                                <li><a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=00" >●全球模型资料库</a></li>
                                                                <li><a href="http://www.infsum.com/news.php?cid=187" target="_blank">●全球模型线下培训</a></li>
                                                            </ul>
                                                            <p class="ptext">
                                                                为了方便用户进行热门政策分析，我们提供了以下全球模型的当下热门经典案例模板并不断进行更新。用户可在模板基础上自定义模拟设置。
                                                            </p>
                                                            <ul class="list-group ptext">
                                                                <li><a href="#" onclick="loadAgg('CASE_GL','美国征收钢铝税')">●美国征收钢铝关税</a></li>
                                                                <li><a href="#" onclick="loadAgg('CASE_MY','中美贸易战')">●中美贸易战</a></li>
                                                                <li><a href="#" onclick="loadAgg('CASE_QC','美国征收汽车关税')">●美国征收汽车关税</a></li>
                                                                <%--<li><a href="#">●一带一路</a></li>--%>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="tab_2">
                                        <div class="demo" style="background: #f5f5f5;">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-2 col-sm-2 col-xs-2"></div>
                                                    <div class="col-lg-7 col-sm-7 col-xs-12">
                                                        <p>①可点击“重新分类”进行数据加总操作；②点击“导入”可以载入预设分类以及案例（详情参考使用说明）；③或点击选择已经创建过的数据库。</p>
                                                    </div>
                                                    <div class="col-lg-2 col-sm-2 col-xs-2">
                                                        <%--<button class="btn btn-success" onclick="addAgg()">+添加配置</button>--%>
                                                        <a class="btn btn-success" href="#" onclick="addAgg()">重新分类</a>

                                                        <div class="btn-group"  id="btn_opera_00" >
                                                            <a class="btn green dropdown-toggle" data-toggle="dropdown" href="javascript:;" onclick="operateAgg('00')" >
                                                                导入<i class="fa fa-angle-down"></i>
                                                            </a>
                                                            <ul class="dropdown-menu">
                                                            <%--<li><a href="javascript:;" onclick="addAgg()"> 添加加总</a></li>--%>
                                                            <li><a href="javascript:;" onclick="impAgg()"> 导入分类</a></li>
                                                            <li><a href="javascript:;" onclick="impCase()"> 导入案例</a></li>
                                                        </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="timeLine">
                                                        <div class="col-lg-1 col-sm-1 col-xs-1"></div>
                                                        <div class="col-lg-2 col-sm-2 col-xs-2">
                                                            <div class="years"></div>
                                                        </div>
                                                        <div class="col-lg-8 col-sm-8 col-xs-8">
                                                            <div id="vertical-timeline" class="vertical-container dark-timeline"></div>
                                                        </div>
                                                        <div class="col-lg-1 col-sm-1 col-xs-1"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_3">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-2"></div>
                                                    <label class="col-md-1 control-label">模型闭合<span class="required">*</span></label>
                                                    <div class="col-md-4">
                                                        <select class="form-control" id="colsure"
                                                                onchange="colsureChange(this.value)" name="colsureType">
                                                            <option value="">--请选择--</option>
                                                            <option value="BookClosure">标准闭合</option>
                                                            <option value="ShortClosure">短期闭合</option>
                                                            <option value="SelfClosure">自定义闭合</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <a href="#" data-toggle="tooltip" onclick="setColsureSelected('BookClosure')"
                                                           title="在标准闭合中，就业和资本量固定，工资和资本回报率自由调整" style="cursor: help;">标准闭合</a>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <a href="#" data-toggle="tooltip"  onclick="setColsureSelected('ShortClosure')"
                                                           title="在短期闭合中，工资和资本量固定，就业和资本回报率自由调整"
                                                           style="cursor: help;"><span
                                                                class="glyphicon glyphicon-question-sign"
                                                                aria-hidden="true">短期闭合</span></a>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <a href="#" data-toggle="tooltip"  onclick="setColsureSelected('SelfClosure')"
                                                           title="自定义闭合以标准闭合为基础可自由调整"
                                                           style="cursor: help;"><span
                                                                class="glyphicon glyphicon-question-sign"
                                                                aria-hidden="true">自定义闭合</span></a>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label"></label>
                                                    <div class="col-md-7">
                                                        <textarea id="closureTxt" name="closureTxt" class="form-control"
                                                                  rows="15"  style="display: none;"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_4">
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6"> <p style="color: #919191;">如需了解冲击变量代表的具体含义，请点击下方‘变量解释’按钮</p></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击<span  class="required">*</span></label>
                                                    <div class="form-group col-md-6">
                                                        <select class="form-control" id="shockType" onchange="shockTypeChange(this.value)"></select>
                                                        <%--因素冲击--%>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"></div>
                                                    <label class="form-group col-md-4  control-label"
                                                           id="shorckTypeReamrkCn"></label>
                                                    <label class="form-group col-md-4  control-label"
                                                           id="shorckTypeReamrk"></label>
                                                </div>

                                                <div class=" row" style="display: none;" id="div_main">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击元素<span
                                                            class="required">*</span></label>
                                                    <div class="form-group col-md-3" style="display: none;"
                                                         id="div_shorck1">
                                                        <select class="form-control" id="sel_shorck1">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display: none;"
                                                         id="div_shorck2">
                                                        <select class="form-control" id="sel_shorck2">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display:none ;"
                                                         id="div_shorck3">
                                                        <select class="form-control" id="sel_shorck3">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display:none ;"
                                                         id="div_shorck4">
                                                        <select class="form-control" id="sel_shorck4">

                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">变化冲击（%）
                                                        <span class="required">*</span></label>
                                                    <div class="form-group col-md-3">
                                                        <input type="number" class="form-control" id="shorckValue"
                                                               autocomplete="off">
                                                    </div>

                                                    <div class="form-group  col-md-1 col-sm-6 col-xs-6 .col-lg-offset-1">
                                                        <button type="button"
                                                                class="btn btn-primary glyphicon glyphicon-plus"
                                                                onclick="addToShorckList()">添加至列表
                                                        </button>
                                                    </div>
                                                    <div class="form-group col-lg-1 col-md-1 col-sm-6 col-xs-6">
                                                        <button type="button"
                                                                class="btn btn-warning glyphicon glyphicon-minus"
                                                                onclick="clearShorckList()">清空列表
                                                        </button>
                                                    </div>
                                                    <div class="form-group col-lg-1 col-md-1 col-sm-6 col-xs-6">
                                                        <a class="btn btn-info" title="下载变量解释" href="${pageContext.request.contextPath}/modeljzi/downParamExplain.page">变量解释</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击列表</label>
                                                    <div class="form-group col-md-6">
                                                        <textarea class="form-control" rows="8" id="shorckTxt" placeholder="冲击列表" name="shorckTxt">
                                                           </textarea>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">标题<span class="required">*</span></label>
                                                    <div class="form-group col-md-6">
                                                        <input class="form-control" id="runName" name="runName" autocomplete="off" onblur="checkName()">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">备注信息</label>
                                                    <div class="form-group col-md-6">
                                                        <textarea class="form-control" placeholder="备注信息" id="remark" name="remark"  rows="4"></textarea>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5"></div>
                                                    <div class="col-md-offset-4 col-md-6">
                                                        <button type="button" class="btn green btn-ModelRunaddsave">运行求解
                                                        </button>&nbsp;
                                                        <button type="reset" class="btn default">重置</button>&nbsp;
                                                        <button type="button" class="btn default" data-dismiss="modal">取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_5">
                                        <div class="row"><div class="col-md-12">&nbsp;&nbsp;&nbsp;</div></div>
                                        <div class="row"><div class="col-md-12">&nbsp;&nbsp;&nbsp;</div></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div id="tree-demo" class="tree-demo" style="height:580px;overflow-x:auto;overflow-y: auto;background-color: #ffffff;"> </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="row" style="background-color: #ffffff;">
                                                        <div class="col-md-12" >
                                                            <div id="me_div" style="float: right;text-align: center;">
                                                                <form class="form-inline">
                                                                    <div class="form-group">
                                                                        <label id="div_sel_verb3_1"></label>&nbsp;
                                                                        <label id="div_sel_verb3_2"></label>&nbsp;
                                                                        <label id="div_sel_verb3_3"></label>&nbsp;
                                                                        <label id="div_sel_verb2_1"></label>&nbsp;
                                                                        <label id="div_sel_verb2_2"></label>&nbsp;
                                                                        <label id="div_sel_verb1"></label>&nbsp;
                                                                        <div id="radioDiv" style="float: left;">
                                                                            <input type="radio" id="rtype1" name="rtype" value="1" checked onclick="showRadio(1)"  >&nbsp;<label for="rtype1">数据</label>&nbsp;
                                                                            <input type="radio" id="rtype2" name="rtype" value="2" onclick="showRadio(2)" >&nbsp;<label for="rtype2">图形</label>&nbsp;
                                                                        </div>
                                                                        <a class="btn btn-success" title="下载变量解释" href="${pageContext.request.contextPath}/modeljzi/downParamExplain.page">变量解释</a>
                                                                        <%--<a class="btn btn-success" download="下载当前数据" href="#" onclick="downCurrentData()">当前数据</a>--%>
                                                                        <a class="btn btn-success" title="下载结果数据" href="#" onclick="allRunData()">结果下载</a>
                                                                        <a class="btn btn-success" title="AnalysGE结果" href="#" onclick="analysGE()">AnalysGE</a>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12" style="overflow-x:auto;overflow-y: hidden;background-color: #ffffff;">
                                                            <div id="csv-demo" style="text-align: center;"></div>
                                                            <div id="echarts-demo" style="width: 900px;height:520px; display: none" ></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <div style="position: relative;bottom: 0px;">
                                    <div style="float: left; display: none;" id="previous">
                                        <button type="button" class="btn btn-success" onclick="previous()">&lt;&lt;上一步
                                        </button>
                                    </div>
                                    <div style="float: right;" id="next">
                                        <button type="button" class="btn btn-success" onclick="next()">下一步&gt;&gt;
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../index/foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>


<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/fSelect/fSelect.js" type="text/javascript"></script>




<script type="text/javascript">

    //$('.demo').fSelect();
    var isRuned=false;
    var shorckType;
    var shorckS1;
    var shorckS2;
    var shorckS3;
    var shorckS4;
    var shorckDatas = {};
    var shorckMap = {};
    var jzMap = {};
    /*   var baseShorcks = ['pop',  'ams', 'atm', 'atf', 'ats', 'atd', 'aosec', 'aoreg', 'avasec',
           'avareg', 'afcom', 'afsec', 'afreg', 'afecom', 'afesec', 'afereg', 'aoall', 'afall',
           'afeall', 'au', 'to', 'tp', 'tm', 'tms', 'tx', 'txs', 'qo'];*/
    var baseShorcks=['pop', 'psaveslack','pfactwld' , 'profitslack', 'incomeslack','endwslack',
        'cgdslack', 'tradslack', 'ams' ,'atm' ,'atf', 'ats' ,'atd','aosec', 'aoreg',  'avasec',
        'avareg', 'afcom' ,'afsec' ,'afreg', 'afecom','afesec' ,'afereg' ,'aoall','afall',
        'afeall' , 'au', 'dppriv' ,'dpgov' ,'dpsave' , 'to', 'tp', 'tm' ,'tms', 'tx', 'txs',  'qo'];


    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        $(document).on("click", ".years li", function () {
            $(".years li").removeClass("active");
            $(this).addClass("active");
            getTimeLine($(this).data("id"));
        });
        /**
         *冲击列表输入数据改变
         * */
        $("#shorckTxt").text("Shock pfactwld = uniform 10;");
        $('#shorckTxt').bind('input',function(){
            isRuned=false;
        });
        shorckMap =${shorckMap};
        jzMap =${jzMap};
        // refSimulateSelect();
        getYears();
        $(".btn-ModelRunaddsave").bind("click", function () {
            var jzId = $("#jzId").val();
            var colsureType = $("#colsure").val();
            var closureTxt = $("#closureTxt").val();
            var shorckTxt = $("#shorckTxt").val();
            var runName = $("#runName").val();
            // var isValid = false;
            if (jzId == null || jzId == "") {
                PlatformCommonUtils.warn("请选择数据");
                return;
            }

            if (closureTxt == null || closureTxt == "") {
                PlatformCommonUtils.warn("请选择闭合");
                return;
            }
            if (shorckTxt == null || shorckTxt == "") {
                PlatformCommonUtils.warn("冲击列表不能为空");
                return;
            }else{
                //标准闭合中含有Shock pfactreal
                if(colsureType=="BookClosure"&&(shorckTxt.indexOf("Shock pfactreal"))!=-1){
                    PlatformCommonUtils.warn("标准闭合与Shock pfactreal存在冲突");
                    return;
                }
            }

            if (shorckValue == null || shorckValue == "") {
                PlatformCommonUtils.warn("请输入变化冲击");
                return;
            }

            if (runName == null || runName == "") {
                PlatformCommonUtils.warn("请输入标题");
                return;
            }else{
                $.ajax({
                    url: usercontextpath + '/modelruni/checkRunName.page',
                    type: "POST",
                    dataType: "json",
                    data: {"runName":runName},
                    async: false,
                    success: function (result) {
                        if(result!="0"){
                            PlatformCommonUtils.warn("标题已经存在，请重新输入!");
                            return;
                        }else{
                            $('form').ajaxSubmit(
                                {
                                    type: 'POST',
                                    url: usercontextpath + '/modelruni/runOnline.page',
                                    forceSync: false,
                                    data: {
                                        'colsure': $("#closureTxt").val(),
                                        'shorck': $("#shorckTxt").val(),
                                        'runname': $("#runName").val(),
                                        'jzid': $("#jzId").val(),
                                        'colsureType':$("#colsure").val(),
                                        'remark': $("#remark").val()
                                    },
                                    dataType: 'json',
                                    beforeSubmit: function () {
                                        $(".btn-ModelRunaddsave").attr('disabled',true);
                                        App.startPageLoading({message: '运行中...请稍等'});
                                    },
                                    error: function (xhr, ajaxOptions,
                                                     thrownError) {
                                        App.stopPageLoading();
                                        PDP.warn(thrownError);
                                        $(".btn-ModelRunaddsave").attr('disabled',false);
                                    },

                                    success: function (responseText,
                                                       statusText, xhr, $form) {

                                        window.setTimeout(function () {
                                            App.stopPageLoading();
                                        }, 500);
                                        $(".btn-ModelRunaddsave").attr('disabled',false);
                                        var msg = responseText;
                                        var title = '增加模型运行';
                                        var tiptype = "success";
                                        if (msg == 'success') {
                                            isRuned = true;
                                            msg = "模型运行完毕"
                                            PDP.success(msg, function () {
                                                $("#t_div_5").click();
                                            });
                                        } else {
                                            PlatformCommonUtils.warn(msg);
                                        }
                                    }
                                });
                        }
                    }
                });
            }
        });
    });


    var Colsure = {
        'BookClosure': '! Classic Run Closure\n' +
            'exogenous\n' +
            '          pop\n' +
            '          psaveslack pfactwld\n' +
            '          profitslack incomeslack endwslack\n' +
            '          cgdslack tradslack\n' +
            '          ams atm atf ats atd\n' +
            '          aosec aoreg avasec avareg\n' +
            '          afcom afsec afreg afecom afesec afereg\n' +
            '          aoall afall afeall\n' +
            '          au dppriv dpgov dpsave\n' +
            '          to tp tm tms tx txs\n' +
            '          qo(ENDW_COMM,REG) ;\n' +
            'Rest Endogenous ;\n',
        'SelfClosure': '! Base On  Classic Run Closure\n' +
            'exogenous\n' +
            '          pop\n' +
            '          psaveslack pfactwld\n' +
            '          profitslack incomeslack endwslack\n' +
            '          cgdslack tradslack\n' +
            '          ams atm atf ats atd\n' +
            '          aosec aoreg avasec avareg\n' +
            '          afcom afsec afreg afecom afesec afereg\n' +
            '          aoall afall afeall\n' +
            '          au dppriv dpgov dpsave\n' +
            '          to tp tm tms tx txs\n' +
            '          qo(ENDW_COMM,REG) ;\n' +
            'Rest Endogenous ;\n',
        'ShortClosure': '! Short Run Closure\n' +
            'exogenous\n' +
            '          pop\n' +
            '          psaveslack pfactwld\n' +
            '          profitslack incomeslack endwslack\n' +
            '          cgdslack tradslack\n' +
            '          ams atm atf ats atd\n' +
            '          aosec aoreg avasec avareg\n' +
            '          afcom afsec afreg afecom afesec afereg\n' +
            '          aoall afall afeall\n' +
            '          au dppriv dpgov dpsave\n' +
            '          to tp tm tms tx txs\n' +
            '          qo(ENDW_COMM,REG) ;\n' +
            'Rest Endogenous ;\n' +
            '\n' +
            'swap qo("sklab",REG) = pfactreal("sklab",REG);\n' +
            'swap qo("unsklab",REG) = pfactreal("unsklab",REG);'
    };



    function colsureChange(value) {
        if (value !== null) {
            $("#closureTxt").val(Colsure[value]);
            if(value=="SelfClosure"){
                $("#closureTxt").css("display", "block");
            }else{
                $("#closureTxt").css("display", "none");
            }
        }
        isRuned = false;
        // clearShocks();
        initShockType();
    }
    function setTab(id) {
        if (id == 1) {
            $("#previous").hide();
            $("#next").show();
        } else if (id == 2){
            getYears();
        } else if (id == 5) {
            $("#previous").show();
            $("#next").hide();
        } else {
            $("#previous").show();
            $("#next").show();
        }

        if (id == 5) {
            if(jstree == null) {
                jstree =  ajaxTreeSample();
                $("#div_table").show();
            }else {
                jstree.jstree(true).refresh();
            }
        }

        for (var i = 0; i < id; i++) {
            $("#t_div_" + i).removeClass("active");
            $("#t_div_" + i).addClass("done");
        }

        $("#t_div_" + id).addClass("active");

    }

    /**
     * 选择冲击大类-同步联动子类
     * @param value
     * 1、全局变量清空
     * 2、清空所有select
     * 3、style  displany none
     * */
    function shockTypeChange(value) {
        debugger;
        if ($("#jzId").val() == "" || $("#jzId").val() == null) {
            PlatformCommonUtils.warn("请选择数据！");
            return;
        } else {
            shorckType = value , shorckS1 = "", shorckS2 = "";
            shorckS3 = "", shorckS4 = "";
            $("select[id^='sel_shorck'] option").remove();
            $("div[id^='div_']").css("display", "none");
            $("#shorckTypeReamrk").text("");
            $("#shorckTypeReamrkCn").text("");
            if (shorckType !== null) {
                var obj = $.extend({}, shorckMap[shorckType]);
                if ("qo" == shorckType) {
                    obj.shorckS1 = "ENDW_COMM";
                    obj.shorckS2 = "REG";
                }
                obj.remark = $("#jzId").val();
                obj.clousreType=$("#colsure").val();
                $("#shorckTypeReamrk").text(shorckMap[shorckType].remark);
                $("#shorckTypeReamrkCn").text(shorckMap[shorckType].remarkCn);
                $.ajax({
                    url: usercontextpath + '/modelruni/getShorckElement.page',
                    type: "POST",
                    dataType: "json",
                    data: obj,
                    async: false,
                    success: function (result) {
                        shorckDatas = result;
                    }
                });
                shorckS1 = obj.shorckS1;
                $("#div_main").css("display", "block");
                $("#div_shorck1").css("display", "block");

                var sel_shorck1 = $('#sel_shorck1');

                $.each(shorckDatas[shorckS1], function (n, value) {
                    var option = $("<option value='" + value + "'>" + value + "</option>");
                    option.appendTo(sel_shorck1);
                });
            } else {
                return;
            }
            if (obj.shorckS2 != null && obj.shorckS2 != "") {
                shorckS2 = obj.shorckS2;
                $("#div_shorck2").css("display", "block");

                var sel_shorck2 = $('#sel_shorck2');
                $.each(shorckDatas[shorckS2], function (n, value) {
                    var option = $("<option value='" + value + "'>" + value + "</option>");
                    option.appendTo(sel_shorck2);
                });
            } else {
                return;
            }
            if (obj.shorckS3 != null && obj.shorckS3 != "") {
                shorckS3 = obj.shorckS3;
                $("#div_shorck3").css("display", "block");

                var sel_shorck3 = $('#sel_shorck3');
                $.each(shorckDatas[shorckS3], function (n, value) {
                    var option = $("<option value='" + value + "'>" + value + "</option>");
                    option.appendTo(sel_shorck3);
                });
            } else {
                return;
            }
            if (obj.shorckS4 != null && obj.shorckS4 != "") {
                shorckS4 = obj.shorckS4;
                $("#div_shorck4").css("display", "block");

                var sel_shorck4 = $('#sel_shorck4');
                $.each(shorckDatas[shorckS4], function (n, value) {
                    var option = $("<option value='" + value + "'>" + value + "</option>");
                    option.appendTo(sel_shorck4);
                });
            } else {
                return;
            }
        }
    }

    function zjChange(value) {
        $("#jzTime").text("");
        $("#jzTxt").text("");
        $("#jzTime").text(jzMap[value].creatDate);
        $("#jzTxt").text(jzMap[value].remark);
    }

    function addToShorckList() {
        var datas = getShockElemData();
        var shorckValue = $("#shorckValue").val();
        if (shorckValue == null || shorckValue == "") {
            PlatformCommonUtils.warn("请输入变化冲击值");
            return;
        }
        isRuned = false;
        toComby(datas, shorckValue);
    }

    function getShockElemData() {
        var elemsShork = [];
        $("select[id^='sel_shorck']").each(function () {
            var v = $(this).val();
            if (v != "null" && v != "") {
                elemsShork.push(v);
            }
        });
        return elemsShork;
    }

    function toComby(shorckElems, shoockVlaue) {
        var formula = 'Shock $type($shorckEles)= $shorckValue';
        var shorckEleStr = "";
        var shorckValStr = "";
        var re = /^All/;
        var isAll = false;
        for (var i = 0; i < shorckElems.length; i++) {
            var se = shorckElems[i];
            if (se != null && se != "") {
                if (se.match(re)) {
                    isAll = true;
                    shorckEleStr += se.replace("All", "").trim() + ',';
                } else {
                    shorckEleStr += '"' + se + '",';
                }
            }
        }
        if (isAll) {
            shorckValStr = 'uniform ' + shoockVlaue + ';';
        } else {
            shorckValStr = shoockVlaue + ';';
        }
        var shorckTxt = formula.replace("$type", shorckType).replace("$shorckEles", shorckEleStr.substring(0, shorckEleStr.length - 1)).replace("$shorckValue", shorckValStr);
        if ($("#shorckTxt").val() != null && $("#shorckTxt").val() != "") {
            $("#shorckTxt").val($("#shorckTxt").val() + "\n" + shorckTxt);
        } else {
            $("#shorckTxt").val(shorckTxt);
        }

    }

    function clearShorckList() {
        $("#shorckTxt").val("");
        isRuned = false;
    }

    /**
     * 初始化加总数据列表
     */
    /*    function initJZList() {
            var jzSel = $('#zjlist');
            $.each(jzMap,function(k,v) {
                var option = $("<option value='" + k + "'>" + v.jzTitle + "</option>");
                option.appendTo(jzSel);
            });
        }*/
    /**
     * 初始化冲击类型
     */
    function initShockType() {

        var shockType = $('#shockType');
        shockType.append("<option >--请选择--</option>");
        for (var i = 0; i < baseShorcks.length; i++) {
            var option = $("<option value='" + baseShorcks[i] + "'>" + baseShorcks[i] + "</option>");
            option.appendTo(shockType);
        }
        if($("#colsure").val()=="ShortClosure"){
            shockType.append("<option value='pfactreal'>pfactreal</option>")
        }
    }
    function clearShocks(){
        $("select[id='shockType'] option").remove();
        $("select[id^='sel_shorck'] option").remove();
        $("div[id^='div_']").css("display", "none");
        $("#shorckTypeReamrk").text("");
        $("#shorckTypeReamrkCn").text("");
        $("#shorckValue").val("");
        //$("#shorckTxt").val("Shock pfactwld = uniform 10;");
    }

    function uploadFile() {
        ModelDialog.dialog({
            title: "上传加总文件",
            showfooter: false,
            url: usercontextpath + "/modeljzi/toIndexJzFile.page",
            width: "700px",
            height: "450px"
        });
    }

    function addAgg() {
        var w= document.body.clientWidth-50;
        var h = window.screen.availHeight-150;//document.body.clientHeight-500;
        //varwindow.screen.availHeight // 屏幕可用工作区高度：
        //window.screen.availWidth  //屏幕可用工作区宽度：
        ModelDialog.dialog({
            title: "配置加总",
            showfooter: false,
            url: usercontextpath + "/modeljzi/toIndexAddJzMain.page",
            //width: "1340px",
            width: w + "px",
            height: h+"px"
        });
    }

    //导入加总
    function impAgg() {
        ModelDialog.dialog({
            title: "导入分类",
            showfooter: false,
            url: usercontextpath + "/modeljzi/toImpAgg.page",
            width: "700px",
            height:"370px"
        });
    }

    //导入案例
    function impCase() {
        ModelDialog.dialog({
            title: "导入案例",
            showfooter: false,
            url: usercontextpath + "/modeljzi/toImpCase.page",
            width: "700px",
            height:"370px"
        });
    }


    //导出加总
    function expAgg(jzId) {
        window.open(usercontextpath + "/modeljzi/expAggExcel.page?jzId=" + jzId);
    }

  //导出加总
    function expCase(jzId,runId) {
        window.open(usercontextpath + "/modeljzi/expCaseExcel.page?jzId=" + jzId+"&runId="+runId);
    }





    var jstree  = null;


    function selectTab() {
        // refSimulateSelect();
        getYears();
        $("#t_div_3").click();

    }

    function previous() {
        var tab_ = $(".tab-pane.fade.active.in").attr("id").replace("tab_", "") * 1;
        $("#next").show();
        $("#t_div_" + (tab_ - 1)).click();
        if (tab_ == 2) $("#previous").hide();
    }

    function next() {
        var tab_ = $(".tab-pane.fade.active.in").attr("id").replace("tab_", "") * 1;
        $("#previous").show();
        if(tab_==4&&!isRuned){
            PlatformCommonUtils.warn("未运行求解！");
            return;
        }else if (tab_ == 5){
            $("#next").hide();
        }
        $("#t_div_" + (tab_ + 1)).click();
    }

    function selectAgg(val, title) {

        PDP.confirm("确定选择『" + title + "』模型数据吗?", function (isConfirm) {
            if (isConfirm) {
                $("#jzId").val(val);
                $("#colsure").val("");
                clearShocks();
                PDP.success("模型加总数据选择成功!");
                $("#t_div_3").click();
            }
        });


    }




    function refSimulateSelect() {
        var url = usercontextpath + '/modeljzi/refSimulateSelect.page';
        $.post(url, {},
            function (json) {
                if (json != null && json.length > 0) {
                    $("#main-timeline").html("");
                    for (var i = 0; i < json.length; i++) {
                        var html = '<div class="timeline" ><div class="timeline-content" style="cursor:pointer;" onclick="selectAgg(\'' + json[i].mdId + '\',\'' + json[i].jzTitle + '\')">' +
                            '<span class="date"><span class="day">' + json[i].day + '<sup>th</sup></span><span class="month">' + json[i].month + '</span><span class="year">' + json[i].year + '</span></span>' +
                            '<h2 class="title">' + json[i].jzTitle + '</h2><p class="description">' + json[i].remark + '</p></div></div>';
                        $("#main-timeline").append(html);
                    }
                } else {
                    $("#main-timeline").html("");
                    $("#main-timeline").append("<div style='text-align: center;'><a onclick='toAgg()' ><h4 style='color: blue;'>请点击此处配置加总</h4></a></div>");

                }
            });
    }

    //选择tab跳转至加总弹出配置框
    function toAgg() {
        $("#t_div_2").click();
        addAgg();
    }


    function showInfo(runId) {
        ModelDialog.dialog({
            title: "详情信息",
            showfooter: false,
            url: usercontextpath + "/modelruni/getModelRun.page",
            params: {
                "runId": runId
            },
            width: "800px",
            height: "600px"
        });
    }



    function downFile(runId) {
        // window.open(usercontextpath + "/modelrun/downloadRunRS.page?runId="+runId);
        window.open(usercontextpath + "/modelruni/downloadRumData.page?runId=" + runId);

    }

    function downloadMFile() {
        window.open(usercontextpath + "/modeljzii/downloadAggModule.page");
    }

    function downCurrentData(){
        if(currentNode==null){
            PlatformCommonUtils.warn("请选择数据!");
            return;
        }else{
            // window.location.href=(usercontextpath + "/modelrun/downloadCSVData.page?runId=" + currentNode.id+ "&csv=" + currentNode.original.csv+ "");
            window.location.href=(usercontextpath + "/modelruni/downloadCSVData.page?runId=" + currentNode.id+ "&csv=" + currentNode.original.csv+ "");
        }
    }

    function allRunData(){
        if(currentNode==null){
            PlatformCommonUtils.warn("请选择数据!");
            return;
        }else{
            window.location.href=(usercontextpath + "/modelruni/downloadRumData.page?runId=" + currentNode.id);
        }
    }


    function analysGE(){
        if(currentNode==null){
            PlatformCommonUtils.warn("请选择数据!");
            return;
        }else{
            window.location.href=(usercontextpath + "/modelruni/downloadAnalysGE.page?runId=" + currentNode.id);
        }
    }

    //获取时间轴内容
    function getTimeLine(yearMouth) {
        if (!yearMouth) {
            $("#vertical-timeline").html("");
        } else {
            var url = usercontextpath + '/modeljzi/refSimulateSelect.page';
            $.post(url, {"yearMouth":yearMouth},
                function (data) {
                    if (data != null && data.length > 0) {
                        var timeLine = '';
                        for (var i = 0; i < data.length; i++) {
                            var optnStr = "";
                            var d =  data[i].creatDate == null ? "" :  data[i].creatDate.substr(0,10)

                            if(data[i].isSymbol!="1"){
                                //optnStr ='<a class="btn btn-xs red btn-delContent" href="#" onclick="delAgg(\'' + data[i].jzId + '\',\'' + data[i].jzTitle + '\')">&nbsp;&nbsp;删除</a>';
                                optnStr ='<div class="btn-group" style="float:right" id="btn_opera_'+i+'" >'
                                    +'<a class="btn red dropdown-toggle" data-toggle="dropdown" href="javascript:;" onclick="operateAgg(\'' + i + '\')" > 操作'
                                    +'<i class="fa fa-angle-down"></i>'
                                    +'</a><ul class="dropdown-menu">'
                                    +'<li><a href="javascript:;" onclick="expAgg(\'' + data[i].jzId + '\')" > 导出分类</a></li>'
                                    +'<li><a href="javascript:;" onclick="toReName(\'' + data[i].jzId + '\')"> 重命名</a></li>'
                                    +'<li><a href="javascript:;" onclick="delAgg(\'' + data[i].jzId + '\',\'' + data[i].jzTitle + '\')"> 删除</a></li>'
                                    +'</ul></div>'

                            }else{
                                //optnStr ='<a class="btn btn-xs green btn-delContent" href="#" onclick="loadAgg(\'' + data[i].mdId + '\',\'' + data[i].jzTitle + '\')">&nbsp;&nbsp;载入完整案例</a>';
                                optnStr ='<div class="btn-group" style="float:right" id="btn_opera_'+i+'" >'
                                    +'<a class="btn red dropdown-toggle" data-toggle="dropdown" href="javascript:;" onclick="operateAgg(\'' + i + '\')"> 操作'
                                    +'<i class="fa fa-angle-down"></i>'
                                    +'</a><ul class="dropdown-menu">'
                                    +'<li><a href="javascript:;" onclick="loadAgg(\'' + data[i].mdId + '\',\'' + data[i].jzTitle + '\')"> 载入完整案例</a></li>'
                                    +'<li><a href="javascript:;" onclick="expAgg(\'' + data[i].jzId + '\')"> 导出分类</a></li>'
                                   /* +'<li><a href="javascript:;" onclick="expCase(\'' + data[i].jzId + '\')"> 导出完整案例</a></li>'*/
                                    +'</ul></div>'

                            }
                            timeLine += '<div class="vertical-timeline-block" id="'+data[i].jzId+'">';
                            timeLine += '<div class="vertical-timeline-icon navy-bg">';
                            // timeLine += '    <i class="fa fa-circle"></i>';
                            timeLine += '</div>';
                            timeLine += '<div class="vertical-timeline-content"  >';
                            timeLine = timeLine+optnStr+'<h2 style="cursor:pointer; width: 600px;" onclick="selectAgg(\'' + data[i].mdId + '\',\'' + data[i].jzTitle + '\')">' + data[i].jzTitle + '</h2>';

                            timeLine += '    <p>';
                            timeLine += (data[i].remark ? data[i].remark : '');
                            timeLine += '    </p>';
                            timeLine += '    <span class="vertical-date">' + d + '</span>';
                            timeLine += '</div>';
                            timeLine += '</div>';
                        }
                        $("#vertical-timeline").html(timeLine);
                    }
                }
            );
        }
    }

    //获取年份
    function getYears() {
        $.ajax({
            url: usercontextpath + '/modeljzi/getYearMouth.page',
            type: "POST",
            async: false,
            success: function (obj) {
                if (obj.length>0) {
                    var years = '<ul>';
                    for (var i = 0; i < obj.length; i++) {
                        if(i==0){
                            years += '<li class="active" data-id="'+obj[i]+'"><a href="javascript:void(0)">'+obj[i]+'</a></li>';
                        }else{
                            years += '<li data-id="'+obj[i]+'"><a href="javascript:void(0)">'+obj[i]+'</a></li>';
                        }
                    }
                    years += '</ul>';
                    $(".years").html(years);
                    getTimeLine($(".years li").eq(0).data("id"));
                }
            }
        });
    }
    function checkName() {
        var runName = $("#runName").val();
        if (runName == null || runName == "") {
            PlatformCommonUtils.warn("请输入标题");
            return;
        }else{

            $.ajax({
                url: usercontextpath + '/modelruni/checkRunName.page',
                type: "POST",
                dataType: "json",
                data: {"runName":runName},
                async: false,
                success: function (result) {
                    if(result!="0"){
                        PlatformCommonUtils.warn("标题已经存在，请重新输入!");
                        return;
                    }
                }
            });
        }
    }


    function loadAgg(id, title){

        var w= document.body.clientWidth-50;
        var h = window.screen.availHeight-150;//document.body.clientHeight-500;
        //varwindow.screen.availHeight // 屏幕可用工作区高度：
        //window.screen.availWidth  //屏幕可用工作区宽度：
        PDP.confirm("确定载入『" + title + "』吗?", function (isConfirm){
            if(isConfirm)
            {
                $.post(usercontextpath + '/modelruni/getModelRunByMdid.page',
                    $.param( {
                        "mdid": id
                    },true),
                    function(data){
                        $("#colsure").val(data.colsureType);
                        $("#colsure").trigger("change");
                        $("#closureTxt").text(data.runColsure);
                        $("#shorckTxt").text(data.runShorck);
                        $("#runName").val(data.runName);
                        $("#remark").val(data.remark);
                        ModelDialog.dialog({
                            title: "配置加总",
                            showfooter: false,
                            url: usercontextpath + "/modeljzi/toIndexAddJzMain.page?caseID="+id,
                            width: w + "px",
                            height: h+"px"
                        });
                        PDP.success("加载成功，请等待配置完创建数据!");
                    });
            }
        });


        /*  PDP.confirm("确定载入" + title + "模型设置吗?", function (isConfirm) {
              if (isConfirm) {
                  //  App.startPageLoading({message: '请稍等。。。'});
                  $.ajax({
                      url: usercontextpath + '/modelrun/getModelRunByMdid.page',
                      type: "POST",
                      async: false,
                      data:{"mdid": id},
                      success: function (data) {
                          $("#colsure").val(data.colsureType);
                          $("#colsure").trigger("change");
                          $("#closureTxt").text(data.runColsure);
                          $("#shorckTxt").text(data.runShorck);
                          $("#runName").val(data.runName);
                          $("#remark").val(data.remark);
                          ModelDialog.dialog({
                              title: "配置加总",
                              showfooter: false,
                              url: usercontextpath + "/modeljzi/toIndexAddJzMain.page?caseID="+id,
                              width: w + "px",
                              height: h+"px"
                          });
                          PDP.success("加载成功，请等待配置完创建数据!");
                      }
                  });
              }
          });*/
    }
    function delAgg(id, title) {
        $.post( usercontextpath + '/modeljzi/getAggModelRunNo.page', {"jzId": id},
            function (data) {
                var msgStr="";
                if(data.length>0){msgStr=",其包含"+data.length+"条运行数据？"};
                PDP.confirm("确定删除数据『" + title + "』"+ msgStr, function (isConfirm) {

                    if (isConfirm) {
                        $.post( usercontextpath + '/modeljzi/deleteJzMain.page', {"jzId": id},
                            function (data) {
                                if(data == "success") {
                                    window.setTimeout(function () {
                                        PDP.success("删除成功!");
                                    }, 1000);
                                    $("#"+id).remove();
                                }else {
                                    PlatformCommonUtils.warn("删除失败!");
                                    return;
                                }
                            });
                    }
                });
            });
    }

    function toReName(id) {
        ModelDialog.dialog({
            title: "重命名",
            showfooter: false,
            url: usercontextpath + "/modeljzi/toReName.page?jzId="+id,
            width: "500px",
            height:"220px"
        });
    }


</script>
<script>
    var currentNode=null ;
    var iA = [];
    var tA = [];
    var initCsv = [];

    var SERIES = [];
    var VALUE = [];

    var VERB1 = [];

    var VERB2_1 = [];
    var VERB2_2 = [];


    var VERB3_1 = [];
    var VERB3_2 = [];
    var VERB3_3 = [];

    var runErr = [];
    var fistNode = 0;

    var ajaxTreeSample = function () {
        return  $("#tree-demo").jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                },
                // so that create works
                "check_callback" : true,
                'data' : {
                    'url' : function (node) {
                        return usercontextpath + '/modeljzi/refSimulateTree.page?id='+node.id+"&parent="+node.parent;
                    },
                    'data' : function (node) {
                        return { 'parent' : node.id};
                    },
                    'success': function (retvel) {
                        fistNode = retvel[0].id;

                        for (var key in retvel) {
                            if (retvel.hasOwnProperty(key)) {
                                var c = retvel[key].children;
                                if(c == false) {
                                    var i = retvel[key].id;
                                    var t = retvel[key].title;
                                    iA.push(i);
                                    tA.push(t);
                                }
                            }
                            if(retvel[key].runStatus == '0'||retvel[key].runStatus == '9') {
                                var id = retvel[key].id;
                                runErr.push(id)
                            }


                        }
                    }
                }
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            },
            "state" : { "key" : "demo3" },
            "plugins" : ["contextmenu","dnd", "state", "types" ],
            "contextmenu": {
                'items' : customMenu
            },
        }).bind("select_node.jstree", function(event, data) {
            var inst = data.instance;
            var selectedNode = inst.get_node(data.selected);
            var level = $("#"+selectedNode.id).attr("aria-level");

            if(parseInt(level) == 1){
                currentNode = selectedNode;
            }else if(parseInt(level) == 3){
                currentNode = selectedNode;
                /* if(runStatus!="1"){  如果运行未成功，提示查看日志
                   PlatformCommonUtils.warn("未运行成功，请选择运行结果右键下载查看日志!");
                   return;
               }else{
                    查询结果csv
               }*/
                $.ajax({
                    url : usercontextpath + '/modeljzi/readCsvToMap.page',
                    data:{"id":selectedNode.id,"csv":selectedNode.original.csv},
                    dataType : "json",
                    type : "POST",
                    success : function(data) {
                        if(data) {
                            handleInitCsv(data.csv);
                            var vd = currentNode.original.dimension;
                            if(vd!=0){
                                $(":radio[name='rtype'][value='1']").prop("checked", "checked");
                            }
                            // $("#rtype1").attr("checked","checked");
                            $("#echarts-demo").hide();
                            $("#csv-demo").show()
                            showCsv(data.csv);
                            //ECharts(data,selectedNode);
                        }else{
                            $("#echarts-demo").html("暂无数据！");
                        }
                    }
                });


            }
        }).on("open_node.jstree", function (e, data) {


            for (var i in iA) { //title显示
                $("#" + iA[i] + "_anchor").attr("title",tA[i]);
            }

            for (var i in runErr) { //运行错误，字体颜色标红
                $("#" + runErr[i] + "_anchor").css("color","#ff1e20");
            }

            var runStatus = data.node.original.runStatus;
            if(runStatus == '0'||runStatus == '9') {
                PlatformCommonUtils.warn("红色文件夹表示模拟结果出错，请右键查看日志！");
                return;
            }


        }).on("ready.jstree", function (event, data) {
            data.instance.open_node(fistNode);  //默认打开第一个节点
        });


    }

    function customMenu(node) {

        if (node.parent == '#') {
            var items={};
            if(node.original.isSymbol=="1"){
                items = {
                    'case' : {
                        'label' : '导出案例',
                        'action' : function (obj) {
                            expCase(node.original.jzId,node.id)
                        }
                    },
                    'info' : {
                        'label' : '运行详情',
                        'action' : function (obj) {
                            showInfo(node.id)
                        }
                    },
                    'log' : {
                        'label' : '日志下载',
                        'action' : function (obj) {
                            //window.location.href=(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
                            window.open(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
                        }
                    }
                }
            }else{
                items = {
                    'case' : {
                        'label' : '导出案例',
                        'action' : function (obj) {
                            expCase(node.original.jzId,node.id)
                        }
                    },
                    'info' : {
                        'label' : '运行详情',
                        'action' : function (obj) {
                            showInfo(node.id)
                        }
                    },
                    'log' : {
                        'label' : '日志下载',
                        'action' : function (obj) {
                            //window.location.href=(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
                            window.open(usercontextpath + "/modelruni/downloadRunLog.page?runId=" + node.id);
                        }
                    },
                    'del' : {
                        'label' : '数据删除',
                        'action' : function (obj) {

                            PDP.confirm("确定删除『" + node.text + "』 数据吗?", function (isConfirm) {
                                if (isConfirm) {
                                    $.post( usercontextpath + '/modelruni/deleteModelRun.page', {"runId": node.id},
                                        function (data) {
                                            if(data == "success") {
                                                PDP.success("删除成功!");
                                                var inst = jQuery.jstree.reference(obj.reference);
                                                inst.delete_node(obj.reference);
                                            }else {
                                                PlatformCommonUtils.warn("删除失败!");
                                                return;
                                            }
                                        });
                                }
                            });
                        }
                    }
                }
            }

            return items;
        }

    }

    function isInArray(arr,value){
        for(var i = 0; i < arr.length; i++){
            if(value === arr[i]){
                return true;
            }
        }
        return false;
    }

    function reUnionArray(arr,row,col,arr2){

        var temp = [];
        for(var i = row; i < arr.length; i++){
            var key = arr[i].split(",")[col];
            if(arr2 != null) {
                for(var j = 0;j <arr2.length;j++) {
                    if(key == arr2[j]) {
                        temp.push(arr[i]);
                    }
                }
            }else {
                temp.push(arr[i]);
            }

        }
        return temp;
    }

    function reUnionValArray(verb2_1,verb2_2,arr){

        for(var i = 0; i < arr.length; i++){
            var key0 = arr[i].split(",")[0];
            var key1 = arr[i].split(",")[1];
            var val = arr[i].split(",")[2];

            if((key0 == verb2_1) && (key1 == verb2_2)) {
                return val;
            }
        }

        return null;
    }

    function reUnionValArray2(verb3_2,verb3_3,arr){

        for(var i = 0; i < arr.length; i++){
            var key0 = arr[i].split(",")[1];
            var key1 = arr[i].split(",")[2];
            var val = arr[i].split(",")[3];

            if((key0 == verb3_2) && (key1 == verb3_3)) {
                return val;
            }
        }

        return null;
    }

    function handleInitCsv(data) {
        initCsv = [];
        initCsv = data; //保存原始数据；
        var dimension = currentNode.original.dimension;
        var rows = data.length;
        var cols = data[0].split(",").length;
        if(dimension == 0) {
            $("#radioDiv").hide();
            $('label[id^="div_sel_"]').html("");
            /* VALUE = [];
             VERB1 = [];
             for(var i = 1; i < rows; i++ ){
                 var val = data[i].split(",")[0];
                 VALUE.push(isNumber(val));
                 VERB1.push("值");
             }
             $('label[id^="div_sel_"]').html("");
             ECharts0Or1();*/
        }

        if(dimension == 1) {
            $("#radioDiv").show();
            VALUE = [];
            VERB1 = [];
            var label = data[0].split(",")[0];
            for(var i = 1; i < rows; i++ ){
                var key = data[i].split(",")[0];
                var val = data[i].split(",")[1];
                VERB1.push(key);
                VALUE.push(isNumber(val));
            }

            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb1").html(label+":&nbsp;");
            createSelect('sel_verb1',VERB1);
            ECharts0Or1();

        }

        if(dimension == 2) {
            $("#radioDiv").show();
            VERB2_1 = [];
            VERB2_2 = [];
            SERIES =[];

            var label1 = data[0].split(",")[0];
            var label2 = data[0].split(",")[1];

            for(var i = 1; i < rows; i++ ){
                var key0 = data[i].split(",")[0];
                var key1 = data[i].split(",")[1];
                // var val = data[i].split(",")[2];

                if(!isInArray(VERB2_1,key0)) {
                    VERB2_1.push(key0);
                }

                if(!isInArray(VERB2_2,key1)) {
                    VERB2_2.push(key1);
                }

            }
            for (var i = 0;i< VERB2_1.length;i++) {
                var data = []
                for(var j = 0;j<VERB2_2.length;j++) {
                    var v = reUnionValArray(VERB2_1[i],VERB2_2[j],initCsv);
                    if( v != null) {
                        data.push(v);
                    }
                }
                SERIES.push({name: VERB2_1[i], type: 'bar', data: data});
            }


            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb2_1").html(label1+":&nbsp;");
            createSelect('sel_verb2_1',VERB2_1);

            $("#div_sel_verb2_2").html(label2+":&nbsp;");
            createSelect('sel_verb2_2',VERB2_2);

            ECharts02(VERB2_1,VERB2_2);

        }

        if(dimension == 3) {
            $("#radioDiv").show();
            var label1 = data[0].split(",")[0];
            var label2 = data[0].split(",")[1];
            var label3 = data[0].split(",")[2];


            VERB3_1 = [];
            VERB3_2 = [];
            VERB3_3 = [];
            SERIES =[];

            for(var i = 1; i < rows; i++ ){
                var key0 = data[i].split(",")[0];
                var key1 = data[i].split(",")[1];
                var key2 = data[i].split(",")[2];

                if(!isInArray(VERB3_1,key0)) {
                    VERB3_1.push(key0);
                }

                if(!isInArray(VERB3_2,key1)) {
                    VERB3_2.push(key1);
                }
                if(!isInArray(VERB3_3,key2)) {
                    VERB3_3.push(key2);
                }

            }


            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb3_1").html(label1+":&nbsp;");
            createSelect('sel_verb3_1',VERB3_1);

            $("#div_sel_verb3_2").html(label2+":&nbsp;");
            createSelect('sel_verb3_2',VERB3_2);

            $("#div_sel_verb3_3").html(label3+":&nbsp;");
            createSelect('sel_verb3_3',VERB3_3);


            /* if(sel_verb3_1 == null) {
                 sel_verb3_1 = VERB3_1;
             }
             if(sel_verb3_2 == null) {
                 return;
             }

             if(sel_verb3_3 == null) {
                 return;
             }*/
            var xAxis = [];

            for (var i = 0;i< VERB3_2.length;i++) {

                for(var j = 0;j<VERB3_3.length;j++) {
                    var x = VERB3_2[i]+"&"+VERB3_3[j];
                    var v = reUnionValArray2(VERB3_2[i],VERB3_3[j],initCsv);
                    if( v != null) {
                        xAxis.push(x);
                    }
                }
            }



            for(var i = 0;i<VERB3_1.length;i++) {
                var data = [];
                for(var j = 1;j<initCsv.length;j++) {
                    var key = initCsv[j].split(",")[0];
                    var key1 = VERB3_1[i];
                    if(key == key1) {
                        data.push(isNumber(initCsv[j].split(",")[3]));
                    }

                }

                SERIES.push({name: VERB3_1[i], type: 'bar', data: data});
            }


            ECharts03(xAxis,VERB3_1);
        }



    }






    function createSelect(id,data) {
        var select = document.createElement("select");
        select.setAttribute('id',id);
        select.setAttribute('multiple','multiple');
        for(var i = 0;i<data.length;i++) {
            select.options[i] = new Option(data[i], data[i]);
        }

        $("#div_"+id).append(select);
        $("#"+id).fSelect();

        $("#"+id).bind("change", function(){
            handleSel($("#"+id).val())
        })

    }


    function handleSel(v) {
        var dimension = currentNode.original.dimension;
        if(dimension == 1) {
            if(v != null) {
                VALUE = [];
                VERB1 = [];
                var temCsv = [];

                temCsv.push(initCsv[0]);
                for(var i = 1; i < initCsv.length; i++ ){
                    var reg = initCsv[i].split(",")[0];
                    var val = initCsv[i].split(",")[1];

                    for(var j = 0; j < v.length;j++)

                        if(reg == v[j]) {
                            VERB1.push(reg);
                            VALUE.push(isNumber(val));
                            temCsv.push(initCsv[i]);
                        }

                }
                showCsv(temCsv);
                ECharts0Or1();
            }else {
                showCsv(initCsv);
                handleInitCsv(initCsv)
            }
        }

        if(dimension == 2) {
            var sel_verb2_1 = $("#sel_verb2_1").val();
            var sel_verb2_2 = $("#sel_verb2_2").val();
            if(sel_verb2_1 == null) {
                sel_verb2_1 = VERB2_1;
            }
            if(sel_verb2_2 == null) {
                sel_verb2_2 = VERB2_2;
            }
            SERIES =[];
            var temCsv = [];
            temCsv.push(initCsv[0]);
            var uArr = reUnionArray(initCsv,1,0,sel_verb2_1);
            var uArr2 = reUnionArray(uArr,0,1,sel_verb2_2);
            temCsv = temCsv.concat(uArr2);

            for (var i = 0;i< sel_verb2_1.length;i++) {
                var data = [];
                for(var j = 0;j<sel_verb2_2.length;j++) {
                    var v = reUnionValArray(sel_verb2_1[i],sel_verb2_2[j],temCsv);
                    if( v != null) {
                        data.push(isNumber(v));
                    }
                }
                SERIES.push({name: sel_verb2_1[i], type: 'bar', data: data});
            }
            showCsv(temCsv);
            ECharts02(sel_verb2_1,sel_verb2_2);

        }

        if(dimension == 3) {
            var sel_verb3_1 = $("#sel_verb3_1").val();
            var sel_verb3_2 = $("#sel_verb3_2").val();
            var sel_verb3_3 = $("#sel_verb3_3").val();


            SERIES =[];
            var temCsv = [];
            temCsv.push(initCsv[0]);
            var uArr = reUnionArray(initCsv,1,0,sel_verb3_1);
            var uArr2 = reUnionArray(uArr,0,1,sel_verb3_2);
            var uArr3 = reUnionArray(uArr2,0,2,sel_verb3_3);
            temCsv = temCsv.concat(uArr3);
            showCsv(temCsv);



            if(sel_verb3_1 == null) {
                sel_verb3_1 = VERB3_1
            }
            if(sel_verb3_2 == null) {
                sel_verb3_2 = VERB3_2
            }

            if(sel_verb3_3 == null) {
                sel_verb3_3 = VERB3_3
            }
            var xAxis = [];

            for (var i = 0;i< sel_verb3_2.length;i++) {

                for(var j = 0;j<sel_verb3_3.length;j++) {
                    var x = sel_verb3_2[i]+"&"+sel_verb3_3[j];
                    var v = reUnionValArray2(sel_verb3_2[i],sel_verb3_3[j],temCsv);
                    if( v != null) {
                        xAxis.push(x);
                    }
                }
            }



            for(var i = 0;i<sel_verb3_1.length;i++) {
                var data = [];
                for(var j = 1;j<temCsv.length;j++) {
                    var key = temCsv[j].split(",")[0];
                    var key1 = sel_verb3_1[i];
                    if(key == key1) {
                        data.push(isNumber(temCsv[j].split(",")[3]));
                    }

                }

                SERIES.push({name: sel_verb3_1[i], type: 'bar', data: data});
            }


            ECharts03(xAxis,sel_verb3_1);

        }

    }



    function showCsv(data) {
        $("#csv-demo").html("");
        var rows = data.length;
        var cols = data[0].split(",").length;
        var tableNode = document.createElement("table");//获得对象
        tableNode.setAttribute("class","table table-bordered");


        var trNode1 = tableNode.insertRow();
        trNode1.setAttribute("bgcolor","#F0FFFF")
        var tdNode1 = trNode1.insertCell();
        tdNode1.setAttribute("colspan",cols);
        tdNode1.innerHTML ="<h4>"+ currentNode.original.title + '('+currentNode.original.unit+')'+"</h4>";


        for(var i = 0; i < rows; i++ ){
            var trNode = tableNode.insertRow();
            if(i == 0) {
                trNode.setAttribute("bgcolor","#F0FFFF")
            }

            for(var y = 0;y < cols;y++){
                var tdNode = trNode.insertCell();
                var val = data[i].split(",")[y];
                tdNode.innerHTML = isNumber(val);
            }
        }

        document.getElementById("csv-demo").appendChild(tableNode);//添加到那个位置

    }



    function isNumber(val){
        var loc = val.indexOf(".");
        if( loc > 0) {
            var num = new Number(val);
            return num.toFixed(2) ;
        }else {
            return val;
        }
    }

    function ECharts0Or1(){
        var myChart = echarts.init(document.getElementById('echarts-demo'));

        // var rootId = currentNode.id.split('_')[0];
        // var rootName = $("#"+rootId+"_anchor").text();
        option = {
            title : {
                x:'center',
                text: currentNode.original.title + '('+currentNode.original.unit+')'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                y:'bottom',
                data:[currentNode.text]
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: false, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : false,
            xAxis : [
                {
                    type : 'category',
                    data : VERB1
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:currentNode.text,
                    type:'bar',
                    data:VALUE
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option,true);
    }


    function ECharts02(sel_verb2_1,sel_verb2_2){
        var myChart = echarts.init(document.getElementById('echarts-demo'));
        // var rootId = currentNode.id.split('_')[0];
        // var rootName = $("#"+rootId+"_anchor").text();
        option = {
            title: {
                x:'center',
                text: currentNode.original.title + '('+currentNode.original.unit+')'
            },
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                axisPointer: {
                    type: 'shadow'
                },
                /*    formatter: function(params) {
                        // for text color
                        var color = colorList[params[0].dataIndex];
                        var res = '<div style="color:' + color + '">';
                        res += '<strong>' + params[0].name + '</strong>'

                        for (var i = 0, l = params.length; i < l; i++) {
                            res += '<br/>' + params[i].seriesName + ' : ' + params[i].value
                        }
                        res += '</div>';
                        return res;
                    }*/
            },
            legend: {
                show:false,
                y:'bottom',
                data:sel_verb2_1
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                y: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: false, readOnly: false},
                    restore: {show: false},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            // grid: {
            //     y: 80,
            //     y2: 40,
            //     x2: 20
            // },
            xAxis: [
                {
                    type: 'category',
                    data: sel_verb2_2
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: SERIES
        };

        myChart.setOption(option,true);
    }

    function ECharts03(xAxis,sel_verb3_1){
        var myChart = echarts.init(document.getElementById('echarts-demo'));
        // var rootId = currentNode.id.split('_')[0];
        // var rootName = $("#"+rootId+"_anchor").text();
        // var colorList = [
        //     '#ff7f50','#87cefa','#da70d6','#32cd32','#6495ed',
        //     '#ff69b4','#ba55d3','#cd5c5c','#ffa500','#40e0d0'
        // ];
        option = {
            title: {
                x:'center',
                text: currentNode.original.title + '('+currentNode.original.unit+')'
            },
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                axisPointer: {
                    type: 'shadow'
                }/*,
                formatter: function(params) {
                    // for text color
                    var color = colorList[params[0].dataIndex];
                    var res = '<div style="color:' + color + '">';
                     res += '<strong>' + params[0].name + '</strong>'

                    for (var i = 0, l = params.length; i < l; i++) {
                        res += '<br/>' + params[i].seriesName + ' : ' + params[i].value
                    }
                    res += '</div>';
                    return res;
                }*/
            },
            legend: {
                show:false
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                y: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: false, readOnly: false},
                    restore: {show: false},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            // grid: {
            //     y: 80,
            //     y2: 40,
            //     x2: 40
            // },
            xAxis: [
                {
                    type: 'category',
                    data: xAxis
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: SERIES
        };

        myChart.setOption(option,true);
    }


    function  setColsureSelected(value) {
        $("#colsure").val(value);
        $("#colsure").trigger("change");
    }



    function showRadio(type) {
        if(type == 1) {
            $("#echarts-demo").hide();
            $("#csv-demo").show();
        }else {
            $("#echarts-demo").show();
            $("#csv-demo").hide();
        }
    }

    function operateAgg(id) {
        $("#btn_opera_"+id).addClass("open")

    }


</script>

</body>
</html>