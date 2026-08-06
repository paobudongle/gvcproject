<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:内容类型主界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-04 17:50:51
-->
<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <admin:menuposition/>
</div>
<!-- END PAGE BAR -->
<!-- BEGIN PAGE TITLE-->
<div class="row">
    <div class=" col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">

                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-pin font-yellow-crusta"></i> <span
                                class="caption-subject bold font-yellow-crusta uppercase">
							查询条件 </span>

                        </div>

                    </div>
                    <div class="portlet-body form">
                        <form role="form" class="form-horizontal form-queryContentType">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >名称 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="名称" name="contentTypeName">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入名称</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">

                                            <div class="col-md-12">
                                                <div class="input-group">
		
															<span class="input-group-btn btn-left">
		
																<button type="button"
                                                                        class="btn btn-xs green-haze btn-queryContentType "
                                                                        aria-expanded="false">查询</button>
																<button type="reset" class="btn btn-xs default reset"
                                                                        aria-expanded="false">重置</button>
		
															</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption">
                            <i class="icon-pin font-yellow-crusta"></i> <span
                                class="caption-subject bold font-yellow-crusta uppercase">
							内容类型列表 </span>

                        </div>
                        <div class="actions">

                            <a class="btn btn-xs blue btn-addContentType"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelContentType">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-ContentTypelist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    var SysContentTypeManager = function () {
        var queryContentTypes = function (doquery) {
            var contentTypeName = $("#contentTypeName").val();
            if (PDP.containSpecial(contentTypeName)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-ContentTypelist").load(usercontextpath + "/contenttype/queryListInfoContentTypes.page",
                doquery ? $('.form-queryContentType').serialize() : {},
                function () {
                });
        }
        return {
            queryContentTypes: function (doquery) {
                queryContentTypes(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        var usercontextpath = SysContentTypeManager.usercontextpath();
        SysContentTypeManager.queryContentTypes(false);
        $(".form-queryContentType .btn-queryContentType").bind('click', function () {
            SysContentTypeManager.queryContentTypes(true);
        });
        $(".btn-addContentType").bind('click', function () {
            ModelDialog.dialog({
                title: "新增内容类型",
                showfooter: false,
                url: usercontextpath + "/contenttype/toAddContentType.page",
                width: "720px",
                height: "250px"

            });
        });
        $(".btn-batchdelContentType").bind("click", function () {

            var chk_value = [];
            $('.portlet-ContentTypelist input[name="contentTypeId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的内容类型!");
                return;
            }
            PDP.confirm("确定要删除选中的内容类型吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/contenttype/deleteBatchContentType.page",
                        $.param({
                            "contentTypeIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("内容类型删除成功!");
                                SysContentTypeManager.queryContentTypes(false);
                            } else {
                                PDP.warn("内容类型删除失败:" + responseText);
                            }
                        });
                }
            });
        });


    });

</script>
