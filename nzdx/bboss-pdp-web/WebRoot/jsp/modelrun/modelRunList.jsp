<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:模型运行列表界面。
作者:lw
版权:bjxbckj
版本:v1.0
日期:2018-05-18 11:05:34
-->
<div class="table-scrollable">
    <table class="table table-bordered table-striped table-condensed table-ModelRunlist">
        <thead>
        <tr>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-ModelRunlist .checkboxall','.table-ModelRunlist .checkone')"/>
                <input id="runId" type="hidden" name="runId" value="<pg:cell colName="runId"    />"/>
                <input id="jzId" type="hidden" name="jzId" value="<pg:cell colName="jzId"    />"/>
            </th>
            <th width="2%">序号</th>

            <th>模拟名称</th>


            <th>运行状态</th>


            <th>创建人</th>


            <th>创建时间</th>

            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <pg:list requestKey="modelRuns">


            <tr>
                <td><input
                        name="runId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-ModelRunlist .checkboxall','.table-ModelRunlist .checkone')"
                        value="<pg:cell colName="runId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="runName"/>

                </td>
                <td>
                    <dict:itemname type="mRunStatus" colName="runStatus"/>

                </td>
                <td>
                    <pg:cell colName="creater"/>

                </td>
                <td>
                    <pg:cell colName="creatDate" dateformat="yyyy-MM-dd HH:mm:ss"/>

                </td>

                <td nowrap>
                    <a class="btn btn-xs blue btn-viewModelRun" data='<pg:cell colName="runId"  />'> 详情 </a>
                    <a class="btn btn-xs red btn-editModelRun" data='<pg:cell colName="runId"  />'>
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
        $(".table-ModelRunlist .btn-viewModelRun").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "模型运行信息",
                showfooter: false,
                url: usercontextpath + "/modelrun/getModelRun.page",
                params: {
                    "runId": data
                },
                width: "400px",
                height: "300px"

            });
        });
        $(".table-ModelRunlist .btn-editModelRun").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改模型运行信息",
                showfooter: false,
                url: usercontextpath + "/modelrun/toUpdateModelRun.page",
                params: {
                    "runId": data
                },
                width: "1024px",
                height: "768px"

            });
        });
    });
</script>	
