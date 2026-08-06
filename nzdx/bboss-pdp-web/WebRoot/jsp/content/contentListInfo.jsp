<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:内容表分页列表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-18 10:26:11
-->
<div class="table-scrollable">
<pg:pager scope="request" data="contents" containerid=".portlet-Contentlist">
    <pg:param name="cmsContent"/>
    <pg:param name="title"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-Contentlist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-Contentlist .checkboxall','.table-Contentlist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>栏目</th>
            <th>标题</th>
          <%--  <th>作者</th>--%>
            <th>是否发布</th>
            <th>发布时间</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="contentId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-Contentlist .checkboxall','.table-Contentlist .checkone')"
                        value="<pg:cell colName="contentId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="channelName"/>

                </td>
                <td>
                    <pg:cell colName="title"/>

                </td>
               <%-- <td>
                    <pg:cell colName="author"/>

                </td>--%>
                <td>
                    <dict:itemname type="isTure"  colName="contentStatus"/>
                </td>
                <td>
                    <pg:cell colName="releaseDate"/>

                </td>

                <td nowrap>
                    <a class="btn btn-xs blue  btn-viewContent" data='<pg:cell colName="contentId"  />'> 查看 </a>
                    <a class="btn btn-xs red btn-editContent" data='<pg:cell colName="contentId"  />'>
                        修改
                    </a>
                    <a class="btn btn-xs green btn-sentContent" data='<pg:cell colName="contentId"  />'>
                        发布
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
        $(".table-Contentlist .btn-viewContent").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看内容信息",
                showfooter: false,
                url: usercontextpath + "/content/getContent.page",
                params: {
                    "contentId": data
                },
                width: "1024px",
                height: "590px"

            });
        });
        $(".table-Contentlist .btn-editContent").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改内容信息",
                showfooter: false,
                url: usercontextpath + "/content/toUpdateContent.page",
                params: {
                    "contentId": data
                },
                width: "1024px",
                height: "590px"

            });
        });


        $(".table-Contentlist .btn-sentContent").bind('click', function () {
            var data = $(this).attr("data");
            $.post(usercontextpath + "/content/sendContent.page", { "contentId": data},
                function(data){


                  if(data == "success") {
                      PDP.success("发布成功", function () {
                          SysContentManager.queryContents(true);
                      });
                  }else {
                      PlatformCommonUtils.warn("发布失败");
                  }
                }, "json");
        });
    });
</script>