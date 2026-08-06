<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:编辑序列号界面。
作者:lijia
版权:xx
版本:v1.0
日期:2018-02-23 09:05:22
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
<pg:beaninfo requestKey="serialNumber">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal form_sys_modifySerialNumber" id="form_sys_modifySerialNumber">
        <input type="hidden" id="sn" name="sn" value="<pg:cell colName="sn"  />">
        <div class="form-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group form-md-line-input">
                            <label class="col-md-3 control-label" >有效开始时间 <span class="required">*</span></label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <input type="text" class="form-control date-picker" name="validStartTime" value="<pg:cell colName="validStartTime"  />"
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
                                    <input type="text" class="form-control date-picker" name="validEndTime" value="<pg:cell colName="validEndTime"  />"
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
                                <input type="text" class="form-control" placeholder="" name="orderId" autocomplete="off" value="<pg:cell colName="orderId"  />">
                                <div class="form-control-focus"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group form-md-line-input">
                            <label class="col-md-3 control-label" >用户</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="" name="userId" autocomplete="off" value="<pg:cell colName="userName"  />">
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
                                <script>
                                    $("#activateStatus").val('<pg:cell colName="activateStatus"/>');
                                </script>

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
                    <button type="button" class="btn green btn-SerialNumbermodifysave">保存</button>
                    <button type="reset" class="btn default">重置</button>
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            PDP.initPickers();
            var usercontextpath = "<%=request.getContextPath()%>";
            var modifySerialNumber = function () {
                $('#form_sys_modifySerialNumber', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/serialnumber/updateSerialNumber.page',
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
                                var title = '修改序列号';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    msg = "修改序列号完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysSerialNumberManager.querySerialNumbers(false);
                                    });
                                } else {
                                    PDP.warn(msg);
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifySerialNumber",
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
                submitHandler: modifySerialNumber
            });

            $(".btn-SerialNumbermodifysave", ModelDialog.getCurrentModal()).bind("click", function () {
                $("#form_sys_modifySerialNumber", ModelDialog.getCurrentModal()).submit();
            });
        });
    </script>
</pg:beaninfo> 
