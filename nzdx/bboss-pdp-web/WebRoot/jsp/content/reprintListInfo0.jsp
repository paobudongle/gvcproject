<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<%--<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>--%>
<!--
描述:内容表分页列表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-18 10:26:11
-->
<div class="table-scrollable">
<pg:pager scope="request" data="reprint" containerid=".portlet-Contentlist1">
    <pg:param name="crawlId" value="0"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-Contentlist1">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Contentlist1 .checkboxall','.table-Contentlist1 .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>资讯标题</th>
            <th>资讯时间</th>
            <th width="120px"> 资讯来源</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="crawlId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Contentlist1 .checkboxall','.table-Contentlist1 .checkone')"
                        value="<pg:cell colName="crawlId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td title="<pg:cell colName="crawlTitle"/>">
                    <pg:cell colName="crawlTitle" maxlength="21"/>...

                </td>
                <td>
                    <pg:cell colName="crawlTime" dateformat="yyyy-MM-dd"/>

                </td>
                <td title="<pg:cell colName="websiteName"/>">
                    <pg:cell colName="websiteName" maxlength="8"/>...

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


</script>