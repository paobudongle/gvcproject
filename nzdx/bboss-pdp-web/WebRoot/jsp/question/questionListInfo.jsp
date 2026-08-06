<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>

<!--
描述:问题主表分页列表界面。
作者:lijia
版权:xbc
版本:v1.0
日期:2019-06-22 14:10:54
-->
<style>
    .table-scrollable{
        border:none;
    }
    .question-list{

    }
    .question-list .question-item{
        border-top: 1px solid #e7ecf1;
    }
    .question-list .question-item .question-item-title{
        font-size: 14px;
        font-weight: bold;
        color: #333;
        line-height: 35px;
    }
    .question-list .question-item .question-item-body{
        position: relative;
        color: #999;
        line-height: 35px;
    }
    .question-list .question-item .question-item-body .question-item-author{

    }
    .question-list .question-item .question-item-body .question-item-time{
        margin-left: 15px;
    }
    .question-list .question-item .question-item-body .question-item-reply{
        position: absolute;
        right: 0px;
    }
</style>
<div class="table-scrollable">
<pg:pager scope="request" data="questions" containerid=".portlet-Questionlist">
    <pg:param name="qTitle"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <%--    <table class="table table-bordered table-striped table-condensed table-Questionlist">--%>
    <%--        <thead>--%>
    <%--        <pg:header>--%>
    <%--            <th width="3%">序号</th>--%>
    <%--            <th width="60%">标题</th>--%>
    <%--            <th width="15%">作者</th>--%>
    <%--            <th width="15%">时间</th>--%>
    <%--            <th width="15%">回复/查看</th>--%>
    <%--        </pg:header>--%>
    <%--        </thead>--%>
    <%--        <tbody>--%>
    <ul class="question-list">
        <pg:list>
            <li class="question-item">
                <div class="question-item-title"><a onclick="showContent('<pg:cell colName="qId"/>')"><pg:cell colName="qTitle"/></a></div>
                <div class="question-item-body">
                    <span class="question-item-author"><i class="glyphicon glyphicon-user" title="作者"></i> <pg:cell colName="userName"/></span>
                    <span class="question-item-time"><i class="glyphicon glyphicon-calendar" title="时间"></i> <pg:cell colName="qTime"/></span>
                    <span class="question-item-reply">
                        <i class="glyphicon glyphicon-retweet" title="回复"></i>
                        <pg:cell colName="answerCount"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <i class="glyphicon glyphicon-eye-open" title="查看"></i>
                        <pg:cell colName="viewCount"/>
                    </span>
                </div>
            </li>
            <%--            <tr>--%>
            <%--                <td><pg:rowid increament="1" offset="false"/></td>--%>
            <%--                <td>--%>

            <%--                    <a onclick="showContent('<pg:cell colName="qId"/>')"><pg:cell colName="qTitle"/></a>--%>
            <%--                </td>--%>

            <%--                <td>--%>
            <%--                    <pg:cell colName="userName"/>--%>

            <%--                </td>--%>
            <%--                <td>--%>
            <%--                    <pg:cell colName="qTime"/>--%>

            <%--                </td>--%>
            <%--                <td>--%>
            <%--                    <pg:cell colName="answerCount"/>/<pg:cell colName="viewCount"/>--%>

            <%--                </td>--%>

            <%--            </tr>--%>
        </pg:list>
            <%--        </tbody>--%>
    </ul>
    <%--    </table>--%>
    </div>
    <div class="pages"><input type="hidden" value="<pg:querystring/>" id="querystring"/><pg:index tagnumber="10"
                                                                                                  sizescope="5,10,20,50,100"/>
    </div>

</pg:pager>
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    function showContent(data) {

        ModelDialog.dialog({
            title: "详情",
            showfooter: false,
            url: usercontextpath + "/question/getQuestion.page",
            params: {
                "qId": data
            },
            width: "1024px",
            height: "568px"

        });
    }

</script>