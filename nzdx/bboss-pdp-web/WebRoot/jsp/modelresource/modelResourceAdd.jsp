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


    <div>
        <div class="row">
            <div class=" col-md-12">
                <div class="mt-element-step">
                    <div class="row step-thin">

                        <div class="col-md-4 bg-grey mt-step-col  active" id="tt_1" >
                            <div class="mt-step-number bg-white font-grey ">1</div>
                            <div class="mt-step-title uppercase font-grey-cascade">基本信息</div>
                            <div class="mt-step-content font-grey-cascade">information</div>
                            <div href="#tab1" data-toggle="tab" style="display: none"  id="title_1" ></div>
                        </div>


                        <div class="col-md-4 bg-grey mt-step-col display-none" id="tt_2" >
                            <div class="mt-step-number bg-white font-grey">2</div>
                            <div class="mt-step-title uppercase font-grey-cascade">上传附件</div>
                            <div class="mt-step-content font-grey-cascade">upload</div>
                            <div href="#tab2" data-toggle="tab"  style="display: none"  id="title_2" ></div>
                        </div>

                        <div  class="col-md-4 bg-grey mt-step-col display-none" id="tt_3" >
                            <div class="mt-step-number bg-white font-grey">3</div>
                            <div class="mt-step-title uppercase font-grey-cascade">提交</div>
                            <div class="mt-step-content font-grey-cascade">submit</div>
                            <div href="#tab3" data-toggle="tab"  style="display: none"  id="title_3" ></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-wizard">
        <div class="form-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <form action="#" class="form-horizontal form_sys_addModelResource" id="form_sys_addModelResource">
                        <input type="hidden" id="sourceIcon" name="sourceIcon"/>
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
                                    <label class="col-md-3 control-label" >所属模型</label>
                                    <div class="col-md-9">
                                        <dict:select  type="blongsModel" name="blongsModel"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >上级资料 </label>
                                    <div class="col-md-9">
                                        <select name="parentId" id="parentId" class="form-control" aria-invalid="false" onchange="showTabNext()">
                                            <option value="0">顶级</option>
                                            <pg:list requestKey="parentList">
                                                <option value="<pg:cell colName="id"/>"><pg:cell colName="sourceName"  /></option>
                                            </pg:list>
                                        </select>
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >难度等级</label>
                                    <div class="col-md-9">
                                        <dict:select  type="difficLevel" name="difficLevel"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >是否付费</label>
                                    <div class="col-md-9">
                                        <dict:select  type="isCharge" name="isCharge"  extend="class=\"form-control\"" />
                                        <div class="form-control-focus"></div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-3 control-label" >描述<span class="required">*</span></label>
                                    <div class="col-md-9">
                                        <textarea class="form-control" placeholder="" id="description" name="description" autocomplete="off" rows="10"></textarea>
                                        <div class="form-control-focus"></div>

                                    </div>
                                </div>
                            </div>
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
                        </div>
                    </div>
                  </form>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-5 col-md-6">
                                <a href="javascript:;" class="btn btn-outline green button-next display-none" id="btnNext1"> 下一步
                                    <i class="fa fa-angle-right"></i>
                                </a>
                                <a href="javascript:;" class="btn green button-submit "> 提交
                                    <i class="fa fa-check"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab2">
                    <input type="hidden" id="cId"  />
                    <div id="dropz" style="width: 800px;height: 350px; margin-top: 50px;margin-bottom: 10px;" class="dropzone dropzone-file-area" >

                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-5 col-md-6">
                                <a href="javascript:;" class="btn btn-outline green button-previous" id="btnPre1">
                                    <i class="fa fa-angle-left"></i> 上一步 </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="javascript:;" class="btn btn-outline green button-next" id="btnNext2"> 下一步
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab3">
                    <form id="fileInfo">

                    </form>
                    <div class="form-actions" style="padding-top: 25px;">
                        <div class="row">
                            <div class="col-md-offset-5 col-md-6">
                                <a href="javascript:;" class="btn btn-outline green button-previous" id="btnPre2">
                                    <i class="fa fa-angle-left"></i> 上一步 </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="javascript:;" class="btn green" id="btnsubmit3"> 提交
                                    <i class="fa fa-check"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

