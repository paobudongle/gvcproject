<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<!--
描述:上传加总文件界面。
作者:LIUWU
版权:北京碧信诚
版本:v1.0
日期:2018-02-22 16:09:19
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addProductexist">
            <button class="close close-addProductexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addProductnotexist">
            <button class="close close-addProductnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>

<div class="portlet light bordered" style="height: 360px">
    <div class="portlet-body form">

        <form action="#" class="form-horizontal form_addjz" id="form_addjz" enctype="multipart/form-data">
            <input type="hidden" id="mdId" name="mdId" value="${mdId}"/>
            <div class="form-body" style="padding-top: 10px;">
                <div class="row">
                <div class="form-group">
                    <label class="col-md-2 control-label">数据名称 <span class="required">*</span></label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="jzTitle"  placeholder="数据名称">
                    </div>
                </div>
                </div>
                <div class="row">
                <div class="form-group">
                    <label  class="col-md-2 control-label">加总文件<span class="required">*</span></label>
                    <div class="col-md-10">
                        <input type="file" name="file" />
                    </div>
                </div>
                </div>
                <div class="row">
                <div class="form-group">
                    <label class="col-md-2 control-label">备注</label>
                    <div class="col-md-10">
                        <textarea class="form-control" rows="7" name="remark"></textarea>
                    </div>
                </div>
                </div> <div class="row">
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <button type="button" class="btn green btn-JzFilesave">提交</button>
                        <button type="button"  class="btn default" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<!-- END FORM-->
<script type="text/javascript">
    jQuery(document).ready(function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var addProduct = function () {
            $(".btn-JzFilesave").attr('disabled',true);
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modeljzi/addFile.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            PlatformCommonUtils.loading('保存中...');
                        },
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            PDP.warn(thrownError);
                        },
                        success: function (responseText,
                                           statusText, xhr, $form) {
                            window.setTimeout(function () {
                                PDP.unloading();
                            }, 2000);
                            var msg = responseText;
                            var title = '增加模型数据加总';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加模型数据加总完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    selectTab();
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }
                        }
                    });


        }
        PDP.validateform({
            form: "#form_addjz",
            messages: {
                jzTitle : {
                    required : "请输入数据名称"
                },
                file: {
                    required: "请选择加总文件"
                }
            },
            rules: {
                jzTitle : {
                    required : true
                }
            },
            submitHandler: addProduct
        });

        $(".btn-JzFilesave", ModelDialog.getCurrentModal()).bind("click", function () {
            $("form", ModelDialog.getCurrentModal()).submit();
        });

    });
</script>
