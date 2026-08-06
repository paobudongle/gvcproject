<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {
        text-align: center;
        vertical-align: middle !important;
    }
</style>
<!--
描述:序列号分页列表界面。
作者:lijia
版权:xx
版本:v1.0
日期:2018-02-23 09:05:22
-->
<div class="table-scrollable">
<pg:pager scope="request" data="serialNumbers" containerid=".portlet-SerialNumberlist">
    <pg:param name="sn"/>
    <pg:param name="userName"/>
    <pg:param name="orderId"/>

    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-SerialNumberlist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-SerialNumberlist .checkboxall','.table-SerialNumberlist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>订单号</th>
            <th>订单名称</th>
            <th>激活码</th>
            <th>状态</th>
            <th>用户名</th>
            <th>有效期限</th>
            <th>创建时间</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="sn" type="checkbox" class="checkone"
                        onClick="checkOne('.table-SerialNumberlist .checkboxall','.table-SerialNumberlist .checkone')"
                        value="<pg:cell colName="sn"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="orderId"/>
                </td>
                <td>
                    <pg:cell colName="orderName"/>

                </td>
                <td>
                    <pg:cell colName="activateCode"/>

                </td>
                <td>
                    <dict:itemname type="activateStatus" colName="activateStatus"/>
                </td>
                <td>
                    <pg:cell colName="userName"/>
                </td>
                <td>
                    <pg:cell colName="validStartTime"/>-<pg:cell colName="validEndTime"/>
                </td>
                <td>
                    <pg:cell colName="createTime"/>
                </td>
                <td nowrap>
                    <a class="btn btn-xs blue btn-viewSerialNumber" data='<pg:cell colName="sn"  />'> 查看 </a>
                    <a class="btn btn-xs red btn-editSerialNumber" data='<pg:cell colName="sn"  />'>
                        修改
                    </a>
                </td>

            </tr>
        </pg:list>
        </tbody>
    </table>
    </div>
    <div class="pages"><input type="hidden" value="<pg:querystring/>" id="querystring"/><pg:index tagnumber="10"
                                                                                                  sizescope="5,10,20,50,100"/>
    </div>

</pg:pager>
<script type="text/javascript">
    jQuery(document).ready(function () {

        var usercontextpath = "<%=request.getContextPath()%>";
        $(".table-SerialNumberlist .btn-viewSerialNumber").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看序列号信息",
                showfooter: false,
                url: usercontextpath + "/serialnumber/getSerialNumber.page",
                params: {
                    "sn": data
                },
                width: "1024px",
                height: "350px"

            });
        });
        $(".table-SerialNumberlist .btn-editSerialNumber").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改序列号信息",
                showfooter: false,
                url: usercontextpath + "/serialnumber/toUpdateSerialNumber.page",
                params: {
                    "sn": data
                },
                width: "1024px",
                height: "350px"

            });
        });
    });
</script>