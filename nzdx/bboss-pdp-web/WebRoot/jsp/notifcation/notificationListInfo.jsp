<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>

<!--
描述:通知公告分页列表界面。
作者:lijia
版权:bxc
版本:v1.0
日期:2018-12-13 12:31:18
-->
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<div class="table-scrollable">
<pg:pager scope="request" data="notifications" containerid=".portlet-Notificationlist">
    <pg:param name="notificationTitle"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-Notificationlist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Notificationlist .checkboxall','.table-Notificationlist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th width="22%">通知标题</th>
            <th width="40%">通知内容</th>
            <th width="10%">状态</th>
            <th width="10">通知时间</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="notificationId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Notificationlist .checkboxall','.table-Notificationlist .checkone')"
                        value="<pg:cell colName="notificationId"    />"
                />
                </td>


                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="notificationTitle"/>

                </td>
                <td>
                    <pg:cell colName="notificationContent"/>

                </td>
                <td>
                    <dict:itemname type="releaseStatus"  colName="notificationState"/>

                </td>
                <td>
                    <pg:cell colName="notificationTime"/>

                </td>

                <td nowrap>
                    <a class="btn btn-xs red btn-editNotification" data='<pg:cell colName="notificationId"  />'>
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
    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        $(".table-Notificationlist .btn-viewNotification").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看通知公告信息",
                showfooter: false,
                url: usercontextpath + "/notifcation/getNotification.page",
                params: {
                    "notificationId": data
                },
                width:"800px",
                height:"320px"

            });
        });
        $(".table-Notificationlist .btn-editNotification").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改通知公告信息",
                showfooter: false,
                url: usercontextpath + "/notifcation/toUpdateNotification.page",
                params: {
                    "notificationId": data
                },
                width:"800px",
                height:"320px"

            });
        });
    });
</script>