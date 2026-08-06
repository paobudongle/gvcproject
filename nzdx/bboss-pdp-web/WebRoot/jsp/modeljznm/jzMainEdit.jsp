<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:编辑模型数据加总界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-adduserexist">
            <button class="close close-adduserexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addusernotexist">
            <button class="close close-addusernotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<pg:beaninfo requestKey="jzMain">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal form_sys_modifyJzMain" id="form_sys_modifyJzMain">
        <div class="form-body">
            <input id="jzId" name="jzId" type="hidden" value="<pg:cell colName="jzId"  />"/>
            <input id="jzStatus" name="jzStatus" type="hidden" value="<pg:cell colName="jzStatus"  />"/>
            <input id="creatDate" name="creatDate" type="hidden" value="<pg:cell colName="creatDate"  />"/>
            <input id="lastModifyDate" name="lastModifyDate" type="hidden"
                   value="<pg:cell colName="lastModifyDate"  />"/>
            <input id="mdId" name="mdId" type="hidden" value="<pg:cell colName="mdId"  />"/>
            <input id="outputDir" name="outputDir" type="hidden" value="<pg:cell colName="outputDir"  />"/>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">数据名称 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="jzTitle" autocomplete="off"
                                   value="<pg:cell colName="jzTitle"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">备注 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="remark" autocomplete="off"
                                   value="<pg:cell colName="remark"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button type="button" class="btn green btn-JzMainmodifysave">保存</button>
                    <button type="reset" class="btn default">重置</button>
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            var usercontextpath = "<%=request.getContextPath()%>";
            var modifyJzMain = function () {
                $('#form_sys_modifyJzMain', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/jsp/modeljz/updateJzMain.page',
                            forceSync: false,
                            dataType: 'json',
                            beforeSubmit: function () {
                                App.startPageLoading({message: '保存中...'});
                            },
                            error: function (xhr, ajaxOptions,
                                             thrownError) {
                                PlatformCommonUtils.warn(thrownError);
                            },

                            success: function (responseText,
                                               statusText, xhr, $form) {

                                window.setTimeout(function () {
                                    App.stopPageLoading();
                                }, 2000);
                                var msg = responseText;
                                var title = '修改模型数据加总';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    msg = "修改模型数据加总完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysJzMainManager.queryJzMains(false);
                                    });
                                } else {
                                    PDP.warn(msg);
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifyJzMain",
                messages: {},
                rules: {},
                submitHandler: modifyJzMain
            });

            $(".btn-JzMainmodifysave", ModelDialog.getCurrentModal()).bind("click", function () {
                $("#form_sys_modifyJzMain", ModelDialog.getCurrentModal()).submit();
            });
        });
    </script>
</pg:beaninfo> 
