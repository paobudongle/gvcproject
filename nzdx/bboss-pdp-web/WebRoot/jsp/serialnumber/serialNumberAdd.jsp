<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加序列号界面。
作者:lijia
版权:xx
版本:v1.0
日期:2018-02-23 09:05:22
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addSerialNumberexist">
            <button class="close close-addSerialNumberexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addSerialNumbernotexist">
            <button class="close close-addSerialNumbernotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addSerialNumber" id="form_sys_addSerialNumber">
    <div class="form-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >有效开始时间 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <input type="text" class="form-control date-picker" name="validStartTime"
                                   placeholder=""> <span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
                            <div class="form-control-focus"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >有效结束时间 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <input type="text" class="form-control date-picker" name="validEndTime"
                                   placeholder=""> <span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >订单号</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="orderId" autocomplete="off">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >用户</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="userId" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >状态</label>
                    <div class="col-md-9">
                        <dict:select  type="activateStatus"  name="activateStatus"  extend="class=\"form-control\"" />
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
            <div class="col-md-offset-5 col-md-6">
                <button type="button" class="btn green btn-SerialNumberaddsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<!-- END FORM-->
<script type="text/javascript">
    jQuery(document).ready(function () {
        PDP.initPickers();
        var usercontextpath = "<%=request.getContextPath()%>";
        var addSerialNumber = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/serialnumber/addSerialNumber.page',
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
                            var title = '增加序列号';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加序列号完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysSerialNumberManager.querySerialNumbers(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addSerialNumber",
            messages: {
                validStartTime : {
                    required : "请输入有效开始时间"
                },
                validEndTime : {
                    required : "请输入有效结束时间"
                }
            },
            rules: {
                validStartTime : {
                    required : true
                },
                validEndTime : {
                    required : true
                }
            },
            submitHandler: addSerialNumber
        });

        $(".btn-SerialNumberaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
