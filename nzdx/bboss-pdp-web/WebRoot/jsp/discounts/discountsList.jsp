<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:优惠活动列表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-02-22 16:34:26
-->
<div class="table-scrollable">
    <table class="table table-bordered table-striped table-condensed table-Discountslist">
        <thead>
        <tr>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Discountslist .checkboxall','.table-Discountslist .checkone')"/>
            </th>
            <th width="2%">序号</th>

            <th>优惠活动ID</th>


            <th>创建时间</th>


            <th>优惠活动描述</th>


            <th>结束时间</th>


            <th>优惠活动名称</th>


            <th>商品价格优惠活动规则(SQL)</th>


            <th>开始时间</th>


            <th>活动状态0:关闭，1启用</th>

            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <pg:list requestKey="discountss">


            <tr>
                <td><input
                        name="discountsId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Discountslist .checkboxall','.table-Discountslist .checkone')"
                        value="<pg:cell colName="discountsId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="discountsId"/>

                </td>
                <td>
                    <pg:cell colName="createTime"/>

                </td>
                <td>
                    <pg:cell colName="discountsDesc"/>

                </td>
                <td>
                    <pg:cell colName="discountsEndTime"/>

                </td>
                <td>
                    <pg:cell colName="discountsName"/>

                </td>
                <td>
                    <pg:cell colName="discountsRule"/>

                </td>
                <td>
                    <pg:cell colName="discountsStartTime"/>

                </td>
                <td>
                    <pg:cell colName="discountsStatus"/>

                </td>

                <td nowrap>
                    <a class="btn btn-xs blue btn-viewDiscounts" data='<pg:cell colName="discountsId"  />'> 查看 </a>
                    <a class="btn btn-xs red btn-editDiscounts" data='<pg:cell colName="discountsId"  />'>
                        修改
                    </a>
                </td>

            </tr>

        </pg:list>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {

        var usercontextpath = "<%=request.getContextPath()%>";
        $(".table-Discountslist .btn-viewDiscounts").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看优惠活动信息",
                showfooter: false,
                url: usercontextpath + "/discounts/getDiscounts.page",
                params: {
                    "discountsId": data
                },
                width: "1024px",
                height: "768px"

            });
        });
        $(".table-Discountslist .btn-editDiscounts").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改优惠活动信息",
                showfooter: false,
                url: usercontextpath + "/discounts/toUpdateDiscounts.page",
                params: {
                    "discountsId": data
                },
                width: "1024px",
                height: "768px"

            });
        });
    });
</script>	
