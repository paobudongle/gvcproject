<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8"/>
    <%@ include file="../index/front_head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no"/><link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/demo.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/product.css"/>


    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/global/plugins/fSelect/css/fSelect.css">

    <style>
        select.form-control:not([size]):not([multiple]) {
             height: auto;
        }
        .ptext {
            margin-top: 1px;
            margin-bottom: 1px;
            line-height: 2;
            font-size: 12pt;
            word-break: break-all;
            text-indent: 35px;
        }
        #zcShorckTxt {
            white-space: pre-line;
            text-indent: 0;
            display: block;
            text-align: left;
        }
        .site-page-main .scenario-detail-table td {
            text-align: left;
        }

        .mt-element-step .step-line .mt-step-col {
            padding: 20px 0;
        }

        *, ::after, ::before {
            -webkit-box-sizing: inherit;
            -moz-box-sizing: inherit;
            box-sizing: inherit;
        }
    </style>


</head>
<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main">

<div class="news_list_met_21_4 met-index-body met-index-imgnews bgcolor" m-id='4' style="padding: 10px 0 0 0;">
    <div class="container">
        <div class="row">
            <!-- END HEAD -->
            <div class="product_list_page_met_16_1 met-product type-1" m-id='14' style="background:none;">
                <div class="container">
                    <form action="#" class="form-horizontal form_sys_addModelRun" id="form_sys_addModelRun">
                        <input type="hidden" id="exper_id" name="experID" value=""/>
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
                                            <div class="mt-step-title uppercase font-grey-cascade">情景/SCENARIO</div>
                                            <%-- <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
<%--                                        <div id="t_div_3" class="col-md-2 mt-step-col" style="cursor:pointer;"--%>
<%--                                             href="#tab_3" data-toggle="tab" onclick="setTab('3')">--%>
<%--                                            <div class="mt-step-number bg-white">3</div>--%>
<%--                                            <div class="mt-step-title uppercase font-grey-cascade">闭合/Closure</div>--%>
<%--                                        </div>--%>
                                        <div id="t_div_3" class="col-md-2 mt-step-col " style="cursor:pointer;"
                                             href="#tab_3" data-toggle="tab" onclick="setTab('3')">
                                            <div class="mt-step-number bg-white">3</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">冲击/Shocks</div>
                                        </div>
                                        <div id="t_div_4" class="col-md-2 mt-step-col last" style="cursor:pointer;"
                                             href="#tab_4" data-toggle="tab" onclick="setTab('4')">
                                            <div class="mt-step-number bg-white">4</div>
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
                                                            <div style="text-align: center;">
                                                                <h3>简介</h3>
                                                            </div>
                                                            <p class="ptext">
                                                                平台以可计算一般均衡模型（CGE）为核心建模框架，依据微观经济行为与宏观经济结构的联动机制，为妇女发展政策的系统性模拟提供支撑。此模型以多部门、多生产要素为基础，嵌入了性别、年龄、城乡等差异化变量。通过这些变量，模型能够精准刻画不同群体在劳动力市场、家庭行为以及政策干预中的响应差异。在劳动力市场方面，不同性别、年龄和城乡群体的就业情况和职业选择会有所不同；在家庭行为上，这些群体的消费、储蓄等决策也存在差异。基于这些精准的刻画，模型可以更准确地模拟妇女发展政策在不同情境下的效果，为相关研究和教学提供可靠的依据。
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_2">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-lg-1 col-sm-1 col-xs-1"></div>
                                                <div class="col-lg-9 col-sm-9 col-xs-9">
                                                    <table class="table table-bordered">
                                                        <tr>
                                                            <td>
                                                                <div class="radio">
                                                                    <input type="hidden" id="model_type" value="SELF_DEFIN">
                                                                    <label>
                                                                        <input type="radio" id="CHN-GEO" value="CHN-GEO" name="policy" checked>
                                                                        <span style="color: #002a80;font-weight: bold;font-size: 14px;">1、数字经济发展对女性及家庭的影响</span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" id="CHN-AUS" value="CHN-AUS" name="policy">
                                                                        <span style="color: #002a80;font-weight: bold;font-size: 14px;">2、生育支持政策效果评估</span>
                                                                    </label>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" id="CHN-UKR" value="CHN-UKR" name="policy">
                                                                        <span style="color: #002a80;font-weight: bold;font-size: 14px;">3、家庭政策效果评估</span>
                                                                    </label>

                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" id="RCEP" value="RCEP" name="policy">
                                                                        <span style="color: #002a80;font-weight: bold;font-size: 14px;">4、AI技术发展对女性及家庭的影响</span>
                                                                    </label>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" id="self-df" value="SELF_DEFIN" name="policy">
                                                                        <span style="color: #002a80;font-weight: bold;font-size: 14px;">5、自定义策略</span>
                                                                    </label>

                                                                </div>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 10px;">
                                                <div class="col-md-1"></div>
                                                <div class="col-md-9">
                                                    <table class="table table-bordered scenario-detail-table">
                                                        <tr><td>
                                                            <span id="zcShorckTxt" class="ptext" style="font-size: 10pt;">自定义策略</span>
                                                        </td></tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="tab-pane fade" id="tab_3">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-2"></div>
                                                    <label class="col-md-1 control-label">模型闭合<span
                                                            class="required">*</span></label>
                                                    <div class="col-md-4">
                                                        <select class="form-control" id="colsure"
                                                                onchange="colsureChange(this.value)" name="colsureType">
                                                            <option value="">--请选择--</option>
                                                            <option value="BookClosure">标准闭合</option>
                                                            <option value="ShortClosure">预测闭合</option>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label"></label>
                                                    <div class="col-md-7">
                                                        <textarea id="closureTxt" name="closureTxt" class="form-control"
                                                                  rows="15" style="display: none;"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="tab-pane fade" id="tab_3">
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6"><p style="color: #919191;">
                                                如需了解冲击变量代表的具体含义，请点击下方‘变量解释’按钮</p></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击<span
                                                            class="required">*</span></label>
                                                    <div class="form-group col-md-6">
                                                        <select class="form-control" id="shockType"
                                                                onchange="shockTypeChange(this.value)">
                                                        </select>
                                                        <%--因素冲击--%>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"></div>
                                                    <label class="form-group col-md-6  control-label"
                                                           id="shorckTypeReamrkCn"></label>
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
                                                    <div class="form-group col-md-2">
                                                        <input type="number" class="form-control" id="shorckValue"
                                                               autocomplete="off">
                                                    </div>

                                                    <div class="form-group col-md-2 col-sm-6 col-xs-6">
                                                        <button type="button"
                                                                class="btn btn-success glyphicon glyphicon-plus"
                                                                onclick="addToShorckList()">添加至列表
                                                        </button>
                                                    </div>
                                                    <div class="form-group col-md-2 col-sm-6 col-xs-6">
                                                        <button type="button"
                                                                class="btn btn-warning glyphicon glyphicon-minus"
                                                                onclick="clearShorckList()">清空列表
                                                        </button>
                                                    </div>
