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


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_addjz" id="form_addjz" enctype="multipart/form-data">
    <input type="hidden" id="experId" name="experId" value="${experId}"/>
    <input type="hidden" id="experName" name="experName" value="${experName}"/>
    <div class="form-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >实验名称 </label>
                    <div class="col-md-6">
                        ${experName}
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >文件类型 </label>
                    <div class="col-lg-6 col-md-10 col-sm-10">
                        <select class="form-control" id="docType" name="docType">
                            <option value="0">政策计划书</option>
                            <option value="1">实验报告</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >上传文件<span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="file" name="file">
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
                <button type="button" class="btn green btn-JzFilesave">上传</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<!-- END FORM-->
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        var uploadFile = function () {

            $(".btn-JzFilesave").attr('disabled',true);

            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/examinationreport/uploadFile.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            App.startPageLoading({message: '保存中...'});
                        },
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            App.stopPageLoading();
                            PDP.warn(thrownError);
                        },
                        success: function (responseText, statusText, xhr, $form) {
                            window.setTimeout(function () {App.stopPageLoading();}, 2000);
                            var msg = responseText;
                            if (msg == 'success') {
                                msg = "文件上传成功!"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                });
                            } else {
                                $(".btn-JzFilesave").attr('disabled',false);
                                PlatformCommonUtils.warn(msg);
                            }
                        }
                    });
        };

        $(".btn-JzFilesave", ModelDialog.getCurrentModal()).bind("click", function () {
            var file = $("#file").val();
            var experId = $("#experId").val();
            var docType = $("#docType").val();

            if(file == "") {
                PDP.warn("请选择需要上传的文件!");
                return;
            }

            $.ajax({
                url: usercontextpath+"/examinationreport/checkUploadFile.page",
                type: "post",
                data: {"experId":experId,"docType":docType},
                dataType:"json",
                success: function(data){
                    if(data) {
                        uploadFile();
                    }else {
                        PDP.confirm("系统已上传该文件是否覆盖?", function (isConfirm) {
                            if (isConfirm) {
                                uploadFile();
                            }
                        });
                    }
                }

            });
        });

    });
</script>
