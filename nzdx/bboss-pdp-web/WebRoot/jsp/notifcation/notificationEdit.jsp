<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:编辑通知公告界面。
作者:lijia
版权:bxc
版本:v1.0
日期:2018-12-13 12:31:18
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
<pg:beaninfo requestKey="notification">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal form_sys_modifyNotification" id="form_sys_modifyNotification">
        <input type="hidden" id="notificationState" name="notificationState"/>
        <input type="hidden" id="notificationId" name="notificationId" value="<pg:cell colName="notificationId"  />"/>
        <div class="form-body">

            <div class="row">
                <div class="col-md-10">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" >通知标题 <span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="notificationTitle" value="<pg:cell colName="notificationTitle"  />"
                                   autocomplete="off">
                            <div class="form-control-focus"></div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" >通知时间 <span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control date-picker" placeholder="" name="notificationTime" value="<pg:cell colName="notificationTime"  />"
                                   autocomplete="off">
                            <div class="form-control-focus"></div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" >通知内容 <span class="required">*</span></label>
                        <div class="col-md-9">
                            <textarea class="form-control" rows="4" name="notificationContent" autocomplete="off"><pg:cell colName="notificationContent"  /></textarea>
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
                <div class="col-md-offset-4 col-md-6">
                    <button type="button" class="btn red " onclick="submitNotication('1')">发布</button>
                    <button type="button" class="btn green " onclick="submitNotication('0')">草稿</button>
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            var usercontextpath = "<%=request.getContextPath()%>";
            var modifyNotification = function () {
                $('.date-picker').datepicker({
                    autoclose : true,
                    language : 'zh-CN',
                    format : 'yyyy-mm-dd'
                });
                $('#form_sys_modifyNotification', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/notifcation/updateNotification.page',
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
                                var title = '修改通知公告';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    msg = "修改通知公告完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysNotificationManager.queryNotifications(false);
                                    });
                                } else {
                                    PDP.warn(msg);
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifyNotification",
                messages: {
                    notificationTime : {
                        required : "请输入通知时间"
                    },
                    notificationContent : {
                        required : "请输入通知内容"
                    },
                    notificationTitle : {
                        required : "请输入标题"
                    }
                },
                rules: {
                    notificationTime : {
                        required : true
                    },
                    notificationContent : {
                        required : true
                    },
                    notificationTitle : {
                        required : true
                    }
                },
                submitHandler: modifyNotification
            });

            /*$(".btn-Notificationmodifysave", ModelDialog.getCurrentModal()).bind("click", function () {
                $("#form_sys_modifyNotification", ModelDialog.getCurrentModal()).submit();
            });*/
        });

        function submitNotication(notificationState) {
            $("#notificationState").val(notificationState);
            $("#form_sys_modifyNotification", ModelDialog.getCurrentModal()).submit();
        }
    </script>
</pg:beaninfo> 
