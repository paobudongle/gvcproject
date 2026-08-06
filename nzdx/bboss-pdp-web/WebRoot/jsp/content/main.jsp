<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:内容表主界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-18 10:26:11
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
                        <form role="form" class="form-horizontal form-queryContent">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >标题 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="标题" name="title">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入标题</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >内容 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="内容" name="cmsContent">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入内容</span>
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
                                                                        class="btn btn-xs green-haze btn-queryContent "
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
							内容表列表 </span>

                        </div>
                        <div class="actions">

                            <a class="btn btn-xs blue btn-addContent"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs green btn-reprintContent"> 转载 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelContent">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-Contentlist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var SysContentManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryContents = function (doquery) {
            var cmsContent = $("#cmsContent").val();
            var title = $("#title").val();
            if (PDP.containSpecial(cmsContent) || PDP.containSpecial(title)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-Contentlist").load(usercontextpath + "/content/queryListInfoContents.page",
                doquery ? $('.form-queryContent').serialize() : {},
                function () {
                });
        }
        return {
            queryContents: function (doquery) {
                queryContents(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        var usercontextpath = SysContentManager.usercontextpath();
        SysContentManager.queryContents(false);
        $(".form-queryContent .btn-queryContent").bind('click', function () {
            SysContentManager.queryContents(true);
        });


        $(".btn-addContent").bind('click', function () {
            ModelDialog.dialog({
                title: "新增内容",
                showfooter: false,
                url: usercontextpath + "/content/toAddContent.page",
                width: "1024px",
                height: "590px"

            });
        });

        $(".btn-reprintContent").bind('click', function () {
            ModelDialog.dialog({
                title: "转载内容",
                showfooter: false,
                url: usercontextpath + "/content/toMainReprint.page",
                width: "1200px",
                height: "600px"

            });
        });


        $(".btn-batchdelContent").bind("click", function () {

            var chk_value = [];
            $('.portlet-Contentlist input[name="contentId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的内容!");
                return;
            }
            PDP.confirm("确定要删除选中的内容吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/content/deleteBatchContent.page",
                        $.param({
                            "contentIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("内容删除成功!");
                                SysContentManager.queryContents(false);
                            } else {
                                PDP.warn("内容删除失败:" + responseText);
                            }
                        });
                }
            });
        });


    });

</script>