<%--                                                    <div class="form-group  col-md-2 col-sm-6 col-xs-6">--%>
<%--                                                        <a class="btn btn-info" title="下载变量解释"--%>
<%--                                                           href="${pageContext.request.contextPath}/modeljz/downParamExplain.page">变量解释</a>--%>
<%--                                                    </div>--%>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击列表</label>
                                                    <div class="form-group col-md-6">
                                                        <textarea class="form-control" rows="8" id="shorckTxt"
                                                                  placeholder="冲击列表" name="shorckTxt">
                                                           </textarea>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">标题<span
                                                            class="required">*</span></label>
                                                    <div class="form-group col-md-6">
                                                        <input class="form-control" id="runName" name="runName"
                                                               autocomplete="off" onblur="checkName()">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">备注信息</label>
                                                    <div class="form-group col-md-6">
                                                        <textarea class="form-control" placeholder="备注信息" id="remark"
                                                                  name="remark" rows="4"></textarea>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5"></div>
                                                    <div class="col-md-offset-4 col-md-6">
                                                        <button type="button" class="btn green btn-ModelRunaddsave">运行求解
                                                        </button>&nbsp;
                                                        <button type="reset" class="btn default">重置</button>&nbsp;
                                                        <button type="button" class="btn default" data-dismiss="modal">
                                                            取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_4">
                                        <div class="row">
                                            <div class="col-md-12">&nbsp;&nbsp;&nbsp;</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">&nbsp;&nbsp;&nbsp;</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div id="tree-demo" class="tree-demo"
                                                         style="height:580px;overflow-x:auto;overflow-y: auto;background-color: #ffffff;"></div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="row" style="background-color: #ffffff;">
                                                        <div class="col-md-4">
<%--                                                            <select class="form-control" id="sel_year"--%>
<%--                                                                    onchange="colsureChange(this.value)" name="colsureType">--%>
<%--                                                                <option value="">--请选择年份--</option>--%>
<%--                                                                <option value="2020">2020</option>--%>
<%--                                                                <option value="2021">2021</option>--%>
<%--                                                                <option value="2022">2022</option>--%>
<%--                                                            </select>--%>
                                                        </div>
                                                        <div class="col-md-8">
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
                                                                            <input type="radio" id="rtype1" name="rtype"
                                                                                   value="1" checked
                                                                                   onclick="showRadio(1)">&nbsp;<label
                                                                                for="rtype1">数据</label>&nbsp;
                                                                            <input type="radio" id="rtype2" name="rtype"
                                                                                   value="2" onclick="showRadio(2)">&nbsp;<label
                                                                                for="rtype2">图形</label>&nbsp;
                                                                        </div>
<%--                                                                        <a class="btn btn-success" title="下载变量解释"--%>
<%--                                                                           href="${pageContext.request.contextPath}/modeljz/downParamExplain.page">变量解释</a>--%>
<%--                                                                        <a class="btn btn-success" title="下载结果数据"--%>
<%--                                                                           href="#" onclick="allRunData()">结果下载</a>--%>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12"
                                                             style="overflow-x:auto;overflow-y: hidden;background-color: #ffffff;">
                                                            <div id="csv-demo" style="text-align: center;"></div>
                                                            <div id="echarts-demo"
                                                                 style="width: 900px;height:520px; display: none"></div>
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
</div><!-- site-page-main -->
<%@ include file="../index/foot.jsp" %>
<%--
  情景详情依赖本页 jQuery(document).ready -> handlePolicyChange。
  前台框架改造时把脚本改成 defer，且业务脚本是「无 src 的内联 script」：
  浏览器会忽略内联 script 上的 defer，导致业务代码在 jQuery 加载前同步执行，
  抛出 ReferenceError: jQuery is not defined，handlePolicyChange 永不注册，
  于是选项已勾选但 #zcShorckTxt 仍停在 HTML 默认「自定义策略」。
  这里恢复与生产一致的同步加载顺序（不含 layout.min.js/demo.min.js）。
--%>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/fSelect/fSelect.js" type="text/javascript"></script>

