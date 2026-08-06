<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:添加栏目管理界面。
作者:lijia
版权:bxckj
版本:v1.0
日期:2018-02-26 21:15:12
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addChannelexist">
            <button class="close close-addChannelexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addChannelnotexist">
            <button class="close close-addChannelnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addChannel" id="form_sys_addChannel">
    <input type="hidden" id="pid" name="pid"/>
    <div class="form-body">
        <div class="row">
            <div class="col-md-12">

                    <label class="col-md-3 control-label" >上级栏目</label>
                    <div class="col-md-8">
                        <p class="form-control-static" id="div_pName">
                        </p>
                    </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >栏目名称<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="" name="title" autocomplete="off">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >栏目简称<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="" name="sortTitle" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >内容模板 </label>
                    <div class="col-md-8">
                <%--    <input type="text" class="form-control" placeholder="" name="tplContent" autocomplete="off">--%>
                        <dict:select  type="tplContent" name="tplContent"  extend="class=\"form-control\"" />
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >关键词 </label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="" name="keywrods" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >排序号<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="" name="orderNo" autocomplete="off">
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-3 control-label" >描述 </label>
                    <div class="col-md-8">
                        <textarea class="form-control" placeholder="" name="description" autocomplete="off" rows="3"></textarea>
                        <div class="form-control-focus"></div>


                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <label class="col-md-2 control-label" ></label>
                <label class="mt-checkbox mt-checkbox-outline">
                    <input type="checkbox" id="hasContent" name="hasContent" value="1" /> 是否有内容
                    <span></span>
                </label>
                <label class="mt-checkbox mt-checkbox-outline">
                    <input type="checkbox" id="isDisplay" name="isDisplay" value="1"  /> 是否显示
                    <span></span>
                </label>
                <label class="mt-checkbox mt-checkbox-outline">
                    <input type="checkbox" id="isBlankOpen" name="isBlankOpen" value="1"/> 是否在新页面打开
                    <span></span>
                </label>
            </div>
        </div>


    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-8">&nbsp;
            </div>
        </div>
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <button type="button" class="btn green btn-Channeladdsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<!-- END FORM-->
<script type="text/javascript">
    jQuery(document).ready(function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var pid = $("#pid").val()
        $("#pid",ModelDialog.getCurrentModal()).val(pid);
        $("#div_pName",ModelDialog.getCurrentModal()).text($("#pName").val());
        var addChannel = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/channel/addChannel.page',
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
                            var title = '增加栏目管理';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加栏目管理完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysChannelManager.queryChannels(true);
                                    $('#channel_tree').jstree("refresh_node", pid);

                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }


                        }

                    });
        }
        PDP.validateform({
            form: "#form_sys_addChannel",
            messages: {
                title : {
                    required : "请输入栏目名称"
                },
                sortTitle : {
                    required : "请输入栏目简称"
                },
                orderNo : {
                    required : "请输入排序号",
                    digits:"请输入整数"
                }
            },
            rules: {
                title : {
                    required : true
                },
                sortTitle : {
                    required : true
                },
                orderNo : {
                    required : true,
                    digits:true
                }
            },
            submitHandler: addChannel
        });

        $(".btn-Channeladdsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
