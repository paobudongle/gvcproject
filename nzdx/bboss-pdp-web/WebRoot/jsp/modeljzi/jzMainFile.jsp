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
    <input type="hidden" id="mdId" name="mdId" value="${mdId}"/>
    <div class="form-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >数据名称 <span class="required">*</span></label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="" name="jzTitle" autocomplete="off">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >加总文件 <span class="required">*</span> </label>
                    <div class="col-lg-10 col-md-10 col-sm-10">
                        <input type="file" name="file">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >备注<span class="required">*</span></label>
                    <div class="col-md-10">
                        <textarea class="form-control" placeholder="" name="remark" autocomplete="off" rows="10"></textarea>
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
                <button type="button" class="btn green btn-JzFilesave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>

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
                        url: usercontextpath + '/modeljz/addFile.page',
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
                            var title = '增加模型数据加总';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加模型数据加总完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysJzMainManager.queryJzMains(false);
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
