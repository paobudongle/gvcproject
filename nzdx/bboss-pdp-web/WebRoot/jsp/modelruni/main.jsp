<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:模型运行主界面。
作者:lw
版权:bjxbckj
版本:v1.0
日期:2018-05-18 11:05:34
-->
<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <admin:menuposition/>
</div>
<!-- END PAGE BAR -->
<!-- BEGIN PAGE TITLE-->
<div class="row">
    <div class=" col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">

                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-pin font-yellow-crusta"></i> <span
                                class="caption-subject bold font-yellow-crusta uppercase">
							查询条件 </span>

                        </div>

                    </div>
                    <div class="portlet-body form">
                        <form role="form" class="form-horizontal form-queryModelRun">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" for="form_control_1">模拟名称 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="模拟名称" name="runName">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入模拟名称</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" for="form_control_1">运行状态 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <dict:select type="mRunStatus" name="runStatus" textValue="执行状态"
                                                                 textNAN="" extend="class=\"form-control input-xs\""/>
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入运行状态</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">

                                            <div class="col-md-12">
                                                <div class="input-group">

															<span class="input-group-btn btn-left">

																<button type="button"
                                                                        class="btn btn-xs green-haze btn-queryModelRun "
                                                                        aria-expanded="false">查询</button>
																<button type="reset" class="btn btn-xs default reset"
                                                                        aria-expanded="false">重置</button>

															</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption">
                            <i class="icon-pin font-yellow-crusta"></i> <span
                                class="caption-subject bold font-yellow-crusta uppercase">
							模型运行列表 </span>

                        </div>
                        <div class="actions">
                            <a class="btn btn-xs blue btn-addModelResult"> 结果下载 <i class="fa fa-download"></i></a>
                            <a class="btn btn-xs blue btn-addModelRun"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelModelRun">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-ModelRunlist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var SysModelRunManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryModelRuns = function (doquery) {
            var runId = $("#runId").val();
            var runName = $("#runName").val();
            var runStatus = $("#runStatus").val();
            var creatDate = $("#creatDate").val();
            if (PDP.containSpecial(runId) || PDP.containSpecial(runName) || PDP.containSpecial(runStatus) || PDP.containSpecial(creatDate)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-ModelRunlist").load(usercontextpath + "/modelrun/queryListInfoModelRuns.page",
                doquery ? $('.form-queryModelRun').serialize() : {},
                function () {
                });
        }
        return {
            queryModelRuns: function (doquery) {
                queryModelRuns(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        var usercontextpath = SysModelRunManager.usercontextpath();
        SysModelRunManager.queryModelRuns(false);
        $(".form-queryModelRun .btn-queryModelRun").bind('click', function () {
            SysModelRunManager.queryModelRuns(true);
        });
        $(".btn-addModelRun").bind('click', function () {
            ModelDialog.dialog({
                title: "创建模拟",
                showfooter: false,
                url: usercontextpath + "/modelrun/toAddModelRun.page",
                width: "1024px",
                height: "568px"

            });
        });
        $(".btn-batchdelModelRun").bind("click", function () {

            var chk_value = [];
            $('.portlet-ModelRunlist input[name="runId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的模拟!");
                return;
            }
            PDP.confirm("确定要删除选中的模拟吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/modelrun/deleteBatchModelRun.page",
                        $.param({
                            "runIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("模拟删除成功!");
                                SysModelRunManager.queryModelRuns(false);
                            } else {
                                PDP.warn("模拟删除失败:" + responseText);
                            }
                        });
                }
            });
        });
        $(".btn-addModelResult").bind("click", function () {
            var chk_value = [];
            $('.portlet-ModelRunlist input[name="runId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要下载的运行数据!");
                return;
            }else if (chk_value.length > 1) {
                PDP.warn("请注意不能同时选择多条数据！");
                return;
            }else{
                window.open(usercontextpath + "/modelrun/downloadRunRS.page?runId="+chk_value.toString());
            }

        });
    });

</script>
