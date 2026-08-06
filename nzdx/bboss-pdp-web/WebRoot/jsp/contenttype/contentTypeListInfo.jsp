<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:内容分类分页列表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-04 17:50:51
-->
<div class="table-scrollable">
<pg:pager scope="request" data="contentTypes" containerid=".portlet-ContentTypelist">
    <pg:param name="contentTypeName"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-ContentTypelist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-ContentTypelist .checkboxall','.table-ContentTypelist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>名称</th>
            <th>图片高度</th>
            <th>图片宽度</th>
            <th>是否显示</th>
            <th>是否有图片</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="contentTypeId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-ContentTypelist .checkboxall','.table-ContentTypelist .checkone')"
                        value="<pg:cell colName="contentTypeId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="contentTypeName"/>

                </td>
                <td>
                    <pg:cell colName="imgHeight"/>

                </td>
                <td>
                    <pg:cell colName="imgWidth"/>

                </td>
                <td>
                    <dict:itemname type="isTure"  colName="isDisplay"/>
                </td>
                <td>
                    <dict:itemname type="isTure"  colName="hasImg"/>
                </td>
                <td nowrap>
                  <%--  <a class="btn btn-xs blue btn-viewContentType" data='<pg:cell colName="contentTypeId"  />'> 查看 </a>--%>
                    <a class="btn btn-xs red btn-editContentType" data='<pg:cell colName="contentTypeId"  />'>
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
        $(".table-ContentTypelist .btn-viewContentType").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看内容分类信息",
                showfooter: false,
                url: usercontextpath + "/contenttype/getContentType.page",
                params: {
                    "contentTypeId": data
                },
                width: "720px",
                height: "250px"

            });
        });
        $(".table-ContentTypelist .btn-editContentType").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改内容分类信息",
                showfooter: false,
                url: usercontextpath + "/contenttype/toUpdateContentType.page",
                params: {
                    "contentTypeId": data
                },
                width: "720px",
                height: "250px"

            });
        });
    });
</script>