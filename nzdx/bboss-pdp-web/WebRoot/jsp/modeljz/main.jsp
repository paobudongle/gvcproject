<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:模型数据加总主界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
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
                        <form role="form" class="form-horizontal form-queryJzMain">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" for="form_control_1">数据名称</label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs" placeholder="数据名称"
                                                           name="jzTitle">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入数据名称</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" for="form_control_1">数据状态 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <dict:select type="jzStatus" name="jzStatus" textValue="数据状态"
                                                                 textNAN="" extend="class=\"form-control input-xs\""/>
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入数据状态</span>
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
                                                                        class="btn btn-xs green-haze btn-queryJzMain "
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
							模型数据加总列表 </span>

                        </div>
                        <div class="actions">

                            <%--<a class="btn btn-xs blue btn-downloadJzMain"> 下载 <i class="fa fa-download"></i></a>--%>
                            <a class="btn btn-xs blue btn-uploadJzMain">上 传 <i class="fa fa-upload"></i></a>
                            <a class="btn btn-xs blue btn-addJzMain">添 加 <i class="fa fa-creative-commons"></i></a>
                            <a class="btn btn-xs red btn-batchdelJzMain">
                                <i class="fa fa-times"></i> 删 除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-JzMainlist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var SysJzMainManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryJzMains = function (doquery) {
            var jzTitle = $("#jzTitle").val();
            var jzStatus = $("#jzStatus").val();
            var creatDate = $("#creatDate").val();
            if (PDP.containSpecial(jzTitle) || PDP.containSpecial(jzStatus) || PDP.containSpecial(creatDate)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-JzMainlist").load(usercontextpath + "/modeljz/queryListInfoJzMains.page",
                doquery ? $('.form-queryJzMain').serialize() : {},
                function () {
                });
        }
        return {
            queryJzMains: function (doquery) {
                queryJzMains(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        var usercontextpath = SysJzMainManager.usercontextpath();
        SysJzMainManager.queryJzMains(false);
        $(".form-queryJzMain .btn-queryJzMain").bind('click', function () {
            SysJzMainManager.queryJzMains(true);
        });
        $(".btn-addJzMain").bind('click', function () {
            ModelDialog.dialog({
                title: "创建数据加总",
                showfooter: false,
                url: usercontextpath + "/modeljz/toAddJzMain.page",
                width: "1340px",
                height: "568px"

            });
        });
        $(".btn-uploadJzMain").bind('click', function () {
            ModelDialog.dialog({
                title: "上传加总文件",
                showfooter: false,
                url: usercontextpath + "/modeljz/toJzFile.page",
                width: "700px",
                height: "400px"
            });
        });

        $(".btn-batchdelJzMain").bind("click", function () {

            var chk_value = [];
            $('.portlet-JzMainlist input[name="jzId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的模型数据加总!");
                return;
            }
            PDP.confirm("确定要删除选中的模型数据加总吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/modeljz/deleteBatchJzMain.page",
                        $.param({
                            "jzIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("模型数据加总删除成功!");
                                SysJzMainManager.queryJzMains(false);
                            } else {
                                PDP.warn("模型数据加总删除失败:" + responseText);
                            }
                        });
                }
            });
        });


        $(".btn-downloadJzMain").bind("click", function () {
            var chk_value = [];
            $('.portlet-JzMainlist input[name="jzId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要下载的模型加总数据!");
                return;
            }else if (chk_value.length > 1) {
                PDP.warn("请注意不能同时选择多条数据！");
                return;
            }else{
                // window.location.href=usercontextpath + "/modeljz/downloadJZRS.page?jzIds="+chk_value.toString();
                window.open(usercontextpath + "/modeljz/downloadJZRS.page?jzIds="+chk_value.toString());
            }

        });
    });

</script>
