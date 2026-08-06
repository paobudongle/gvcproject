<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:优惠活动主界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-02-22 16:34:26
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
                        <form role="form" class="form-horizontal form-queryDiscounts">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-md-line-input">
                                            <label class="col-md-4 control-label" for="form_control_1">优惠活动名称 </label>
                                            <div class="col-md-8">
                                                <div class="input-icon right">
                                                    <input type="text" class="form-control  input-xs"
                                                           placeholder="优惠活动名称" name="discountsName">
                                                    <div class="form-control-focus"></div>
                                                    <span class="help-block">请输入优惠活动名称</span>
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
                                                                        class="btn btn-xs green-haze btn-queryDiscounts "
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
							优惠活动列表 </span>

                        </div>
                        <div class="actions">

                            <a class="btn btn-xs blue btn-addDiscounts"> 新增 <i class="fa fa-edit"></i></a>
                            <a class="btn btn-xs red btn-batchdelDiscounts">
                                <i class="fa fa-times"></i> 批量删除
                            </a>


                        </div>
                    </div>
                    <div class="portlet-body portlet-Discountslist"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var SysDiscountsManager = function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryDiscountss = function (doquery) {
            var discountsName = $("#discountsName").val();
            if (PDP.containSpecial(discountsName)) {
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-Discountslist").load(usercontextpath + "/discounts/queryListInfoDiscountss.page",
                doquery ? $('.form-queryDiscounts').serialize() : {},
                function () {
                });
        }
        return {
            queryDiscountss: function (doquery) {
                queryDiscountss(doquery);
            },
            usercontextpath: function () {
                return usercontextpath;
            }
        }
    }();
    $(document).ready(function () {
        var usercontextpath = SysDiscountsManager.usercontextpath();
        SysDiscountsManager.queryDiscountss(false);
        $(".form-queryDiscounts .btn-queryDiscounts").bind('click', function () {
            SysDiscountsManager.queryDiscountss(true);
        });
        $(".btn-addDiscounts").bind('click', function () {
            ModelDialog.dialog({
                title: "新增优惠活动",
                showfooter: false,
                url: usercontextpath + "/discounts/toAddDiscounts.page",
                width: "1024px",
                height: "320px"

            });
        });
        $(".btn-batchdelDiscounts").bind("click", function () {

            var chk_value = [];
            $('.portlet-Discountslist input[name="discountsId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要删除的优惠活动!");
                return;
            }
            PDP.confirm("确定要删除选中的优惠活动吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/discounts/deleteBatchDiscounts.page",
                        $.param({
                            "discountsIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("优惠活动删除成功!");
                                SysDiscountsManager.queryDiscountss(false);
                            } else {
                                PDP.warn("优惠活动删除失败:" + responseText);
                            }
                        });
                }
            });
        });


    });

</script>
