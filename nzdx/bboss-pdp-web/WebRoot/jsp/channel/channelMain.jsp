<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:栏目管理主界面。
作者:lijia
版权:bxckj
版本:v1.0
日期:2018-02-26 21:15:12
-->
<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE BAR -->

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
                        <form role="form" class="form-horizontal form-queryChannel">
                            <input type="hidden" id="pid" name="pid"/>
                            <input type="hidden" id="pName" name="pName"/>
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

                                            <div class="col-md-12">
                                                <div class="input-group">
		
															<span class="input-group-btn btn-left">
		
																<button type="button"
                                                                        class="btn btn-xs green-haze btn-queryChannel "
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
							栏目管理列表 </span>

                        </div>
                        <div class="actions">

                            <a class="btn btn-xs blue btn-addChannel"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelChannel">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-Channellist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    var SysChannelManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryChannels = function (doquery) {
            var title = $("#title").val();
            if (PDP.containSpecial(title)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-Channellist").load(usercontextpath + "/channel/queryListInfoChannels.page",
                doquery ? $('.form-queryChannel').serialize() : {},
                function () {
                });
        }
        return {
            queryChannels: function (doquery) {
                queryChannels(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();

    $(document).ready(function () {

        var usercontextpath = SysChannelManager.usercontextpath();
        SysChannelManager.queryChannels(false);

        $(".form-queryChannel .btn-queryChannel").bind('click', function () {
            SysChannelManager.queryChannels(true);
        });

        $(".btn-addChannel").bind('click', function () {
            var pId = $("#pId").val();
            if(pId == "") {
                PDP.warn("请选择左侧栏目树父节点");
                return;
            }

            ModelDialog.dialog({
              title: "新增栏目管理",
                showfooter: false,
                url: usercontextpath + "/channel/toAddChannel.page",
                width: "480px",
                height: "520px"

            });
        });
        $(".btn-batchdelChannel").bind("click", function () {
            var chk_value = [];
            $('.portlet-Channellist input[name="channelId"]:checked').each(function () {

                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的栏目管理!");
                return;
            }
            PDP.confirm("确定要删除选中的栏目管理吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/channel/deleteBatchChannel.page",
                        $.param({
                            "channelIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("栏目管理删除成功!");
                                SysChannelManager.queryChannels(true);
                                debugger;
                                $.each(chk_value, function (index, val) {
                                    $('#channel_tree').jstree("hide_node", chk_value);
                                });
                            } else {
                                PDP.warn("栏目管理删除失败:" + responseText);
                            }
                        });
                }
            });
        });


    });

</script>
