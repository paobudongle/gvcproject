<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加模型运行界面。
作者:lw
版权:bjxbckj
版本:v1.0
日期:2018-05-18 11:05:34
-->
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


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addModelRun" id="form_sys_addModelRun">
    <div class="form-body">
        <input id="runId" name="runId" type="hidden"/>
        <input id="jzId" name="jzId" type="hidden"/>
        <input id="creatDate" name="creatDate" type="hidden"/>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" for="form_control_1">模拟名称 </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="runName" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" for="form_control_1">运行状态 </label>
                    <div class="col-md-9">
                        <dict:select type="mRunStatus" name="runStatus" textValue="执行状态" textNAN=""
                                     extend="class=\"form-control input-sm\""/>
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" for="form_control_1">因素冲击 </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="runShorck" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" for="form_control_1">运行求解 </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="runSolve" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" for="form_control_1">创建人 </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="creater" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">&nbsp;
            </div>
        </div>
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green btn-ModelRunaddsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<!-- END FORM-->
<script type="text/javascript">
    jQuery(document).ready(function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var addModelRun = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/jsp/modelrun/addModelRun.page',
                        forceSync: false,
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
        }
        PDP.validateform({
            form: "#form_sys_addModelRun",
            messages: {},
            rules: {},
            submitHandler: addModelRun
        });

        $(".btn-ModelRunaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();
        });

    });
</script>
