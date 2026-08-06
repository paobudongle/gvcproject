<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<style>
	.table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:考核报告分页列表界面。
作者:lijia
版权:bxt
版本:v1.0
日期:2019-10-26 16:43:47
-->
<div class="table-scrollable">
<pg:pager scope="request" data="examinationReports" containerid=".portlet-ExaminationReportlist">
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-ExaminationReportlist">
        <thead>
        <pg:header>
            <th width="2%"></th>
            <th width="4%">序号</th>
            <th>实验名称</th>
            <th>使用模型</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>耗时(分钟)</th>
            <th>总分</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td>
                    <input name="experId" type="radio" class="checkone" groupId="<pg:cell colName="groupId"/>"  teamId="<pg:cell colName="teamId"/>" experName="<pg:cell colName="experName"/>" experId = "<pg:cell colName="experId"/>"/>
                </td>
                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="experName"/>
                </td>
                <td>
                    <pg:cell colName="modelType"/>
                </td>
                <td>
                    <pg:cell colName="startTime"/>

                </td>
                <td>
                    <pg:cell colName="endTime"/>

                </td>
				<td>
					<pg:cell colName="costTime"/>

				</td>
                <td>
                    <pg:cell colName="totalSocre"/>

                </td>
                <td nowrap>
                    <a class="btn btn-xs red btn-viewExaminationReport" experId='<pg:cell colName="experId"  />'
                       groupId="<pg:cell colName="groupId"/>"  teamId="<pg:cell colName="teamId"/>"> 详情 </a>
                    <%--<button class="btn btn-outline btn-xs green-sharp  uppercase"></button>--%>
                </td>

            </tr>
        </pg:list>
        </tbody>
    </table>
    </div>
    <div class="pages"><input type="hidden" value="<pg:querystring/>" id="querystring"/>
		<pg:index tagnumber="10" sizescope="5,10,20,50,100"/>
    </div>

</pg:pager>
<script type="text/javascript">
    jQuery(document).ready(function() {
        var usercontextpath = "<%=request.getContextPath()%>";
        $(".table-ExaminationReportlist .btn-viewExaminationReport").bind('click',function(){
            // var experId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experid");
            // var groupId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("groupId");
            // var teamId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("teamId");
            var experId = $(this).attr("experId");
            ModelDialog.dialog({
                title:"详情",
                showfooter:false,
                // url:usercontextpath+"/examinationreport/getExaminationReport.page?experId="+experId+"&groupId="+groupId+"&teamId="+teamId,
                url:usercontextpath+"/examinationreport/getExaminationReport.page",
                params:{
                    "experId":experId
                },
                width:"1200px",
                height:"568px"

            });
        });
    });
</script>