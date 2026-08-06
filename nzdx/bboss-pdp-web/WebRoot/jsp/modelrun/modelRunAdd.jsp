<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-5-7
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bwizard/css/bwizard.min.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bwizard/js/bwizard.min.js"
        type="text/javascript"></script>


<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addModelRunexist">
            <button class="close close-addModelRunexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addModelRunnotexist">
            <button class="close close-addModelRunnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<form action="#" class="form-horizontal form_sys_addModelRun" id="form_sys_addModelRun">
    <div class="form-body">
        <div id="wizard">
            <ol>
                <li>加总/Agg</li>
                <li>闭合/Colsure</li>
                <li>冲击/Shorcks</li>
                <li>求解/Solve</li>
            </ol>
            <div>
                <%--加总--%>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="form-group col-lg-6 col-sm-6 has-feedback">
                                <label class="col-lg-4 col-sm-4 control-label">加总数据名称<span
                                        class="required">*</span></label>
                                <div class="col-lg-8 col-sm-8">
                                    <%--<input class="form-control" id="disabledInput" type="text" placeholder="该输入框禁止输入..." disabled>--%>
                                        <select class="form-control" id="zjlist" name="zjlist" onchange="zjChange(this.value)">
                                            <option value="">--请选择--</option>
                                        </select>
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-sm-6 text-center">
                                <label class="form-group control-label" id="jzTime"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-sm-12 has-feedback">
                                <div class="col-md-8 col-lg-offset-2">
                                    <textarea id="jzTxt" class="form-control" rows="15" disabled></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <%--闭合--%>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="form-group col-lg-6 col-sm-6 has-feedback">
                                <label class="col-lg-4 col-sm-4 control-label">模型闭合<span
                                        class="required">*</span></label>
                                <div class="col-lg-8 col-sm-8 col-xs-8">
                                    <select class="form-control" id="colsure" onchange="colsureChange(this.value)">
                                        <option value="">--请选择--</option>
                                        <option value="BookClosure">标准闭合</option>
                                        <option value="ShortClosure">短期闭合</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-lg-12 col-sm-12 has-feedback">
                                <div class="col-md-8 col-lg-offset-2 col-sm-12  col-xs-12">
                                    <textarea id="closureTxt" name="closureTxt" class="form-control"
                                              rows="15" disabled></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div>
                <%--冲击--%>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <label class="form-group col-md-1 control-label">冲击<span class="required">*</span></label>
                            <div class="form-group col-md-3">
                                <select class="form-control" id="shockType" onchange="shockTypeChange(this.value)">
                                </select>
                                <%--因素冲击--%>
                            </div>
                            <div class="form-group col-md-8 text-center">
                                <label class="form-group control-label" id="shorckTypeReamrk"></label>
                            </div>
                        </div>

                        <div class=" row" style="display: none;" id="div_main">
                            <label class="form-group col-md-1 control-label">冲击元素<span class="required">*</span></label>
                            <div class="form-group col-md-2" style="display: none;" id="div_shorck1">
                                <select class="form-control" id="sel_shorck1">

                                </select>
                            </div>
                            <div class="form-group col-md-2" style="display: none;" id="div_shorck2">
                                <select class="form-control" id="sel_shorck2">

                                </select>
                            </div>
                            <div class="form-group col-md-2" style="display:none ;" id="div_shorck3">
                                <select class="form-control" id="sel_shorck3">

                                </select>
                            </div>
                            <div class="form-group col-md-2" style="display:none ;" id="div_shorck4">
                                <select class="form-control" id="sel_shorck4">

                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <label class="form-group col-lg-1 col-md-1 control-label">变化冲击（%）
                                <span class="required">*</span></label>
                            <div class="form-group col-lg-3 col-md-3">
                                <input type="number" class="form-control" id="shorckValue" autocomplete="off">
                            </div>

                            <div class="form-group  col-lg-4 col-md-2 col-sm-6 col-xs-6 .col-lg-offset-2">
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
                        <div class="row">
                            <div class="form-group col-lg-12 col-sm-12 col-xs-12 has-feedback">
                                <div class="col-md-11">
                                    <textarea id="shorckTxt" name="shorckTxt" class="form-control" rows="10"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <%--求解--%>
                <div class="form-actions">
                    <div class="row">
                        <label class="form-group col-md-1 control-label">标题<span class="required">*</span></label>
                        <div class="form-group col-md-10">
                            <input class="form-control" id="runName" name="runName" autocomplete="off">
                        </div>
                    </div>
                    <div class="row">
                        <label class="form-group col-md-1 control-label">备注<span class="required">*</span></label>
                        <div class="form-group col-md-10">
                            <textarea class="form-control" id="remark" name="remark" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="button" class="btn green btn-ModelRunaddsave">运行求解</button>&nbsp;
                            <button type="reset" class="btn default">重置</button>&nbsp;
                            <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
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
    $("#wizard").bwizard();
    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        shorckMap =${shorckMap};
        jzMap=${jzMap};
        initJZList();
        initShockType();

        var addModelRun = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modelrun/runOnline.page',
                        forceSync: false,
                        data: {'colsure': $("#closureTxt").val(), 'shorck': $("#shorckTxt").val(),'runname': $("#runName").val(),'jzid':$("#zjlist").val(),'remark':$("#remark").val()},
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
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysModelRunManager.queryModelRuns(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        };
        PDP.validateform({
            form: "#form_sys_addModelRun",
            messages: {
                zjlist:{
                    required: "请选择加总数据"
                },
                closureTxt: {
                    required: "请选择闭合"
                },
                runName: {
                    required: "请输入此次模拟的标题"
                },
                shorckTxt: {
                    required: "冲击列表不能为空"
                }
            },
            rules: {
                zjlist:{
                    required: true
                },
                closureTxt: {
                    required: true
                },
                shorckTxt: {
                    required: true
                },
                runName: {
                    required: true
                }
            },
            submitHandler: addModelRun
        });
        $(".btn-ModelRunaddsave", ModelDialog.getCurrentModal()).bind("click", function () {
            $("form", ModelDialog.getCurrentModal()).submit();
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
        if($("#zjlist").val()==""||$("#zjlist").val()==null){
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
                obj.remark=$("#zjlist").val();
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
    function initJZList() {
        var jzSel = $('#zjlist');
        $.each(jzMap,function(k,v) {
            var option = $("<option value='" + k + "'>" + v.jzTitle + "</option>");
            option.appendTo(jzSel);
        });
    }
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
</script>