<script type="text/javascript">

    var isRuned = false;
    var shorckType;
    var shorckS1;
    var shorckS2;
    var shorckS3;
    var shorckS4;
    var shorckDatas = {};
    var shorckMap = {};


    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        var menuId = '${menu_id}';
        var selPolicy = '${type}';
        shorckMap =${shorckMap};
        $("#menu_"+menuId).addClass("active");
        // 定义处理策略变更的通用函数
        function handlePolicyChange() {
            initShockType();
            /**
             * 1、清空值
             * 2、设置值
             * 3、设置闭合
             * 4、设置冲击值（是否禁用其它冲击加入）
             * */
            var checkValue = $('input:radio[name="policy"]:checked').val();
            $("#shorckTxt").val("");
            if (checkValue == "CHN-GEO") {//案例：CHN-GEO
                $("#colsure").val("BookClosure");
                $("#model_type").val("CHN-GEO");
                $("#colsure").trigger("change");
                var shockType = $('#shockType');
                // shockType.append("<option value='delpwrtms'>delpwrtms</option>");
                // $("#shorckTxt").val(" shock a1tot(number_sec) = uniform 5;");
                document.getElementById("zcShorckTxt").innerText="政策情景：数字经济发展对女性及家庭的影响;\n" +
                    "仿真设计：筛选数字经济相关行业，冲击数字行业技术进步;\n" +
                    "关键变量：a1tot;\n" +
                    "变量维度：IND（行业）;\n" +
                    "冲击命令：shock a1tot(number_sec) = uniform 5;"
            }else if (checkValue == "CHN-AUS") {//2案例：CHN-AUS

                $("#colsure").val("BookClosure");
                $("#model_type").val("CHN-AUS");
                // $("#colsure").trigger("change");
                // $("#closureTxt").val($("#closureTxt").val()+" swap delpwrtms= tms;")
                // colsureChange("BookClosure");
                var shockType = $('#shockType');
                // shockType.append("<option value='delpwrtms'>delpwrtms</option>");
                // $("#shorckTxt").val(" shock eff_wage (“female”,COR, PRIME_AGE,EDU) = uniform 10;");
                document.getElementById("zcShorckTxt").innerText="政策情景：生育支持政策效果评估。\n" +
                    "仿真设计：对生育家庭给出政策补贴（针对适龄生育妇女，集合为“PRIME_AGE”），使家庭中的女性收入提升10%，测算影响与生育促进作用，补贴无论职业，无论受教育程度;\n" +
                    "关键变量：eff_wage;\n" +
                    "变量维度：(All,g,GEN)(All,c,COR)(All,a,WORK_AGE)(All,e,EDU);\n" +
                    "冲击命令：shock eff_wage (“female”,COR, PRIME_AGE,EDU) = uniform 10;";

            } else if (checkValue == "CHN-UKR") {   //3.CHN-UKR
                $("#colsure").val("BookClosure");
                $("#model_type").val("CHN-UKR");
                $("#colsure").trigger("change");
                var shockType = $('#shockType');
                // shockType.append("<option value='delpwrtms'>delpwrtms</option>");
                // $("#shorckTxt").val(" shock f_eld_care_sub = 5; shock f_child_care_sub = 5;");
                document.getElementById("zcShorckTxt").innerText=
                    "政策情景：家庭政策效果评估;\n" +
                    "仿真设计：对老人和孩童给予医疗健康补贴，补贴无论职业，无论受教育程度;\n" +
                    "关键变量：f_eld_care_sub；f_child_care_sub;\n" +
                    "变量维度：两个一维变量;\n" +
                    "冲击命令：shock f_eld_care_sub = 5; shock f_child_care_sub = 5;";
            } else if (checkValue == "RCEP") {//4.案例：RCEP

                $("#colsure").val("BookClosure");
                $("#model_type").val("RCEP");
                $("#colsure").trigger("change");
                var shockType = $('#shockType');
                shockType.append("<option value='delpwrtms'>delpwrtms</option>");
                $("#shorckTxt").val(" shock a2tot(AI_sec) = uniform 10; ");
                document.getElementById("zcShorckTxt").innerText="政策情景：AI技术发展对女性及家庭的影响;\n" +
                    "仿真设计：筛选AI等高科技行业，冲击这些行业的投资增长，测算AI行业快速发展的经济影响;\n" +
                    "关键变量：a2tot;\n" +
                    "变量维度：IND（行业）;\n" +
                    "冲击命令：shock a2tot(AI_sec) = uniform 10;";
            }else if (checkValue == "CHN-WLD-RICE") {//5.案例：CHN-WLD-RICE
                $("#colsure").val("BookClosure");
                $("#model_type").val("CHN-WLD-RICE");
                $("#colsure").trigger("change");
                // $("#shorckTxt").val("Shock aoall(\"pcr\",\"CHN\") = uniform 0.05;");
                document.getElementById("zcShorckTxt").innerText="政策情景：中国大米单产提高5%，将对中国及全球相关产业带来什么影响\n" +
                    "仿真设计：中国大米生产技术水平提升5%，其它条件不变\n" +
                    "关键变量：aoall：output augmenting technical change in sector j of r;\n" +
                    "变量维度：aoall (TRAD_COMM，REG) 区分产品和生产国家（或区域）\n" +
                    "冲击命令：Shock aoall(\"pcr\",\"CHN\") = uniform 0.05;\n";
            }else if (checkValue == "CHN-WLD-FTZ") {//6.案例：CHN-WLD-FTZ
                $("#colsure").val("BookClosure");
                $("#model_type").val("CHN-WLD-FTZ");
                $("#colsure").trigger("change");
                // $("#shorckTxt").val(" xset china(chn);\n" +
                //     "xsubset China is subset of reg;\n" +
                //     "xset othreg=reg-china;\n" +
                //     "shock ams(TRAD_COMM,\"CHN\",othREG) = select from file ..\\CHN-WLD-FTZ\\shock_ams.har header \"Aams\";\n" +
                //     "shock ams(TRAD_COMM,othREG,\"CHN\") = select from file ..\\CHN-WLD-FTZ\\shock_ams.har header \"Aams\";");
                document.getElementById("zcShorckTxt").innerText="政策情景：中国对各个国家贸易便利化水平提升之后，对经济、贸易以及福利的影响\n" +
                    "仿真设计：假设中国对所有国家进出口的贸易便利化水平提升，其他条件不变.\n" +
                    "关键变量：ams：import i from region r augmenting tech change in region s \n" +
                    "变量维度：ams (TRAD_COMM，REG，REG) 区分产品和进出口国家（或区域）\n" +
                    "冲击命令：shock ams(TRAD_COMM,\"CHN\",othREG) = select from file ..\\CHN-WLD-FTZ\\shock_ams.har header \"Aams\";\n";
            }else{
                //7.案例：自定义
                $("#colsure").val("BookClosure");
                $("#colsure").trigger("change");
                $("#model_type").val("SELF_DEFIN");
                $("#shorckTxt").val("pfactwld=10;");
                document.getElementById("zcShorckTxt").innerText="自定义策略";
            }
        }

        // 绑定点击事件
        $('input:radio[name="policy"]').click(function () {
            handlePolicyChange();
        });

        // 页面加载时：按 URL type 选中，并始终按当前勾选项刷新情景详情
        if (selPolicy && selPolicy !== '') {
            var $targetRadio = $('input:radio[name="policy"][value="' + selPolicy + '"]');
            if ($targetRadio.length > 0) {
                $targetRadio.prop('checked', true);
            }
        }
        if ($('input:radio[name="policy"]:checked').length > 0) {
            handlePolicyChange();
        }

        /**
         *冲击列表输入数据改变
         * */
        $("#shorckTxt").text("Shock pfactwld = uniform 10;");
        $('#shorckTxt').bind('input', function () {
            isRuned = false;
        });
        $(".btn-ModelRunaddsave").bind("click", function () {
            var colsureType = $("#colsure").val();
            var closureTxt = $("#closureTxt").val();
            var shorckTxt = $("#shorckTxt").val();
            var runName = $("#runName").val();
            // if (closureTxt == null || closureTxt == "") {
            //     PlatformCommonUtils.warn("请选择闭合");
            //     return;
            // }
            if (shorckTxt == null || shorckTxt == "") {
                PlatformCommonUtils.warn("冲击列表不能为空");
                return;
            }

            if (shorckValue == null || shorckValue == "") {
                PlatformCommonUtils.warn("请输入变化冲击");
                return;
            }

            if (runName == null || runName == "") {
                PlatformCommonUtils.warn("请输入标题");
                return;
            } else {
                $.ajax({
                    url: usercontextpath + '/modelrun/checkRunName.page',
                    type: "POST",
                    dataType: "json",
                    data: {"runName": runName},
                    async: false,
                    success: function (result) {
                        if (result != "0") {
                            PlatformCommonUtils.warn("标题已经存在，请重新输入!");
                            return;
                        } else {
                            $('form').ajaxSubmit(
                                {
                                    type: 'POST',
                                    url: usercontextpath + '/modelrun/runOnline.page',
                                    forceSync: false,
                                    data: {
                                        // 'colsure': $("#closureTxt").val(),
                                        'shorck': $("#shorckTxt").val(),
                                        'runname': $("#runName").val(),
                                        'jzid': $("#jzId").val(),
                                        'colsureType': $("#colsure").val(),
                                        'modelType':$("#model_type").val(),
                                        'remark': $("#remark").val()
                                    },
                                    dataType: 'json',
                                    beforeSubmit: function () {
                                        $(".btn-ModelRunaddsave").attr('disabled', true);
                                        App.startPageLoading({message: '运行中...请稍等'});
                                        window.setTimeout(function () {
                                            App.stopPageLoading();
                                            $(".btn-ModelRunaddsave").attr('disabled', false);
                                        }, 120000);
                                    },
                                    error: function (xhr, ajaxOptions,
                                                     thrownError) {
                                        App.stopPageLoading();
                                        PDP.warn(thrownError);
                                        $(".btn-ModelRunaddsave").attr('disabled', false);
                                    },

                                    success: function (result,
                                                       statusText, xhr, $form) {

                                        window.setTimeout(function () {
                                            App.stopPageLoading();
                                        }, 500);
                                        $(".btn-ModelRunaddsave").attr('disabled', false);
                                        var msg = result.msg;
                                        if (result.status == 'T') {
                                            isRuned = true;
                                            msg = "模型运行完毕";
                                            $("#exper_id").val(result.experID);
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
        'BookClosure': '',
        'ShortClosure': ''
    };

    function disCheck(){
        $('input:radio[name="policy"]:checked').prop("checked", false);
        $("#zcShorckTxt").val("");
        $("#shorckTxt").val("");
    }

    function operateFinish(value) {
        $.ajax({
            url: usercontextpath + '/modelrun/operateFinish.page',
            type: "POST",
            dataType: "json",
            data: {"experID":$("#exper_id").val()},
            async: false,
            success: function (result) {
                PDP.info(result);
            }
        });
    }

    function colsureChange(value) {
        var checkValue = $('input:radio[name="policy"]:checked').val();
        if(value!=null ||value!=""){
            $("#closureTxt").val(Colsure[value]);
        }
        $("#closureTxt").css("display", "block");
        isRuned = false;
        initShockType();
    }

    function setTab(id) {
        if (id == 1) {
            $("#previous").hide();
            $("#next").show();
        } else if (id == 4) {
            $("#previous").show();
            $("#next").hide();
        } else {
            $("#previous").show();
            $("#next").show();
        }

        // Bootstrap 4 alpha：div[data-toggle=tab] 无法可靠切换面板，需手动切换内容区
        $("#model_tab .tab-pane").removeClass("active in show");
        $("#tab_" + id).addClass("active in show");

        if (id == 4) {
            if (jstree == null) {
                jstree = ajaxTreeSample();
                $("#div_table").show();
            } else {
                jstree.jstree(true).refresh();
            }
        }

        $("[id^=t_div_]").removeClass("active done");
        for (var i = 1; i < id; i++) {
            $("#t_div_" + i).addClass("done");
        }
        $("#t_div_" + id).addClass("active");
        $("#t_div_1").addClass("first");
        $("#t_div_4").addClass("last");

    }

    /**
     * 选择冲击大类-同步联动子类
     * @param value
     * 1、全局变量清空
     * 2、清空所有select
     * 3、style  displany none
     * */
    function shockTypeChange(value) {
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
                obj.clousreType = $("#colsure").val();
                obj.modelType = $("#model_type").val();
                $("#shorckTypeReamrk").text(shorckMap[shorckType].rmark);
                $("#shorckTypeReamrkCn").text(shorckMap[shorckType].shorckId);
                $.ajax({
                    url: usercontextpath + '/modelrun/getShorckElement.page',
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
        if (shorckType == "tms_l" || shorckType == "to_l") {
            formula = formula.replace("Shock", "final_level");
        }
        var shorckTxt = formula.replace("$type", shorckType).replace("$shorckEles", shorckEleStr.substring(0, shorckEleStr.length - 1)).replace("$shorckValue", shorckValStr).replace("()"," ");
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
     * 初始化冲击类型
     */
    function initShockType() {
        $("#shorckTxt").val("");
        $("#shockType").empty();
        var shockType = $('#shockType');
        shockType.append("<option >--请选择--</option>");
        var modelType  = $("#model_type").val();
        // shorckMap 是一个对象，需要遍历其属性
        for (var key in shorckMap) {
            if (shorckMap.hasOwnProperty(key)) {
                var item = shorckMap[key];
                var option = $("<option value='" + item.shorckId + "'>" + item.remarkCn + "</option>");
                option.appendTo(shockType);
            }
        }
    }

    function clearShocks() {
        $("select[id='shockType'] option").remove();
        $("select[id^='sel_shorck'] option").remove();
        $("div[id^='div_']").css("display", "none");
        $("#shorckTypeReamrk").text("");
        $("#shorckTypeReamrkCn").text("");
        $("#shorckValue").val("");
        //$("#shorckTxt").val("Shock pfactwld = uniform 10;");
    }


    var jstree = null;


    function selectTab() {
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
        if (tab_ == 4 && !isRuned) {
            PlatformCommonUtils.warn("未运行求解！");
            return;
        } else if (tab_ == 5) {
            $("#next").hide();
        }
        $("#t_div_" + (tab_ + 1)).click();
    }


    function refSimulateSelect() {
        var url = usercontextpath + '/modeljz/refSimulateSelect.page';
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
            url: usercontextpath + "/modelrun/getModelRun.page",
            params: {
                "runId": runId
            },
            width: "800px",
            height: "600px"
        });
    }


    function downFile(runId) {
        // window.open(usercontextpath + "/modelrun/downloadRunRS.page?runId="+runId);
        window.open(usercontextpath + "/modelrun/downloadRumData.page?runId=" + runId);

    }

    function downloadMFile() {
        window.open(usercontextpath + "/modeljz/downloadAggModule.page");
    }

    function downCurrentData() {
        if (currentNode == null) {
            PlatformCommonUtils.warn("请选择数据!");
            return;
        } else {
            // window.location.href=(usercontextpath + "/modelrun/downloadCSVData.page?runId=" + currentNode.id+ "&csv=" + currentNode.original.csv+ "");
            window.location.href = (usercontextpath + "/modelrun/downloadCSVData.page?runId=" + currentNode.id + "&csv=" + currentNode.original.csv + "");
        }
    }

    function allRunData() {
        if (currentNode == null) {
            PlatformCommonUtils.warn("请选择数据!");
            return;
        } else {
            // window.location.href=(usercontextpath + "/modelrun/downloadRumData.page?runId=" + currentNode.id);
            window.location.href = (usercontextpath + "/modelrun/donwnloadResultZip.page?runId=" + currentNode.id+"&modelType="+$("#model_type").val());

        }
    }


    function analysGE() {
        if (currentNode == null) {
            PlatformCommonUtils.warn("请选择数据!");
            return;
        } else {
            window.location.href = (usercontextpath + "/modelrun/downloadAnalysGE.page?runId=" + currentNode.id);
        }
    }


    function checkName() {
        var runName = $("#runName").val();
        if (runName == null || runName == "") {
            PlatformCommonUtils.warn("请输入标题");
            return;
        } else {

            $.ajax({
                url: usercontextpath + '/modelrun/checkRunName.page',
                type: "POST",
                dataType: "json",
                data: {"runName": runName},
                async: false,
                success: function (result) {
                    if (result != "0") {
                        PlatformCommonUtils.warn("标题已经存在，请重新输入!");
                        return;
                    }
                }
            });
        }
    }

</script>
<script>
    var currentNode = null;
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
        return $("#tree-demo").jstree({
            "core": {
                "themes": {
                    "responsive": false
                },
                // so that create works
                "check_callback": true,
                'data': {
                    'url': function (node) {
                        return usercontextpath + '/modeljz/refSimulateTree.page?id=' + node.id + "&parent=" + node.parent;
                    },
                    'data': function (node) {
                        return {'parent': node.id};
                    },
                    'success': function (retvel) {
                        if (!retvel || retvel.length === 0) {
                            return;
                        }
                        fistNode = retvel[0].id;

                        for (var key in retvel) {
                            if (retvel.hasOwnProperty(key)) {
                                var c = retvel[key].children;
                                if (c == false) {
                                    var i = retvel[key].id;
                                    var t = retvel[key].title;
                                    iA.push(i);
                                    tA.push(t);
                                }
                            }
                            if (retvel[key].runStatus == '0' || retvel[key].runStatus == '9') {
                                var id = retvel[key].id;
                                runErr.push(id)
                            }


                        }
                    }
                }
            },
            "types": {
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg"
                },
                "file": {
                    "icon": "fa fa-file icon-state-warning icon-lg"
                }
            },
            "state": {"key": "demo3"},
            "plugins": ["contextmenu", "dnd", "state", "types"],
            "contextmenu": {
                'items': customMenu
            },
        }).bind("select_node.jstree", function (event, data) {
            var inst = data.instance;
            var selectedNode = inst.get_node(data.selected);
            var level = $("#" + selectedNode.id).attr("aria-level");
            if (parseInt(level) == 1) {
                currentNode = selectedNode;
            } else if (parseInt(level) == 2) {
                currentNode = selectedNode;
                /* if(runStatus!="1"){  如果运行未成功，提示查看日志
                   PlatformCommonUtils.warn("未运行成功，请选择运行结果右键下载查看日志!");
                   return;
               }else{
                    查询结果csv
               }*/
                $.ajax({
                    url: usercontextpath + '/modeljz/readCsvToMap.page',
                    data: {"id": selectedNode.id, "csv": selectedNode.original.csv},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
                        if (data) {
                            handleInitCsv(data.csv);
                            var vd = currentNode.original.dimension;
                            if (vd != 0) {
                                $(":radio[name='rtype'][value='1']").prop("checked", "checked");
                            }
                            // $("#rtype1").attr("checked","checked");
                            $("#echarts-demo").hide();
                            $("#csv-demo").show()
                            showCsv(data.csv);
                            //ECharts(data,selectedNode);
                        } else {
                            $("#echarts-demo").html("暂无数据！");
                        }
                    }
                });


            }
        }).on("open_node.jstree", function (e, data) {


            for (var i in iA) { //title显示
                $("#" + iA[i] + "_anchor").attr("title", tA[i]);
            }

            for (var i in runErr) { //运行错误，字体颜色标红
                $("#" + runErr[i] + "_anchor").css("color", "#ff1e20");
            }

            var runStatus = data.node.original.runStatus;
            if (runStatus == '0' || runStatus == '9') {
                PlatformCommonUtils.warn("红色文件夹表示模拟结果出错，请右键查看日志！");
                return;
            }


        }).on("ready.jstree", function (event, data) {
            data.instance.open_node(fistNode);  //默认打开第一个节点
        });


    }

    function customMenu(node) {
        if (node.parent == '#') {
            var items = {
                'info': {
                    'label': '运行详情',
                    'action': function (obj) {
                        showInfo(node.id)
                    }
                },
                'log': {
                    'label': '日志下载',
                    'action': function (obj) {
                        window.open(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
                    }
                },
                'del': {
                    'label': '数据删除',
                    'action': function (obj) {

                        PDP.confirm("确定删除『" + node.text + "』 数据吗?", function (isConfirm) {
                            if (isConfirm) {
                                $.post(usercontextpath + '/modelrun/deleteModelRun.page', {"runId": node.id},
                                    function (data) {
                                        if (data == "success") {
                                            PDP.success("删除成功!");
                                            jstree.jstree(true).refresh();
                                            // var inst = jQuery.jstree.reference(obj.reference);
                                            // inst.delete_node(obj.reference);
                                        } else {
                                            PlatformCommonUtils.warn("删除失败!");
                                            return;
                                        }
                                    });
                            }
                        });
                    }
                }
            }
            return items;
        }

    }

    function isInArray(arr, value) {
        for (var i = 0; i < arr.length; i++) {
            if (value === arr[i]) {
                return true;
            }
        }
        return false;
    }

    function reUnionArray(arr, row, col, arr2) {

        var temp = [];
        for (var i = row; i < arr.length; i++) {
            var key = arr[i].split(",")[col];
            if (arr2 != null) {
                for (var j = 0; j < arr2.length; j++) {
                    if (key == arr2[j]) {
                        temp.push(arr[i]);
                    }
                }
            } else {
                temp.push(arr[i]);
            }

        }
        return temp;
    }

    function reUnionValArray(verb2_1, verb2_2, arr) {

        for (var i = 0; i < arr.length; i++) {
            var key0 = arr[i].split(",")[0];
            var key1 = arr[i].split(",")[1];
            var val = arr[i].split(",")[2];

            if ((key0 == verb2_1) && (key1 == verb2_2)) {
                return val;
            }
        }

        return null;
    }

    function reUnionValArray2(verb3_2, verb3_3, arr) {

        for (var i = 0; i < arr.length; i++) {
            var key0 = arr[i].split(",")[1];
            var key1 = arr[i].split(",")[2];
            var val = arr[i].split(",")[3];

            if ((key0 == verb3_2) && (key1 == verb3_3)) {
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
        if (dimension == 0) {
            $("#radioDiv").hide();
            $('label[id^="div_sel_"]').html("");
        }

        if (dimension == 1) {
            $("#radioDiv").show();
            VALUE = [];
            VERB1 = [];
            var label = data[0].split(",")[0];
            for (var i = 1; i < rows; i++) {
                var key = data[i].split(",")[0];
                var val = data[i].split(",")[1];
                VERB1.push(key);
                VALUE.push(isNumber(val));
            }

            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb1").html(label + ":&nbsp;");
            createSelect('sel_verb1', VERB1);
            ECharts0Or1();

        }

        if (dimension == 2) {
            $("#radioDiv").show();
            VERB2_1 = [];
            VERB2_2 = [];
            SERIES = [];

            var label1 = data[0].split(",")[0];
            var label2 = data[0].split(",")[1];

            for (var i = 1; i < rows; i++) {
                var key0 = data[i].split(",")[0];
                var key1 = data[i].split(",")[1];
                // var val = data[i].split(",")[2];

                if (!isInArray(VERB2_1, key0)) {
                    VERB2_1.push(key0);
                }

                if (!isInArray(VERB2_2, key1)) {
                    VERB2_2.push(key1);
                }

            }
            for (var i = 0; i < VERB2_1.length; i++) {
                var data = []
                for (var j = 0; j < VERB2_2.length; j++) {
                    var v = reUnionValArray(VERB2_1[i], VERB2_2[j], initCsv);
                    if (v != null) {
                        data.push(v);
                    }
                }
                SERIES.push({name: VERB2_1[i], type: 'bar', data: data});
            }


            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb2_1").html(label1 + ":&nbsp;");
            createSelect('sel_verb2_1', VERB2_1);

            $("#div_sel_verb2_2").html(label2 + ":&nbsp;");
            createSelect('sel_verb2_2', VERB2_2);

            ECharts02(VERB2_1, VERB2_2);

        }

        if (dimension == 3) {
            $("#radioDiv").show();
            var label1 = data[0].split(",")[0];
            var label2 = data[0].split(",")[1];
            var label3 = data[0].split(",")[2];


            VERB3_1 = [];
            VERB3_2 = [];
            VERB3_3 = [];
            SERIES = [];

            for (var i = 1; i < rows; i++) {
                var key0 = data[i].split(",")[0];
                var key1 = data[i].split(",")[1];
                var key2 = data[i].split(",")[2];

                if (!isInArray(VERB3_1, key0)) {
                    VERB3_1.push(key0);
                }

                if (!isInArray(VERB3_2, key1)) {
                    VERB3_2.push(key1);
                }
                if (!isInArray(VERB3_3, key2)) {
                    VERB3_3.push(key2);
                }

            }


            $('label[id^="div_sel_"]').html("");
            $("#div_sel_verb3_1").html(label1 + ":&nbsp;");
            createSelect('sel_verb3_1', VERB3_1);

            $("#div_sel_verb3_2").html(label2 + ":&nbsp;");
            createSelect('sel_verb3_2', VERB3_2);

            $("#div_sel_verb3_3").html(label3 + ":&nbsp;");
            createSelect('sel_verb3_3', VERB3_3);

            var xAxis = [];

            for (var i = 0; i < VERB3_2.length; i++) {

                for (var j = 0; j < VERB3_3.length; j++) {
                    var x = VERB3_2[i] + "&" + VERB3_3[j];
                    var v = reUnionValArray2(VERB3_2[i], VERB3_3[j], initCsv);
                    if (v != null) {
                        xAxis.push(x);
                    }
                }
            }


            for (var i = 0; i < VERB3_1.length; i++) {
                var data = [];
                for (var j = 1; j < initCsv.length; j++) {
                    var key = initCsv[j].split(",")[0];
                    var key1 = VERB3_1[i];
                    if (key == key1) {
                        data.push(isNumber(initCsv[j].split(",")[3]));
                    }

                }

                SERIES.push({name: VERB3_1[i], type: 'bar', data: data});
            }


            ECharts03(xAxis, VERB3_1);
        }


    }


    function createSelect(id, data) {
        var select = document.createElement("select");
        select.setAttribute('id', id);
        select.setAttribute('multiple', 'multiple');
        for (var i = 0; i < data.length; i++) {
            select.options[i] = new Option(data[i], data[i]);
        }

        $("#div_" + id).append(select);
        $("#" + id).fSelect();

        $("#" + id).bind("change", function () {
            handleSel($("#" + id).val())
        })

    }


    function handleSel(v) {
        var dimension = currentNode.original.dimension;
        if (dimension == 1) {
            if (v != null) {
                VALUE = [];
                VERB1 = [];
                var temCsv = [];

                temCsv.push(initCsv[0]);
                for (var i = 1; i < initCsv.length; i++) {
                    var reg = initCsv[i].split(",")[0];
                    var val = initCsv[i].split(",")[1];

                    for (var j = 0; j < v.length; j++)

                        if (reg == v[j]) {
                            VERB1.push(reg);
                            VALUE.push(isNumber(val));
                            temCsv.push(initCsv[i]);
                        }

                }
                showCsv(temCsv);
                ECharts0Or1();
            } else {
                showCsv(initCsv);
                handleInitCsv(initCsv)
            }
        }

        if (dimension == 2) {
            var sel_verb2_1 = $("#sel_verb2_1").val();
            var sel_verb2_2 = $("#sel_verb2_2").val();
            if (sel_verb2_1 == null) {
                sel_verb2_1 = VERB2_1;
            }
            if (sel_verb2_2 == null) {
                sel_verb2_2 = VERB2_2;
            }
            SERIES = [];
            var temCsv = [];
            temCsv.push(initCsv[0]);
            var uArr = reUnionArray(initCsv, 1, 0, sel_verb2_1);
            var uArr2 = reUnionArray(uArr, 0, 1, sel_verb2_2);
            temCsv = temCsv.concat(uArr2);

            for (var i = 0; i < sel_verb2_1.length; i++) {
                var data = [];
                for (var j = 0; j < sel_verb2_2.length; j++) {
                    var v = reUnionValArray(sel_verb2_1[i], sel_verb2_2[j], temCsv);
                    if (v != null) {
                        data.push(isNumber(v));
                    }
                }
                SERIES.push({name: sel_verb2_1[i], type: 'bar', data: data});
            }
            showCsv(temCsv);
            ECharts02(sel_verb2_1, sel_verb2_2);

        }

        if (dimension == 3) {
            var sel_verb3_1 = $("#sel_verb3_1").val();
            var sel_verb3_2 = $("#sel_verb3_2").val();
            var sel_verb3_3 = $("#sel_verb3_3").val();


            SERIES = [];
            var temCsv = [];
            temCsv.push(initCsv[0]);
            var uArr = reUnionArray(initCsv, 1, 0, sel_verb3_1);
            var uArr2 = reUnionArray(uArr, 0, 1, sel_verb3_2);
            var uArr3 = reUnionArray(uArr2, 0, 2, sel_verb3_3);
            temCsv = temCsv.concat(uArr3);
            showCsv(temCsv);


            if (sel_verb3_1 == null) {
                sel_verb3_1 = VERB3_1
            }
            if (sel_verb3_2 == null) {
                sel_verb3_2 = VERB3_2
            }

            if (sel_verb3_3 == null) {
                sel_verb3_3 = VERB3_3
            }
            var xAxis = [];

            for (var i = 0; i < sel_verb3_2.length; i++) {

                for (var j = 0; j < sel_verb3_3.length; j++) {
                    var x = sel_verb3_2[i] + "&" + sel_verb3_3[j];
                    var v = reUnionValArray2(sel_verb3_2[i], sel_verb3_3[j], temCsv);
                    if (v != null) {
                        xAxis.push(x);
                    }
                }
            }


            for (var i = 0; i < sel_verb3_1.length; i++) {
                var data = [];
                for (var j = 1; j < temCsv.length; j++) {
                    var key = temCsv[j].split(",")[0];
                    var key1 = sel_verb3_1[i];
                    if (key == key1) {
                        data.push(isNumber(temCsv[j].split(",")[3]));
                    }

                }

                SERIES.push({name: sel_verb3_1[i], type: 'bar', data: data});
            }


            ECharts03(xAxis, sel_verb3_1);

        }

    }


    function showCsv(data) {
        $("#csv-demo").html("");
        var rows = data.length;
        var cols = data[0].split(",").length;
        var tableNode = document.createElement("table");//获得对象
        tableNode.setAttribute("class", "table table-bordered");


        var trNode1 = tableNode.insertRow();
        trNode1.setAttribute("bgcolor", "#F0FFFF")
        var tdNode1 = trNode1.insertCell();
        tdNode1.setAttribute("colspan", cols);
        tdNode1.innerHTML = "<h4>" + currentNode.original.text + '(' + currentNode.original.unit + ')' + "</h4>";


        for (var i = 0; i < rows; i++) {
            var trNode = tableNode.insertRow();
            if (i == 0) {
                trNode.setAttribute("bgcolor", "#F0FFFF")
            }

            for (var y = 0; y < cols; y++) {
                var tdNode = trNode.insertCell();
                var val = data[i].split(",")[y];
                tdNode.innerHTML = isNumber(val);
            }
        }

        document.getElementById("csv-demo").appendChild(tableNode);//添加到那个位置

    }


    function isNumber(val) {
        var loc = val.indexOf(".");
        if (loc > 0) {
            var num = new Number(val);
            return num.toFixed(2);
        } else {
            return val;
        }
    }

    function ECharts0Or1() {
        var myChart = echarts.init(document.getElementById('echarts-demo'));

        // var rootId = currentNode.id.split('_')[0];
        // var rootName = $("#"+rootId+"_anchor").text();
        option = {
            title: {
                x: 'center',
                text: currentNode.original.text + '(' + currentNode.original.unit + ')'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                y: 'bottom',
                data: [currentNode.text]
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: false, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: false,
            xAxis: [
                {
                    type: 'category',
                    data: VERB1
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: currentNode.text,
                    type: 'bar',
                    data: VALUE
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option, true);
    }


    function ECharts02(sel_verb2_1, sel_verb2_2) {
        var myChart = echarts.init(document.getElementById('echarts-demo'));
        option = {
            title: {
                x: 'center',
                text: currentNode.original.text + '(' + currentNode.original.unit + ')'
            },
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                axisPointer: {
                    type: 'shadow'
                },
            },
            legend: {
                show: false,
                y: 'bottom',
                data: sel_verb2_1
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

        myChart.setOption(option, true);
    }

    function ECharts03(xAxis, sel_verb3_1) {
        var myChart = echarts.init(document.getElementById('echarts-demo'));
        option = {
            title: {
                x: 'center',
                text: currentNode.original.text + '(' + currentNode.original.unit + ')'
            },
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                show: false
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

        myChart.setOption(option, true);
    }


    function setColsureSelected(value) {
        $("#colsure").val(value);
        $("#colsure").trigger("change");
    }


    function showRadio(type) {
        if (type == 1) {
            $("#echarts-demo").hide();
            $("#csv-demo").show();
        } else {
            $("#echarts-demo").show();
            $("#csv-demo").hide();
        }
    }

    function operateAgg(id) {
        $("#btn_opera_" + id).addClass("open")

    }

</script>

</div><!-- site-page-wrap -->


</body>
</html>
