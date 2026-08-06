<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>

<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css" type="text/css" rel="stylesheet">
<style>
    #nr .btn:not(.md-skip):not(.bs-select-all):not(.bs-deselect-all).btn-sm {
        font-size: 11px;
        padding: 6px 8px 6px 8px;
    }
    #nr .btn:not(.md-skip):not(.bs-select-all):not(.bs-deselect-all) {
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        transition: box-shadow 0.28s cubic-bezier(0.4, 0, 0.2, 1);
        -webkit-border-radius: 2px;
        -moz-border-radius: 2px;
        -ms-border-radius: 2px;
        -o-border-radius: 2px;
        border-radius: 2px;
        overflow: hidden;
        position: relative;
        user-select: none;
        padding: 6px 8px 6px 8px;
    }
    .modal-dialog {
        width: auto;
        height: auto;
    }
    .checkbox {
        margin-left: 20px;
    }

    .note-editor.note-frame.fullscreen {
        position: fixed;
        top: 60px;
        left: 163px;
        z-index: 1050;
        width: 74%;
    }
    .note-editor.note-frame.fullscreen {
        position: fixed;
        top: 8px;
        left: 163px;
        z-index: 1050;
        width: 74%;
    }
    .note-editable{max-width: 1024px;}
</style>

<!--
描述:添加内容表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-18 10:26:11
-->

<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addContentexist">
            <button class="close close-addContentexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addContentnotexist">
            <button class="close close-addContentnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addContent" id="form_sys_addContent">
    <input type="hidden" id="cmsContent" name="cmsContent"/>
    <input type="hidden" id="indexImg" name="indexImg"/>
    <input type="hidden" id="contentStatus" name="contentStatus" value="0"/>
    <div class="form-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >栏目<span class="required">*</span></label>
                    <div class="col-md-6">
                          <select class="form-control" name="channelId">
                              <pg:list actual="${channels}">
                                      <option value="<pg:cell colName="channelId"/>"><pg:cell colName="title"/></option>
                              </pg:list>
                          </select>
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >发布时间 <span class="required">*</span></label>
                    <div class="col-md-6">
                           <input type="text" name="releaseDate" id="releaseDate" class="form-control date-picker" />
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >标题 <span class="required">*</span></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="" id="title" name="title" autocomplete="off">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >摘要 </label>
                    <div class="col-md-9">
                        <textarea class="form-control" placeholder="" name="description" autocomplete="off" rows="2"></textarea>
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="width: 1024px;">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >内容 <span class="required">*</span></label>
                    <div class="col-md-9" id="nr">
                        <div class="summernote" id="mysummernote"> </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-5 col-md-5">
                <button type="button" class="btn green btn-Contentaddsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>

<!-- END FORM-->
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    jQuery(document).ready(function () {

        $('.date-picker').datepicker({
            autoclose : true,
            language : 'zh-CN',
            format : 'yyyy-mm-dd'
        });


        $('#mysummernote').summernote({
            placeholder:'请输入文章内容',
            height:240,
            lang:'zh-CN',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough']],
                ['fontsize', ['fontsize']],
                ['height', ['height']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert',['link','picture','video']],
                ['misc', ['undo', 'redo','fullscreen']]
            ]

         });

        var addContent = function () {
           var htmlstr = $('.summernote').summernote('code');
           var indexImg =  $(".note-editable img").eq(0).attr("src");

           $('#cmsContent', ModelDialog.getCurrentModal()).val(htmlstr);
           $('#indexImg', ModelDialog.getCurrentModal()).val(indexImg);

         $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/content/addContent.page',
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
                            var title = '增加内容表';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加内容表完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysContentManager.queryContents(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addContent",
            messages: {
                releaseDate : {
                    required : "请输入发布时间"
                },
                title : {
                    required : "请输入标题"
                },

            },
            rules: {
                title : {
                    required : true
                },
                releaseDate : {
                    required : true
                }
            },
            submitHandler: addContent
        });

        $(".btn-Contentaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });

</script>
