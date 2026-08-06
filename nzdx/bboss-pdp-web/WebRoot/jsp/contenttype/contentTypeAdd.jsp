<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加内容分类界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-04 17:50:51
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addContentTypeexist">
            <button class="close close-addContentTypeexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addContentTypenotexist">
            <button class="close close-addContentTypenotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addContentType" id="form_sys_addContentType">
    <div class="form-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >名称 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" name="contentTypeName"
                               autocomplete="off">
                        <div class="form-control-focus"></div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >图片高度 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="imgHeight" autocomplete="off" value="300">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >图片宽度 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="imgWidth" autocomplete="off" value="300">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >是否有图片</label>
                    <div class="col-md-6">
                        <dict:select  type="isTure" name="hasImg"  extend="class=\"form-control\"" defaultValue="0" />
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >是否显示</label>
                    <div class="col-md-6">
                        <dict:select  type="isTure" name="isDisplay"  extend="class=\"form-control\""  defaultValue="0" />
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
            <div class="col-md-offset-4 col-md-8">
                <button type="button" class="btn green btn-ContentTypeaddsave">创建</button>
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
        var addContentType = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/contenttype/addContentType.page',
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
                            var title = '增加内容分类';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加内容分类完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysContentTypeManager.queryContentTypes(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addContentType",
            messages: {
                contentTypeName : {
                    required : "请输入名称"
                },
            },
            rules: {
                contentTypeName : {
                    required : true
                },
            },
            submitHandler: addContentType
        });

        $(".btn-ContentTypeaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
