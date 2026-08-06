<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css" />
<!--
描述:编辑模型资源界面。
作者:lijia
版权:bjxbc
版本:v1.0
日期:2018-07-26 12:17:13
-->

<pg:beaninfo requestKey="modelResource">
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


                        <div class="col-md-4 bg-grey mt-step-col" id="tt_2" >
                            <div class="mt-step-number bg-white font-grey">2</div>
                            <div class="mt-step-title uppercase font-grey-cascade">上传附件</div>
                            <div class="mt-step-content font-grey-cascade">upload</div>
                            <div href="#tab2" data-toggle="tab"  style="display: none"  id="title_2" ></div>
                        </div>

                        <div  class="col-md-4 bg-grey mt-step-col" id="tt_3" >
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
                    <form action="#" class="form-horizontal form_sys_modifyModelResource" id="form_sys_modifyModelResource">
                        <input type="hidden" id="sourceIcon" name="sourceIcon" value="<%=request.getContextPath()%>/modelResource/${modelResource.id}/icon.jpg"/>
                        <input type="hidden" id="id" name="id" value="<pg:cell colName="id"/>"/>
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-3 control-label" >资料名称<span class="required">*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" placeholder="" id="sourceName" name="sourceName" value="<pg:cell colName="sourceName"  />" autocomplete="off">
                                            <div class="form-control-focus"></div>


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-3 control-label" >资料类型</label>
                                        <div class="col-md-9">
                                            <dict:select  type="sourceType" name="sourceType"  extend="class=\"form-control\" disabled=\"disabled\"" defaultValue='${modelResource.sourceType}' />
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
                                            <dict:select  type="blongsModel" name="blongsModel"  extend="class=\"form-control\"" defaultValue='${modelResource.blongsModel}'  />
                                            <div class="form-control-focus"></div>


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-3 control-label" >上级资料 </label>
                                        <div class="col-md-9">
                                            <select name="parentId" id="parentId" class="form-control" aria-invalid="false" disabled="disabled" >
                                                    <option value="0">顶级</option>
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
                                            <dict:select  type="difficLevel" name="difficLevel"  extend="class=\"form-control\"" defaultValue='${modelResource.difficLevel}' />
                                            <div class="form-control-focus"></div>


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-3 control-label" >是否付费</label>
                                        <div class="col-md-9">
                                            <dict:select  type="isCharge" name="isCharge"  extend="class=\"form-control\"" defaultValue='${modelResource.isCharge}'  />
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
                                            <textarea class="form-control" placeholder="100个字以内！" id="description" name="description" autocomplete="off" rows="10">${modelResource.description}</textarea>
                                            <div class="form-control-focus"></div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-3 control-label" >资料图片<span class="required">*</span></label>
                                        <div class="col-md-9">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
                                                    <img id="imgchange" src="<%=request.getContextPath()%>/modelResource/${modelResource.id}/icon.jpg">
                                                </div>
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
                                <a href="javascript:;" class="btn btn-outline green button-next" id="btnNext1"> 下一步
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab2">
                    <input type="hidden" id="cId"  />
                    <div id="dropz" style="width: 800px;height: 350px; margin-top: 50px;margin-bottom: 10px;" class="dropzone dropzone-file-area" >
                        <pg:list requestKey="childrenList">
                            <div class="dz-preview dz-file-preview dz-processing dz-success dz-complete" id="fj_<pg:cell colName="id"/>">
                                <div class="dz-image"><img data-dz-thumbnail=""></div>
                                <div class="dz-details">
                                    <div class="dz-size"><span data-dz-size=""><strong><pg:cell colName="fileSize"/></strong> MB</span></div>
                                    <div class="dz-filename"><span data-dz-name=""><pg:cell colName="sourceName"/></span></div>
                                </div>
                                <div class="dz-progress">
                                    <span class="dz-upload" data-dz-uploadprogress="" style="width: 100%;"></span>
                                </div>
                                <div class="dz-error-message"><span data-dz-errormessage=""></span></div>
                                <div class="dz-success-mark">
                                    <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                         xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"><title>Check</title>
                                        <defs></defs>
                                        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                                           sketch:type="MSPage">
                                            <path d="M23.5,31.8431458 L17.5852419,25.9283877 C16.0248253,24.3679711 13.4910294,24.366835 11.9289322,25.9289322 C10.3700136,27.4878508 10.3665912,30.0234455 11.9283877,31.5852419 L20.4147581,40.0716123 C20.5133999,40.1702541 20.6159315,40.2626649 20.7218615,40.3488435 C22.2835669,41.8725651 24.794234,41.8626202 26.3461564,40.3106978 L43.3106978,23.3461564 C44.8771021,21.7797521 44.8758057,19.2483887 43.3137085,17.6862915 C41.7547899,16.1273729 39.2176035,16.1255422 37.6538436,17.6893022 L23.5,31.8431458 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z"
                                                  id="Oval-2" stroke-opacity="0.198794158" stroke="#747474"
                                                  fill-opacity="0.816519475" fill="#FFFFFF"
                                                  sketch:type="MSShapeGroup"></path>
                                        </g>
                                    </svg>
                                </div>
                                <div class="dz-error-mark">
                                    <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                         xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"><title>Error</title>
                                        <defs></defs>
                                        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                                           sketch:type="MSPage">
                                            <g id="Check-+-Oval-2" sketch:type="MSLayerGroup" stroke="#747474"
                                               stroke-opacity="0.198794158" fill="#FFFFFF" fill-opacity="0.816519475">
                                                <path d="M32.6568542,29 L38.3106978,23.3461564 C39.8771021,21.7797521 39.8758057,19.2483887 38.3137085,17.6862915 C36.7547899,16.1273729 34.2176035,16.1255422 32.6538436,17.6893022 L27,23.3431458 L21.3461564,17.6893022 C19.7823965,16.1255422 17.2452101,16.1273729 15.6862915,17.6862915 C14.1241943,19.2483887 14.1228979,21.7797521 15.6893022,23.3461564 L21.3431458,29 L15.6893022,34.6538436 C14.1228979,36.2202479 14.1241943,38.7516113 15.6862915,40.3137085 C17.2452101,41.8726271 19.7823965,41.8744578 21.3461564,40.3106978 L27,34.6568542 L32.6538436,40.3106978 C34.2176035,41.8744578 36.7547899,41.8726271 38.3137085,40.3137085 C39.8758057,38.7516113 39.8771021,36.2202479 38.3106978,34.6538436 L32.6568542,29 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z"
                                                      id="Oval-2" sketch:type="MSShapeGroup"></path>
                                            </g>
                                        </g>
                                    </svg>
                                </div>
                                <a class="dz-remove" href="javascript:removeFile('<pg:cell colName="sourceName"/>','<pg:cell colName="id"/>');" data-dz-remove="">删除</a></div>
                        </pg:list>
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
                        <input type="text" class="form-control" placeholder="" id="description_{{num1}}" name="description" autocomplete="off" value="{{description}}">
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
                        <input type="text" class="form-control" placeholder="" id="description_{{num}}" name="description" autocomplete="off" value="{{description}}">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var usercontextpath = "<%=request.getContextPath()%>";
        var initFrom = $("#form_sys_modifyModelResource").serialize();

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


        jQuery(document).ready(function () {

            var modifyModelResource = function () {

                var srcImg =$('img', ModelDialog.getCurrentModal()).attr('src');

                if(typeof srcImg == "undefined"){
                    PlatformCommonUtils.warn("请上传资料图片");
                    return;
                }
                debugger;
                $("#sourceIcon",ModelDialog.getCurrentModal()).val(srcImg.split(',')[1]);

                $('#form_sys_modifyModelResource', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/modelresource/updateModelResource.page',
                            forceSync: false,
                            dataType: 'json',
                            beforeSubmit: function () {
                                App.startPageLoading({message: '保存中...'});
                            },
                            error: function (xhr, ajaxOptions,
                                             thrownError) {
                                PlatformCommonUtils.warn(thrownError);
                            },

                            success: function (responseText, statusText, xhr, $form) {

                                window.setTimeout(function () {
                                    App.stopPageLoading();
                                }, 2000);
                                var msg = responseText;
                                var title = '修改模型资源';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    /*msg = "修改模型资源完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysModelResourceManager.queryModelResources(false);
                                    });*/


                                    $("#title_2").click();
                                    showTab('2');
                                } else {
                                    PDP.warn("修改模型资源失败");
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifyModelResource",
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
                submitHandler: modifyModelResource
            });

            var acceptedFiles = ".pdf,.zip,.mp4,.avi,.rmvb,.wmv,.xls,.xlsx,.doc,.docx,.txt,.rar";
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
                        arrfile.push(file.name)
                    });

                    this.on('sending', function (data, xhr, formData) {
                        //向后台发送该文件的参数
                        formData.append('parentId', $('#id').val());
                        formData.append('sourceType', $('#sourceType').val());
                    });


                    this.on("removedfile", function(file) {
                        removeFile(file.name);
                    } );
                }
            });


        });

        function removeFile(filename,id) {
            var parentId = $("#id").val();
            $.post(usercontextpath +"/modelresource/deleteModelResourceFile.page", {"sourceName":filename,"parentId":parentId},
                function(data){
                    arrfile.remove(filename);
                    $("#fj_"+id).remove();
                });
        }

        $("#btnNext1").click(function(){

            var newFrom = $("#form_sys_modifyModelResource").serialize();
            debugger;

            var p1 = $('#sourceIcon').val();
            var srcImg =$('img', ModelDialog.getCurrentModal()).attr('src');

            if(typeof srcImg == "undefined"){
                PlatformCommonUtils.warn("请上传资料图片");
                return;
            }

            if(p1 != srcImg) {
                $("#form_sys_modifyModelResource", ModelDialog.getCurrentModal()).submit();
            }else if(initFrom != newFrom) {
                $("#form_sys_modifyModelResource", ModelDialog.getCurrentModal()).submit();
            }else {
                $("#title_2").click();
                showTab('2');
            }

        });


        function showTab(id) {
            $(".mt-step-col").removeClass("active");
            $("#tt_"+id).addClass("active");
        }

        $("#btnNext2").click(function(){
            var parentId = $("#id").val();
            $("#fileInfo").html("");
            $.post(usercontextpath +"/modelresource/getChildren.page", {"parentId": parentId},
                function(data){
                    debugger;
                    for (var i=0;i<data.length;i++) {
                        var fileName = data[i].sourceName;
                        debugger;
                        var html = "";
                        if('${modelResource.sourceType}'== "00") {
                            html = $("#fileinfo_temp").html();
                        }else {
                            html = $("#fileinfo_temp2").html();
                        }

                        var timeLength = data[i].timeLength == null?"":data[i].timeLength;
                            html = html.replace("{{sourceName}}",data[i].sourceName)
                                .replace("{{description}}",data[i].description)
                                .replace("{{id}}",data[i].id).replace("{{num}}",i).replace("{{num1}}",i).replace("{{timeLength}}",timeLength);;
                            $("#fileInfo").append(html);

                    }

                    $("#title_3").click();
                    showTab('3');
                });

        });

        $("#btnsubmit3").click(function(){

            for(var i = 0; i < arrfile.length; i++) {
                var val = $("#description_"+i).val();
                if(val == "") {
                    PlatformCommonUtils.warn("请输入描述");
                    return;
                }
            }

            console.log($("#fileInfo").serialize())

            $.post(usercontextpath +"/modelresource/updateBatchModelResource.page", $("#fileInfo").serialize(),
                function(data){
                    if (data  == 'success') {
                        msg = "修改模型资源完毕"
                        PDP.success(msg, function () {
                            ModelDialog.getCurrentModal().modal('hide');
                            SysModelResourceManager.queryModelResources(false);
                        });
                    } else {
                        PlatformCommonUtils.warn(msg);
                    }
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




    </script>
</pg:beaninfo> 
