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
描述:添加招聘界面。
作者:lijia
版权:bc
版本:v1.0
日期:2018-05-19 12:05:28
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addAdvertiseexist">
            <button class="close close-addAdvertiseexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addAdvertisenotexist">
            <button class="close close-addAdvertisenotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addAdvertise" id="form_sys_addAdvertise">
    <input id="advertiseContent" name="advertiseContent" type="hidden"/>
    <div class="form-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >招聘职位 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="advertisePosition"
                               autocomplete="off" >
                        <div class="form-control-focus"></div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >薪资 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="workWage" autocomplete="off">
                        <div class="form-control-focus"></div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >工作地点 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="workAddress" autocomplete="off"
                               value="<pg:cell colName="workAddress"  />">
                        <div class="form-control-focus"></div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >招聘单位 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="" name="advertiseCompany"
                               autocomplete="off" >
                        <div class="form-control-focus"></div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-md-6">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >发布状态 <span class="required">*</span></label>
                    <div class="col-md-6">
                        <dict:select  type="releaseStatus" name="advertiseStatus"  extend="class=\"form-control\""  defaultValue="0" />
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
        <div class="row" style="width: 1024px;">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >招聘内容 <span class="required">*</span></label>
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
                <button type="button" class="btn green btn-Advertiseaddsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<!-- END FORM-->
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
<script type="text/javascript">

    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {


        $('.date-picker').datepicker({
            autoclose : true,
            language : 'zh-CN',
            format : 'yyyy-mm-dd'
        });


        $('#mysummernote').summernote({
            placeholder:'请输入招聘内容',
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

        var addAdvertise = function () {

            var htmlstr = $('.summernote').summernote('code');
            $('#advertiseContent', ModelDialog.getCurrentModal()).val(htmlstr);

            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/advertise/addAdvertise.page',
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
                            var title = '增加招聘';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加招聘完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysAdvertiseManager.queryAdvertises(false);
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addAdvertise",
            messages: {
                advertisePosition : {
                    required : "请输入招聘职位"
                },
                workWage : {
                    required : "请输入薪资"
                },
                workAddress : {
                    required : "请输入工作地点"
                },
                advertiseCompany : {
                    required : "请输入招聘单位"
                },
                releaseDate : {
                    required : "请输入发布时间"
                },
            },
            rules: {
                advertisePosition : {
                    required : true
                },
                workWage : {
                    required : true
                },
                workAddress : {
                    required : true
                },
                advertiseCompany : {
                    required : true
                },
                releaseDate : {
                    required : true
                },
            },
            submitHandler: addAdvertise
        });

        $(".btn-Advertiseaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
