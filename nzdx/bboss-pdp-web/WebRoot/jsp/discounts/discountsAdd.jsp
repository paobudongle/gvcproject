<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加优惠活动界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-02-22 16:34:26
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addDiscountsexist">
            <button class="close close-addDiscountsexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addDiscountsnotexist">
            <button class="close close-addDiscountsnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addDiscounts" id="form_sys_addDiscounts">
    <div class="form-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >优惠活动名称 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="discountsName" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >活动状态 </label>
                    <div class="col-md-9">
                        <dict:select  type="activityStatus" name="discountsStatus"  extend="class=\"form-control\"" />
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >开始时间 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <input type="text" class="form-control date-picker" name="discountsStartTime"
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
                    <label class="col-md-3 control-label" >结束时间 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <input type="text" class="form-control date-picker" name="discountsEndTime"
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
                    <label class="col-md-3 control-label" >优惠活动描述 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <textarea class="form-control" placeholder="" name="discountsDesc" autocomplete="off" rows="4"></textarea>
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >优惠活动规则(SQL) <span class="required">*</span></label>
                    <div class="col-md-9">
                        <textarea class="form-control" placeholder="" name="discountsRule" autocomplete="off" rows="4"></textarea>
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
                <button type="button" class="btn green btn-Discountsaddsave">创建</button>
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
        var addDiscounts = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/discounts/addDiscounts.page',
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
                            var title = '增加优惠活动';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加优惠活动完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysDiscountsManager.queryDiscountss(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addDiscounts",
            messages: {
                discountsName : {
                    required : "请输入优惠活动名称"
                },
                discountsStartTime : {
                    required : "请输入开始时间"
                },
                discountsEndTime : {
                    required : "请输入结束时间"
                },
                discountsDesc : {
                    required : "请输入优惠活动描述"
                },
                discountsRule : {
                    required : "请输入优惠活动规则(SQL)"
                }
            },
            rules: {
                discountsName : {
                    required : true
                },
                discountsStartTime : {
                    required : true
                },
                discountsEndTime : {
                    required : true
                },
                discountsDesc : {
                    required : true
                },
                discountsRule : {
                    required : true
                }
            },
            submitHandler: addDiscounts
        });

        $(".btn-Discountsaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