<div id="fileinfo_temp" style="display: none;">
    <div class="row">
        <input type="hidden" name="id" value="{{id}}">
        <div class="col-md-6">
            <div class="form-group form-md-line-input">
                <label class="col-md-3 control-label" >资料名称<span class="required">*</span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="" name="sourceName" autocomplete="off" value="{{sourceName}}">
                    <div class="form-control-focus"></div>


                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group form-md-line-input">
                <label class="col-md-3 control-label" >描述<span class="required">*</span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="" id="description_{{num}}" name="description" autocomplete="off" value="{{description}}">
                    <div class="form-control-focus"></div>


                </div>
            </div>
        </div>
    </div>
</div>

<div id="fileinfo_temp2" style="display: none;">
    <div class="row">
        <input type="hidden" name="id" value="{{id}}">
        <div class="col-md-4">
            <div class="form-group form-md-line-input">
                <label class="col-md-4 control-label" >资料名称<span class="required">*</span></label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="" name="sourceName" autocomplete="off" value="{{sourceName}}">
                    <div class="form-control-focus"></div>


                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group form-md-line-input">
                <label class="col-md-4 control-label" >时长(分钟)<span class="required">*</span></label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="" id="timeLength_{{num}}" name="timeLength" autocomplete="off" value="{{timeLength}}">
                    <div class="form-control-focus"></div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group form-md-line-input">
                <label class="col-md-4 control-label" >描述<span class="required">*</span></label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="" id="description_{{num1}}" name="description" autocomplete="off" value="{{description}}">
                    <div class="form-control-focus"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
