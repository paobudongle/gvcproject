<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:序列号主界面。
作者:lijia
版权:xx
版本:v1.0
日期:2018-02-23 09:05:22
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
                        <form role="form" class="form-horizontal form-querySerialNumber">
                            <div class="form-body">
                                <div class="row">
    <%--                                <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >序列号 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="序列号" name="sn">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入序列号</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>--%>

                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >订单号 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="订单号" name="orderId">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入订单号</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-3 control-label" >用户名 </label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="用户名" name="userName">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入用户名</span>
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
                                                                class="btn btn-xs green-haze btn-querySerialNumber "
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
							序列号列表 </span>

                        </div>
                        <div class="actions">

                            <a class="btn btn-xs blue btn-addSerialNumber"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelSerialNumber">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-SerialNumberlist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var SysSerialNumberManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var querySerialNumbers = function (doquery) {
            var sn = $("#sn").val();
            var validEndTime = $("#validEndTime").val();
            var validStartTime = $("#validStartTime").val();
            if (PDP.containSpecial(sn) || PDP.containSpecial(validEndTime) || PDP.containSpecial(validStartTime)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-SerialNumberlist").load(usercontextpath + "/serialnumber/queryListInfoSerialNumbers.page",
                doquery ? $('.form-querySerialNumber').serialize() : {},
                function () {
                });
        }
        return {
            querySerialNumbers: function (doquery) {
                querySerialNumbers(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true,
            language: 'zh-CN',
            format: 'yyyy-mm-dd'
        });
        var usercontextpath = SysSerialNumberManager.usercontextpath();
        SysSerialNumberManager.querySerialNumbers(false);
        $(".form-querySerialNumber .btn-querySerialNumber").bind('click', function () {
            SysSerialNumberManager.querySerialNumbers(true);
        });
        $(".btn-addSerialNumber").bind('click', function () {
            ModelDialog.dialog({
                title: "新增序列号",
                showfooter: false,
                url: usercontextpath + "/serialnumber/toAddSerialNumber.page",
                width: "1024px",
                height: "350px"

            });
        });
        $(".btn-batchdelSerialNumber").bind("click", function () {

            var chk_value = [];
            $('.portlet-SerialNumberlist input[name="sn"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的序列号!");
                return;
            }
            PDP.confirm("确定要删除选中的序列号吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/serialnumber/deleteBatchSerialNumber.page",
                        $.param({
                            "sns": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("序列号删除成功!");
                                SysSerialNumberManager.querySerialNumbers(false);
                            } else {
                                PDP.warn("序列号删除失败:" + responseText);
                            }
                        });
                }
            });
        });


    });

</script>
