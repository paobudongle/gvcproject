<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>在线模拟</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="平台服务主要包括提供政策仿真云平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持" />
    <meta name="keywords" content="政策分析云平台" />
    <meta name="generator" content="政策分析云平台" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/product.css"/>

    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->
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
                        <div class="row" style="margin: 10px;">
                            <div class="col-md-12">
                                <div class="mt-element-step">
                                    <div class="row step-line">

                                        <div id="t_div_1" class="col-md-2 mt-step-col first active" style="cursor:pointer;" href="#tab_1"  data-toggle="tab" onclick="setTab('1')" >
                                            <div class="mt-step-number bg-white">1</div>
                                            <div class="mt-step-title uppercase font-grey-cascade">加总/Agg</div>
                                            <%-- <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_2" class="col-md-2 mt-step-col" style="cursor:pointer;" href="#tab_2"  data-toggle="tab" onclick="setTab('2')" >
                                            <div class="mt-step-number bg-white">2</div>
                                            <div class="mt-step-title uppercase font-grey-cascade" >选择/Select</div>
                                            <%--  <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_3" class="col-md-2 mt-step-col" style="cursor:pointer;" href="#tab_3"  data-toggle="tab" onclick="setTab('3')" >
                                            <div class="mt-step-number bg-white">3</div>
                                            <div class="mt-step-title uppercase font-grey-cascade" >闭合/Closure</div>
                                            <%-- <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_4" class="col-md-2 mt-step-col " style="cursor:pointer;" href="#tab_4"  data-toggle="tab" onclick="setTab('4')" >
                                            <div class="mt-step-number bg-white">4</div>
                                            <div class="mt-step-title uppercase font-grey-cascade" >冲击/Shocks</div>
                                            <%--    <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_5" class="col-md-2 mt-step-col" style="cursor:pointer;" href="#tab_5"  data-toggle="tab" onclick="setTab('5')">
                                            <div class="mt-step-number bg-white">5</div>
                                            <div class="mt-step-title uppercase font-grey-cascade" >求解/Solve</div>
                                            <%--   <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                        <div id="t_div_6" class="col-md-2 mt-step-col last" style="cursor:pointer;" href="#tab_6"  data-toggle="tab" onclick="setTab('6')">
                                            <div class="mt-step-number bg-white">6</div>
                                            <div class="mt-step-title uppercase font-grey-cascade" >结果/result</div>
                                            <%--   <div class="mt-step-content font-grey-cascade">Lorem ipsum dolor sit amet</div>--%>
                                        </div>
                                    </div>
                                </div>


                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab_1">
                                        <div class="row" >
                                            <div class="col-md-3 text-center">
                                                <a href="#" title="下载数据加总模板" target=_self onclick="downloadMFile()" style="text-align: center;">
                                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/s_4.png" class="img-responsive center-block" />
                                                    <div class="mask" style="text-align: center;"><h4 class="text-success">下载模板</h4></div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 text-center">
                                                <a href="#" title="上传加总配置文件" target=_self onclick="uploadFile()">
                                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/s_2.png" class="img-responsive center-block" />
                                                    <div class="mask" style="text-align: center;"><h4 class="text-success">上传加总</h4></div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 text-center">
                                                <a href="#" title="配置加总数据" target=_self onclick="addAgg()">
                                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/s_1.png" class="img-responsive center-block"/>
                                                    <div class="mask" style="text-align: center;"><h4 class="text-success">配置加总</h4></div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 text-center">
                                                <a href="#" title="下一步选择加总数据集" target=_self onclick="selectTab()" >
                                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/s_3.png" class="img-responsive center-block"/>
                                                    <div class="mask" style="text-align: center;"><h4 class="text-success">选择数据</h4></div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="tab_2" >
                                        <div class="demo" style="background: #f1e3e3;">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="main-timeline" id="main-timeline">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_3">
                                        <div class="col-md-12">
                                            <div class="row" >
                                                <div class="form-group">
                                                    <div class="col-md-2"></div>
                                                    <label class="col-md-1 control-label">模型闭合</label>
                                                    <div class="col-md-7">
                                                        <select class="form-control"  id="colsure" onchange="colsureChange(this.value)">
                                                            <option value="">--请选择--</option>
                                                            <option value="BookClosure">标准闭合</option>
                                                            <option value="ShortClosure">短期闭合</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label"></label>
                                                    <div class="col-md-7">
                                                        <textarea id="closureTxt" name="closureTxt" class="form-control" rows="15" disabled></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击<span class="required">*</span></label>
                                                    <div class="form-group col-md-3">
                                                        <select class="form-control" id="shockType" onchange="shockTypeChange(this.value)">
                                                        </select>
                                                        <%--因素冲击--%>
                                                    </div>
                                                    <label class="form-group col-md-4  control-label" id="shorckTypeReamrk"></label>
                                                </div>

                                                <div class=" row" style="display: none;" id="div_main">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">冲击元素<span class="required">*</span></label>
                                                    <div class="form-group col-md-3" style="display: none;" id="div_shorck1">
                                                        <select class="form-control" id="sel_shorck1">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display: none;" id="div_shorck2">
                                                        <select class="form-control" id="sel_shorck2">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display:none ;" id="div_shorck3">
                                                        <select class="form-control" id="sel_shorck3">

                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" style="display:none ;" id="div_shorck4">
                                                        <select class="form-control" id="sel_shorck4">

                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"></div>
                                                    <label class="form-group col-md-1 control-label">变化冲击（%）
                                                        <span class="required">*</span></label>
                                                    <div class="form-group col-md-3">
                                                        <input type="number" class="form-control" id="shorckValue" autocomplete="off">
                                                    </div>

                                                    <div class="form-group  col-md-2 col-sm-6 col-xs-6 .col-lg-offset-2">
                                                        &nbsp;
                                                        <button type="button" class="btn btn-info glyphicon glyphicon-plus"
                                                                onclick="addToShorckList()">添加至列表
                                                        </button>
                                                    </div>
                                                    <div class="form-group col-lg-1 col-md-1 col-sm-6 col-xs-6">
                                                        <button type="button" class="btn btn-default glyphicon glyphicon-minus"
                                                                onclick="clearShorckList()">清空列表
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"></label>
                                                    <div class="col-md-7">
                                                        <textarea class="form-control" rows="12" id="shorckTxt" name="shorckTxt"></textarea>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab_5">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <label class="form-group col-md-1 control-label">标题<span class="required">*</span></label>
                                                <div class="form-group col-md-7">
                                                    <input class="form-control" id="runName" name="runName" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <label class="form-group col-md-1 control-label">备注</label>
                                                <div class="form-group col-md-7">
                                                    <textarea class="form-control" id="remark" name="remark" rows="10"></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-offset-4 col-md-6">
                                                    <button type="button" class="btn green btn-ModelRunaddsave">运行求解</button>&nbsp;
                                                    <button type="reset" class="btn default">重置</button>&nbsp;
                                                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="tab_6">
                                        <div class="col-md-12">
                                            <div  id="div_table" class="portlet box yellow" style="display: none;">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-cogs"></i>结果列表</div>
                                                </div>
                                                <div class="portlet-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th width="5%">序号</th>
                                                                <th width="15%"> 模拟名称 </th>
                                                                <th width="15%"> 运行状态  </th>
                                                                <th width="15%"> 创建人 </th>
                                                                <th width="15%"> 创建时间  </th>
                                                                <th width="10%"> 操作 </th>

                                                            </tr>
                                                            </thead>
                                                            <tbody id="rt_tbody">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>


            <!-- END THEME LAYOUT SCRIPTS -->

            <script type="text/javascript" >

                var shorckType;
                var shorckS1;
                var shorckS2;
                var shorckS3;
                var shorckS4;
                var shorckDatas = {};
                var shorckMap = {};
                var jzMap = {};
                var baseShorcks=['pop', 'psaveslack','pfactwld' , 'profitslack', 'incomeslack','endwslack',
                    'cgdslack', 'tradslack', 'ams' ,'atm' ,'atf', 'ats' ,'atd','aosec', 'aoreg',  'avasec',
                    'avareg', 'afcom' ,'afsec' ,'afreg', 'afecom','afesec' ,'afereg' ,'aoall','afall',
                    'afeall' , 'au', 'dppriv' ,'dpgov' ,'dpsave' , 'to', 'tp', 'tm' ,'tms', 'tx', 'txs',  'qo'];


                var usercontextpath = "<%=request.getContextPath()%>";
                jQuery(document).ready(function () {
                    shorckMap =${shorckMap};
                    jzMap=${jzMap};
                    initShockType();
                    //refSimulateList();

                    $(".btn-ModelRunaddsave").bind("click", function () {
                        var jzId = $("#jzId").val();
                        var closureTxt = $("#closureTxt").val();
                        var shorckTxt = $("#shorckTxt").val();
                        var runName = $("#runName").val();

                        if (jzId == null || jzId == "") {
                            PlatformCommonUtils.warn("请选择加总数据");
                            return;
                        }

                        if (closureTxt == null || closureTxt == "") {
                            PlatformCommonUtils.warn("请选择闭合");
                            return;
                        }

                        if (shorckTxt == null || shorckTxt == "") {
                            PlatformCommonUtils.warn("冲击列表不能为空");
                            return;
                        }

                        if (shorckValue == null || shorckValue == "") {
                            PlatformCommonUtils.warn("请输入变化冲击值");
                            return;
                        }

                        if (runName == null || runName == "") {
                            PlatformCommonUtils.warn("请输入此次模拟的标题");
                            return;
                        }




                        $('form').ajaxSubmit(
                            {
                                type: 'POST',
                                url: usercontextpath + '/modelrun/runOnline.page',
                                forceSync: false,
                                data: {'colsure': $("#closureTxt").val(), 'shorck': $("#shorckTxt").val(),'runname': $("#runName").val(),'jzid':$("#jzId").val(),'remark':$("#remark").val()},
                                dataType: 'json',
                                beforeSubmit: function () {
                                    App.startPageLoading({message: '保存中...'});
                                },
                                error: function (xhr, ajaxOptions,
                                                 thrownError) {
                                    PDP.warn(thrownError);
                                },

                                success: function (responseText,
                                                   statusText, xhr, $form) {

                                    window.setTimeout(function () {
                                        App.stopPageLoading();
                                    }, 2000);
                                    var msg = responseText;
                                    var title = '增加模型运行';
                                    var tiptype = "success";
                                    if (msg == 'success') {
                                        msg = "增加模型运行完毕"
                                        PDP.success(msg, function () {
                                            // ModelDialog.getCurrentModal().modal('hide');
                                            //SysModelRunManager.queryModelRuns(false);
                                            refSimulateList();
                                            $("#t_div_6").click();
                                        });
                                    } else {
                                        PlatformCommonUtils.warn(msg);
                                    }


                                }

                            });

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
                    if (value !== null) $("#closureTxt").val(Colsure[value]);
                }

                /**
                 * 选择冲击大类-同步联动子类
                 * @param value
                 * 1、全局变量清空
                 * 2、清空所有select
                 * 3、style  displany none
                 * */
                function shockTypeChange(value) {
                    if($("#jzId").val()==""||$("#jzId").val()==null){
                        PlatformCommonUtils.warn("请选择加总！");
                        return;
                    }else{
                        shorckType = value , shorckS1 = "", shorckS2 = "";
                        shorckS3 = "", shorckS4 = "";
                        $("select[id^='sel_shorck'] option").remove();
                        $("div[id^='div_']").css("display", "none");
                        $("#shorckTypeReamrk").text("");
                        if (shorckType !== null) {
                            var obj = $.extend({}, shorckMap[shorckType]);
                            if("qo"==shorckType){
                                obj.shorckS1="ENDW_COMM";
                                obj.shorckS2="REG";
                            }
                            obj.remark=$("#jzId").val();
                            $("#shorckTypeReamrk").text(shorckMap[shorckType].remark);
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
                }
                function zjChange(value){
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
                    for(var i=0;i<baseShorcks.length;i++){
                        var option = $("<option value='" + baseShorcks[i] + "'>" +  baseShorcks[i] + "</option>");
                        option.appendTo(shockType);
                    }
                }


                function uploadFile() {
                    ModelDialog.dialog({
                        title: "上传加总文件",
                        showfooter: false,
                        url: usercontextpath + "/modeljz/toIndexJzFile.page",
                        width: "700px",
                        height: "450px"
                    });
                }

                function addAgg() {
                    ModelDialog.dialog({
                        title: "创建数据加总",
                        showfooter: false,
                        url: usercontextpath + "/modeljz/toIndexAddJzMain.page",
                        width: "1340px",
                        height: "568px"

                    });
                }

                function setTab(id) {
                    if(id == 2) {
                        refSimulateSelect();
                    }

                    if(id == 6) {
                        refSimulateList();
                    }
                    for (var i=0;i<=6;i++)
                    {
                        $("#t_div_"+i).removeClass("active");
                        $("#t_div_"+i).removeClass("done");
                    }

                    for (var i=0;i<id;i++)
                    {
                        $("#t_div_"+i).removeClass("active");
                        $("#t_div_"+i).addClass("done");
                    }

                    $("#t_div_"+id).addClass("active");

                }

                function selectTab() {
                    refSimulateSelect();
                    $("#t_div_2").click();

                }

                function selectAgg(val,title) {

                    PDP.confirm("确定选择"+title+"模型数据吗?", function (isConfirm) {
                        if (isConfirm) {
                            $("#jzId").val(val);
                            PDP.success("模型加总数据选择成功!");
                            $("#t_div_3").click();
                        }
                    });



                }

                function refSimulateSelect() {
                    var url = usercontextpath + '/modeljz/refSimulateSelect.page';
                    $.post(url, {},
                        function (json) {
                            if (json != null) {
                                $("#main-timeline").html("");
                                for (var i = 0; i < json.length; i++) {
                                    var html =  '<div class="timeline" ><div class="timeline-content" style="cursor:pointer;" onclick="selectAgg(\''+json[i].mdId+'\',\''+json[i].jzTitle+'\')">' +
                                        '<span class="date"><span class="day">'+json[i].day+'<sup>th</sup></span><span class="month">'+json[i].month+'</span><span class="year">'+json[i].year+'</span></span>' +
                                        '<h2 class="title">'+json[i].jzTitle+'</h2><p class="description">'+json[i].remark+'</p></div></div>';

                                    $("#main-timeline").append(html);

                                }
                            }
                        });
                }


                function refSimulateList() {
                    var url = usercontextpath + '/modeljz/refSimulateList.page';
                    $.post(url, {},
                        function (json) {
                            if (json != null) {
                                $("#rt_tbody").html("");
                                for (var i = 0; i < json.length; i++) {
                                    var xh = i+1;
                                    var html =  '<tr><td>'+xh+'</td><td>'+json[i].runName+'</td><td>'+(json[i].runStatus=="1"?"成功":"失败")+'</td><td>'+json[i].createUsern+'</td><td>'+json[i].creatDate+'</td>' +
                                        '<td><a class="btn btn-xs blue" onclick="showInfo(\''+json[i].runId+'\')"> 详情 </a><a class="btn btn-xs blue" onclick="showRunDatas(\''+json[i].runId+'\')"> 展示 </a>' +
                                        '<a class="btn btn-xs red" download="'+json[i].runName+'.xls" href="${pageContext.request.contextPath}/modelrun/downloadRumData.page?runId='+json[i].runId+'"> 下载 </a></td></tr>';

                                    $("#rt_tbody").append(html);

                                }

                                $("#div_table").show();
                            }
                        });
                }

                function showInfo(runId) {
                    ModelDialog.dialog({
                        title:"模型运行信息",
                        showfooter:false,
                        url:usercontextpath+"/modelrun/getModelRun.page",
                        params:{
                            "runId":runId
                        },
                        width:"900px",
                        height:"600px"
                    });
                }

                function showRunDatas(runId) {
                    ModelDialog.dialog({
                        title:"结果展示",
                        showfooter:false,
                        url:usercontextpath+"/modelrun/showRunData.page",
                        params:{
                            "runid":runId
                        },
                        width:"1000px",
                        height:"600px"
                    });
                }

                function downFile(runId) {
                    // window.open(usercontextpath + "/modelrun/downloadRunRS.page?runId="+runId);
                    window.open(usercontextpath + "/modelrun/downloadRumData.page?runId="+runId);

                }

                function downloadMFile(){
                    window.open(usercontextpath + "/modeljz/downloadAggModule.page");
                }

            </script>
        </div>
    </div>
</div>

<%@ include file="../index/foot.jsp" %>
<link href="${pageContext.request.contextPath}/assets/global/css/googleapis.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<%--<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
<%--<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />--%>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="${pageContext.request.contextPath}/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/assets/pages/css/error.min.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="../assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN THEME GLOBAL STYLES -->
<link href="${pageContext.request.contextPath}/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="${pageContext.request.contextPath}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/assets/layouts/layout/css/themes/${theme_style }.css" rel="stylesheet" type="text/css" id="style_color" />

<link href="${pageContext.request.contextPath}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />

<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/htmleaf-demo.css">--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/demo.css">

<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
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
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<!--<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>-->
<script src="${pageContext.request.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/desktop/desktop-menus.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>


<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->


<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/pager.js" type="text/javascript"></script>
</body>
</html>