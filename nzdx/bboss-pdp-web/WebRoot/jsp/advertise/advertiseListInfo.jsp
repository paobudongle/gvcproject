<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:招聘分页列表界面。
作者:lijia
版权:bc
版本:v1.0
日期:2018-05-19 12:05:28
-->
<div class="table-scrollable">
<pg:pager scope="request" data="advertises" containerid=".portlet-Advertiselist">
    <pg:param name="advertisePosition"/>
    <pg:param name="workAddress"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-Advertiselist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Advertiselist .checkboxall','.table-Advertiselist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th width="20%">招聘职位</th>
            <th width="15%">薪资</th>
            <th width="15%">招聘单位</th>
            <th width="25%">工作地点</th>
            <th width="10%">发布时间</th>
            <th width="10%">状态</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="advertiseId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Advertiselist .checkboxall','.table-Advertiselist .checkone')"
                        value="<pg:cell colName="advertiseId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>

                <td>
                    <pg:cell colName="advertisePosition"/>

                </td>
                <td>
                    <pg:cell colName="workWage"/>

                </td>
                <td>
                    <pg:cell colName="advertiseCompany"/>

                </td>
                <td>
                    <pg:cell colName="workAddress"/>

                </td>
                <td>
                    <pg:cell colName="releaseDate"/>

                </td>

                <td>
                    <dict:itemname type="releaseStatus"  colName="advertiseStatus"/>
                </td>

                <td nowrap>
                    <a class="btn btn-xs blue btn-viewAdvertise" data='<pg:cell colName="advertiseId"  />'> 查看 </a>
                    <a class="btn btn-xs red btn-editAdvertise" data='<pg:cell colName="advertiseId"  />'>
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
        $(".table-Advertiselist .btn-viewAdvertise").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看招聘信息",
                showfooter: false,
                url: usercontextpath + "/advertise/getAdvertise.page",
                params: {
                    "advertiseId": data
                },
                width: "1024px",
                height: "568px"

            });
        });
        $(".table-Advertiselist .btn-editAdvertise").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改招聘信息",
                showfooter: false,
                url: usercontextpath + "/advertise/toUpdateAdvertise.page",
                params: {
                    "advertiseId": data
                },
                width: "1024px",
                height: "568px"

            });
        });
    });
</script>