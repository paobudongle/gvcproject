<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:编辑内容分类界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-04 17:50:51
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-adduserexist">
            <button class="close close-adduserexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addusernotexist">
            <button class="close close-addusernotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<pg:beaninfo requestKey="contentType">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal form_sys_modifyContentType" id="form_sys_modifyContentType">
        <input type="hidden" id="contentTypeId" name="contentTypeId" value="<pg:cell colName="contentTypeId"  />"/>
        <div class="form-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-2 control-label" >名称 <span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="contentTypeName"  value="<pg:cell colName="contentTypeName"  />"
                                   autocomplete="off">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >图片高度 <span class="required">*</span></label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="" name="imgHeight" autocomplete="off"  value="<pg:cell colName="imgHeight"  />">
                            <div class="form-control-focus"></div>


                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >图片宽度 <span class="required">*</span></label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="" name="imgWidth" autocomplete="off"  value="<pg:cell colName="imgWidth"  />">
                            <div class="form-control-focus"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >是否有图片</label>
                        <div class="col-md-6">
                            <dict:select  type="isTure" name="hasImg"  extend="class=\"form-control\"" defaultValue="${contentType.hasImg}"/>
                            <div class="form-control-focus"></div>


                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >是否显示</label>
                        <div class="col-md-6">
                            <dict:select  type="isTure" name="isDisplay"  extend="class=\"form-control\""  defaultValue='${contentType.isDisplay}' />
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
                <div class="col-md-offset-4 col-md-8">
                    <button type="button" class="btn green btn-ContentTypemodifysave">保存</button>
                    <button type="reset" class="btn default">重置</button>
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            var usercontextpath = "<%=request.getContextPath()%>";
            var modifyContentType = function () {
                $('#form_sys_modifyContentType', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/contenttype/updateContentType.page',
                            forceSync: false,
                            dataType: 'json',
                            beforeSubmit: function () {
                                App.startPageLoading({message: '保存中...'});
                            },
                            error: function (xhr, ajaxOptions,
                                             thrownError) {
                                PlatformCommonUtils.warn(thrownError);
                            },

                            success: function (responseText,
                                               statusText, xhr, $form) {

                                window.setTimeout(function () {
                                    App.stopPageLoading();
                                }, 2000);
                                var msg = responseText;
                                var title = '修改内容分类';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    msg = "修改内容分类完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysContentTypeManager.queryContentTypes(false);
                                    });
                                } else {
                                    PDP.warn(msg);
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifyContentType",
                messages: {},
                rules: {},
                submitHandler: modifyContentType
            });

            $(".btn-ContentTypemodifysave", ModelDialog.getCurrentModal()).bind("click", function () {
                $("#form_sys_modifyContentType", ModelDialog.getCurrentModal()).submit();
            });
        });
    </script>
</pg:beaninfo> 
