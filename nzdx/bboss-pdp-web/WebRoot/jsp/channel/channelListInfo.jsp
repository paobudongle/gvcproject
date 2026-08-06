<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:栏目管理分页列表界面。
作者:lijia
版权:bxckj
版本:v1.0
日期:2018-02-26 21:15:12
-->
<div class="table-scrollable">
<pg:pager scope="request" data="channels" containerid=".portlet-Channellist">
    <pg:param name="title"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-Channellist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Channellist .checkboxall','.table-Channellist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>标题</th>
            <th>内容模板</th>
            <th>是否有内容</th>
            <th>是否显示</th>
            <th>排序号</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="channelId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Channellist .checkboxall','.table-Channellist .checkone')"
                        value="<pg:cell colName="channelId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="title"/>

                </td>
                <td>
                    <pg:cell colName="tplContent"/>

                </td>
                <td>
                    <dict:itemname type="isTure"  colName="hasContent"/>
                </td>
                <td>
                    <dict:itemname type="isTure"  colName="isDisplay"/>

                </td>
                <td>
                    <pg:cell colName="orderNo"/>

                </td>
                <td nowrap>
                   <%-- <a class="btn btn-xs blue btn-viewChannel" data='<pg:cell colName="channelId"  />'> 查看 </a>--%>
                    <a class="btn btn-xs red btn-editChannel" data='<pg:cell colName="channelId"  />'>
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
        $(".table-Channellist .btn-viewChannel").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看栏目管理信息",
                showfooter: false,
                url: usercontextpath + "/channel/getChannel.page",
                params: {
                    "channelId": data
                },
                width: "480px",
                height: "520px"

            });
        });
        $(".table-Channellist .btn-editChannel").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改栏目管理信息",
                showfooter: false,
                url: usercontextpath + "/channel/toUpdateChannel.page",
                params: {
                    "channelId": data
                },
                width: "480px",
                height: "520px"

            });
        });
    });
</script>