<script type="text/javascript">

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

    var usercontextpath = "<%=request.getContextPath()%>";

    jQuery(document).ready(function () {

        var addModelResource = function () {
            var srcImg =$('img', ModelDialog.getCurrentModal()).attr('src');

            if(typeof srcImg == "undefined"){
                PlatformCommonUtils.warn("请上传资料图片");
                return;
            }

            $("#sourceIcon",ModelDialog.getCurrentModal()).val(srcImg.split(',')[1]);

            $('#form_sys_addModelResource', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modelresource/addModelResource.page',
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
                                    SysModelResourceManager.queryModelResources(false);
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

    function showTab(id) {
        $(".mt-step-col").removeClass("active");
        $("#tt_"+id).addClass("active");
    }
    
    function showTabNext() {
        var parentId = $("#parentId").val();
        if(parentId != "0") {
            getParentInfo(parentId);
            $(".mt-step-col").removeClass("display-none");
            $(".button-next").removeClass("display-none");
            $(".button-submit").addClass("display-none");
        }else {
            $("#tt_2").addClass("display-none");
            $("#tt_3").addClass("display-none");
            $(".button-next").addClass("display-none");
            $(".button-submit").removeClass("display-none");


            $("#sourceType").val("00");
            $("#sourceType").attr("disabled",false);

            $("#blongsModel").val("00");
            $("#blongsModel").attr("disabled",false);

            $("#difficLevel").val("00");
            $("#difficLevel").attr("disabled",false);

            $("#isCharge").val("00");
            $("#isCharge").attr("disabled",false);

            $("#sourceName").val("");
            $("#sourceName").attr("disabled",false);

            $("#description").val("");
            $("#description").attr("disabled",false);

            $('.fileinput-preview').html('');
            $('.btn-file').show();

        }
    }

    function getParentInfo(id) {
       // $("#sourceType").attr("disabled",true);
        $.post(usercontextpath +"/modelresource/getParentInfo.page", {id: id},
            function(data){
                debugger;
                $("#sourceType").val(data.sourceType);
                $("#sourceType").attr("disabled",true);

                $("#blongsModel").val(data.blongsModel);
                $("#blongsModel").attr("disabled",true);

                $("#difficLevel").val(data.difficLevel);
                $("#difficLevel").attr("disabled",true);

                $("#isCharge").val(data.isCharge);
                $("#isCharge").attr("disabled",true);

                $("#sourceName").val(data.sourceName);
                $("#sourceName").attr("disabled",true);

                $("#description").val(data.description);
                $("#description").attr("disabled",true);

                var img = usercontextpath +"/modelResource/"+ data.id +"/icon.jpg";
                $('.fileinput-preview').html('<img src="'+img+'">');
                $('.btn-file').hide();
            });
    }

    $("#btnNext1").click(function(){
        $("#title_2").click();
        showTab('2');

        var acceptedFiles = ".pdf,.zip";
        var sourceType = $("#sourceType").val();
        if(sourceType == "01"){
            acceptedFiles = ".mp4,.avi,.wmv"
        }

        $("#dropz").dropzone({
            url: usercontextpath + '/modelresource/processUpload.page',
            maxFiles: 10,
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
                    formData.append('sourceType', $('#sourceType').val());
                });


                this.on("removedfile", function(file) {

                    var parentId = $("#parentId").val();
                    $.post(usercontextpath +"/modelresource/deleteModelResourceFile.page", {"sourceName":file.name,"parentId":parentId},
                        function(data){
                            //if(data == "success") {
                            console.log(data)
                            //}
                            arrfile.remove(file.name);
                        });

                } );
            }
        });

    });

    $("#btnNext2").click(function(){
        var parentId = $("#parentId").val();
        $("#fileInfo").html("");

        if(arrfile.length ==0) {
            PlatformCommonUtils.warn("请上传附件");
            return;
        }
        $.post(usercontextpath +"/modelresource/getChildren.page", {"parentId": parentId},
            function(data){
                debugger;
                for (var i=0;i<data.length;i++) {
                    var fileName = data[i].sourceName;
                    if(arrfile.in_array(fileName)){
                        debugger;
                        var sourceType = $("#sourceType").val();
                        var html = "";
                        if(sourceType == "00") {
                            html = $("#fileinfo_temp").html();
                        }else {
                            html = $("#fileinfo_temp2").html();
                        }

                        var timeLength = data[i].timeLength == null?"":data[i].timeLength;

                        html = html.replace("{{sourceName}}",data[i].sourceName)
                            .replace("{{description}}",data[i].description)
                            .replace("{{id}}",data[i].id).replace("{{num}}",i).replace("{{num1}}",i).replace("{{timeLength}}",timeLength);
                        $("#fileInfo").append(html);
                    };
                }

                $("#title_3").click();
                showTab('3');
            });





    });

    $("#btnPre1").click(function(){
        $("#title_1").click();
        showTab('1');

    });

    $("#btnPre2").click(function(){
        $("#title_2").click();
        showTab('2');

    });

    $("#btnsubmit3").click(function(){
        debugger;

        for(var i = 0; i < arrfile.length; i++) {
           var description = $("#description_"+i).val();
           var timeLength = $("#timeLength_"+i).val();

           if(timeLength == "") {
               PlatformCommonUtils.warn("请输入时长");
               return;
           }

            if(description == "") {
                PlatformCommonUtils.warn("请输入描述");
                return;
            }
        }

        console.log($("#fileInfo").serialize())

        $.post(usercontextpath +"/modelresource/updateBatchModelResource.page", $("#fileInfo").serialize(),
            function(data){
                if (data  == 'success') {
                    msg = "增加模型资源完毕"
                    PDP.success(msg, function () {
                        ModelDialog.getCurrentModal().modal('hide');
                        SysModelResourceManager.queryModelResources(false);
                    });
                } else {
                    PlatformCommonUtils.warn(msg);
                }
            });

    });




</script>



