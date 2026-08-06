<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:栏目管理列表界面。
作者:lijia
版权:bxckj
版本:v1.0
日期:2018-02-26 21:15:12
-->
<div class="table-scrollable">
    <table class="table table-bordered table-striped table-condensed table-Channellist">
        <thead>
        <tr>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Channellist .checkboxall','.table-Channellist .checkone')"/>
            </th>
            <th width="2%">序号</th>

            <th>ID</th>


            <th>创建时间</th>


            <th>创建人</th>


            <th>删除标识</th>


            <th>描述</th>


            <th>是否有内容</th>


            <th>是否在新页面打开</th>


            <th>是否显示</th>


            <th>关键词</th>


            <th>修改人</th>


            <th>修改时间</th>


            <th>排序号</th>


            <th>父ID</th>


            <th>简要标题</th>


            <th>标题</th>


            <th>内容模板</th>

            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <pg:list requestKey="channels">


            <tr>
                <td><input
                        name="channelId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Channellist .checkboxall','.table-Channellist .checkone')"
                        value="<pg:cell colName="channelId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="channelId"/>

                </td>
                <td>
                    <pg:cell colName="createDate"/>

                </td>
                <td>
                    <pg:cell colName="creater"/>

                </td>
                <td>
                    <pg:cell colName="delFlag"/>

                </td>
                <td>
                    <pg:cell colName="description"/>

                </td>
                <td>
                    <pg:cell colName="hasContent"/>

                </td>
                <td>
                    <pg:cell colName="isBlankOpen"/>

                </td>
                <td>
                    <pg:cell colName="isDisplay"/>

                </td>
                <td>
                    <pg:cell colName="keywrods"/>

                </td>
                <td>
                    <pg:cell colName="lastModifier"/>

                </td>
                <td>
                    <pg:cell colName="lastModifyDate"/>

                </td>
                <td>
                    <pg:cell colName="orderNo"/>

                </td>
                <td>
                    <pg:cell colName="pid"/>

                </td>
                <td>
                    <pg:cell colName="sortTitle"/>

                </td>
                <td>
                    <pg:cell colName="title"/>

                </td>
                <td>
                    <pg:cell colName="tplContent"/>

                </td>

                <td nowrap>
                    <a class="btn btn-xs blue btn-viewChannel" data='<pg:cell colName="channelId"  />'> 查看 </a>
                    <a class="btn btn-xs red btn-editChannel" data='<pg:cell colName="channelId"  />'>
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
        $(".table-Channellist .btn-viewChannel").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看栏目管理信息",
                showfooter: false,
                url: usercontextpath + "/channel/getChannel.page",
                params: {
                    "channelId": data
                },
                width: "1024px",
                height: "768px"

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
                width: "1024px",
                height: "768px"

            });
        });
    });
</script>	
