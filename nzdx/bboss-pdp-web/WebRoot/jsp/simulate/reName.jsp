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
            <input type="hidden" id="jzId" name="jzId"value="${jzMain.jzId}"/>
            <div class="form-body" style="padding-top: 10px;">
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: right">加总数据名称<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" name="jzTitle" style="width: 280px;" value="${jzMain.jzTitle}"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <button type="button" class="btn green btn-JzFilesave">确定</button>&nbsp;
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
                        url: usercontextpath + '/modeljz/updateJzTitle.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            PlatformCommonUtils.loading('操作中...');
                        },
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            PDP.warn(thrownError);
                        },
                        success: function (responseText,
                                           statusText, xhr, $form) {
                            var msg = responseText;
                            if (msg == 'success') {
                                msg = "操作成功!"
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
                jzTitle: {
                    required: "重命名不能为空"
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
