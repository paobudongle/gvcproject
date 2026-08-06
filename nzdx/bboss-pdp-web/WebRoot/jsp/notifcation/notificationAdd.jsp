<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加通知公告界面。
作者:lijia
版权:bxc
版本:v1.0
日期:2018-12-13 12:31:18
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addNotificationexist">
            <button class="close close-addNotificationexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addNotificationnotexist">
            <button class="close close-addNotificationnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addNotification" id="form_sys_addNotification">
    <input type="hidden" id="notificationState" name="notificationState"/>
    <div class="form-body">

        <div class="row">
            <div class="col-md-10">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >通知标题 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="notificationTitle"
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
                        <input type="text" class="form-control date-picker" placeholder="" name="notificationTime"
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
                        <textarea class="form-control" rows="4" name="notificationContent" autocomplete="off"></textarea>
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
<!-- END FORM-->
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    jQuery(document).ready(function () {

        $('.date-picker').datepicker({
            autoclose : true,
            language : 'zh-CN',
            format : 'yyyy-mm-dd'
        });

        var addNotification = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/notifcation/addNotification.page',
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
                            var title = '增加通知公告';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加通知公告完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysNotificationManager.queryNotifications(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addNotification",
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
            submitHandler: addNotification
        });

    });

    function submitNotication(notificationState) {
        $("#notificationState").val(notificationState);
        $("form", ModelDialog.getCurrentModal()).submit();
    }
</script>
