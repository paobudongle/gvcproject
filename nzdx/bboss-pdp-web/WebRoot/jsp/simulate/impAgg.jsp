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


<div class="portlet light bordered">
    <div class="portlet-body form">
        <form action="#" class="form-horizontal form_addjz" id="form_addjz" enctype="multipart/form-data">
            <div class="form-body" style="padding-top: 10px;">
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-10 control-label">注意：请将excel后面的空数据行删除！</label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-2 control-label" style="text-align: right">加总文件<span class="required">*</span></label>
                        <div class="col-md-10">
                            <input type="file" name="file" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-2 control-label" style="text-align: right">说明</label>
                        <div class="col-md-10">
                            <textarea class="form-control" rows="3" name="remark"></textarea>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <button type="button" class="btn green btn-JzFilesave">提交</button>&nbsp;
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
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modeljz/impAggExcel.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            PlatformCommonUtils.loading('导入中...');
                        },
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            PDP.warn(thrownError);
                        },
                        success: function (responseText,
                                           statusText, xhr, $form) {
/*                            window.setTimeout(function () {
                                PDP.unloading();
                            }, 2000);*/
                            var msg = responseText;
                            if (msg == 'success') {
                                msg = "导入成功!"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    setTab('2');
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
                file: {
                    required: "请选择加总文件"
                }
            },
            rules: {
                file : {
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
