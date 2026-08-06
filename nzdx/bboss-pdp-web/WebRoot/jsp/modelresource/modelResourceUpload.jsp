<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css" />
<!--
描述:购买主界面。
作者:lijia
版权:北京碧信诚
版本:v1.0
日期:2018-02-22 16:09:19
-->
    <div class="form-wizard">
        <div class="form-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <form action="#" class="form-horizontal form_sys_addModelResource" id="form_sys_addModelResource">
                        <input type="hidden" id="sourceIcon" name="sourceIcon"/>
                        <input type="hidden" id="id" name="id" value="${id}"/>
                        <input type="hidden" id="parentId" name="parentId" value="${parentId}"/>
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >资料名称<span class="required">*</span></label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="" id="sourceName" name="sourceName" autocomplete="off">
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >资料类型</label>
                                    <div class="col-md-9">
                                        <dict:select  type="sourceType" name="sourceType"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >所属分类</label>
                                    <div class="col-md-9">
                                        <dict:select  type="blongsModel" name="blongsModel"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >难度等级</label>
                                    <div class="col-md-9">
                                        <dict:select  type="difficLevel" name="difficLevel"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-2 control-label" >描述<span class="required">*</span></label>
                                    <div class="col-md-10">
                                        <textarea class="form-control" placeholder="100个字以内！" id="description" name="description" autocomplete="off" rows="5"></textarea>
                                        <div class="form-control-focus"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >资料图片<span class="required">*</span></label>
                                    <div class="col-md-9">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"> </div>
                                            <div>
                                    <span class="btn red btn-outline btn-file">
                                    <span class="fileinput-new"> 选择 </span>
                                    <span class="fileinput-exists"> 修改 </span>
                                    <input type="file" name="..."> </span>
                                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> 移除 </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >上传<span class="required">*</span></label>
                                    <div class="col-md-9">
                                        <div id="dropz" style="width: 250px;height: 190px;margin: 5px;" class="dropzone dropzone-file-area" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="form-actions">
                            <div class="row">
                                <div style="text-align: center;">
                                    <button type="button" class="btn green button-submit">提交</button>
                                    <button type="button" class="btn default" data-dismiss="modal" onclick="removeFile()" >取消</button>
                                </div>
                            </div>
                        </div>
                  </form>

                </div>


            </div>
        </div>

    </div>


<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    Array.prototype.in_array=function(e){
        var index = this.indexOf(e);
        if(index > -1) {
            return true;
        }
        return false;
    };

    Array.prototype.remove = function(val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    var arrfile = new Array();

    var acceptedFiles = ".pdf,.zip,.mp4,.avi,.rmvb,.wmv,.xls,.xlsx,.doc,.docx,.txt,.rar";
    $("#dropz").dropzone({
        url: usercontextpath + '/modelresource/processFrontUpload.page',
        maxFiles: 1,
        maxFilesize: 200,
        acceptedFiles: acceptedFiles,
        addRemoveLinks: true,
        dictRemoveFile: "删除",
        dictDefaultMessage:'拖动文件至此或者点击上传',
        dictMaxFilesExceeded: "只能上传{{maxFiles}}个",
        dictInvalidFileType:"无效文件",
        dictCancelUpload:"取消上传",
        dictResponseError: '上传出现错误',
        dictFileTooBig: '文件大于200MB',
        init:function() {

            this.on("success", function(file,xhr) {
                debugger;
                // alert(file.name)
                arrfile.push(file.name)

            });

            this.on('sending', function (data, xhr, formData) {
                //向后台发送该文件的参数
                formData.append('parentId', $('#parentId').val());
                formData.append('id', $('#id').val());
                formData.append('sourceType', $("#sourceType").val());

            });


            this.on("removedfile", function(file) {

                var id = $("#id").val();
                $.post(usercontextpath +"/modelresource/deleteModelResource.page", {"id":id},
                    function(data){
                        arrfile.remove(file.name);
                    });
            } );
        }
    });

    function removeFile() {
        var id = $("#id").val();
        $.post(usercontextpath +"/modelresource/deleteModelResource.page", {"id":id});
    }


    jQuery(document).ready(function () {

        var addModelResource = function () {
            debugger;

            var srcImg = $('img', ModelDialog.getCurrentModal()).attr('src');

            if(typeof srcImg == "undefined"){
                PlatformCommonUtils.warn("请上传资料图片");
                return;
            }
            if(arrfile.length == 0){
                PlatformCommonUtils.warn("请上传资料");
                return;
            }

            $("#sourceIcon",ModelDialog.getCurrentModal()).val(srcImg.split(',')[1]);

            $('#form_sys_addModelResource', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modelresource/updateFrontModelResource.page',
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
                            var title = '增加模型资源';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加模型资源完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    window.location.reload();
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addModelResource",
            messages: {
                sourceName : {
                    required : "请输入资料名称"
                },
                description : {
                    required : "请输入描述"
                }
            },
            rules: {
                sourceName : {
                    required : true
                },
                description : {
                    required : true
                }
            },
            submitHandler: addModelResource
        });

        $(".button-submit", ModelDialog.getCurrentModal()).bind("click", function () {

            $("#form_sys_addModelResource", ModelDialog.getCurrentModal()).submit();


        });





    });



</script>



