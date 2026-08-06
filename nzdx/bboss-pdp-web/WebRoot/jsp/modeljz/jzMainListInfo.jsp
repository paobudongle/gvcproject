<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>

<!--
描述:模型数据加总分页列表界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<div class="table-scrollable">
<pg:pager scope="request" data="jzMains" containerid=".portlet-JzMainlist">
    <pg:param name="jzTitle"/>
    <pg:param name="jzStatus"/>
    <pg:param name="creatDate"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-JzMainlist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-JzMainlist .checkboxall','.table-JzMainlist .checkone')"/>
                <input id="jzId" type="hidden" name="jzId" value="<pg:cell colName="jzId"    />"/>
                <input id="lastModifyDate" type="hidden" name="lastModifyDate"
                       value="<pg:cell colName="lastModifyDate"    />"/>
                <input id="mdId" type="hidden" name="mdId" value="<pg:cell colName="mdId"    />"/>
                <input id="outputDir" type="hidden" name="outputDir" value="<pg:cell colName="outputDir"    />"/>
            </th>
            <th width="2%">序号</th>
            <th>数据名称</th>
            <th width="4%">数据状态</th>
            <th width="25%">备注</th>
            <pg:title sort="true" type="th" colName="creat_date" title="创建时间" desc="false" width="15%"/>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr>
                <td><input
                        name="jzId" type="checkbox" class="checkone"
                        onClick="checkOne('.table-JzMainlist .checkboxall','.table-JzMainlist .checkone')"
                        value="<pg:cell colName="jzId"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/></td>
                <td>
                    <pg:cell colName="jzTitle"/>

                </td>
                <td>
                        <%--<pg:cell colName="jzStatus"/>--%>
                    <dict:itemname type="jzStatus" colName="jzStatus"/>

                </td>
                <td>
		                		                				                	<span class="tooltips"
                                                                                          data-original-title="<pg:cell colName="remark"/>">
										<pg:cell colName="remark" maxlength="10" replace=""/>
								</span>

                </td>
                <td>
                    <pg:cell colName="creatDate"/>

                </td>
                <td nowrap>
                    <a class="btn btn-xs blue btn-viewJzMain" data='<pg:cell colName="jzId"  />'> 查看 </a>
                        <%--<a class="btn btn-xs red btn-editJzMain" data='<pg:cell colName="jzId"  />'>--%>
                        <%--修改--%>
                        <%--</a>--%>
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
        $(".table-JzMainlist .btn-viewJzMain").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看模型数据加总信息",
                showfooter: false,
                url: usercontextpath + "/modeljz/getJzMain.page",
                params: {
                    "jzId": data
                },
                width: "1024px",
                height: "568px"

            });
        });
        $(".table-JzMainlist .btn-editJzMain").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改模型数据加总信息",
                showfooter: false,
                url: usercontextpath + "/modeljz/toUpdateJzMain.page",
                params: {
                    "jzId": data
                },
                width: "1024px",
                height: "568px"

            });
        });
    });
</script>