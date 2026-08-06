<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:模型数据加总列表界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<div class="table-scrollable">
    <table class="table table-bordered table-striped table-condensed table-JzMainlist">
        <thead>
        <tr>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-JzMainlist .checkboxall','.table-JzMainlist .checkone')"/>
                <input id="jzId" type="hidden" name="jzId" value="<pg:cell colName="jzId"    />"/>
                <input id="lastModifyDate" type="hidden" name="lastModifyDate"
                       value="<pg:cell colName="lastModifyDate"    />"/>
                <input id="mdId" type="hidden" name="mdId" value="<pg:cell colName="mdId"    />"/>
                <input id="outputDir" type="hidden" name="outputDir" value="<pg:cell colName="outputDir"    />"/>
                <input id="creater" type="hidden" name="outputDir" value="<pg:cell colName="creater"    />"/>
            </th>
            <th width="2%">序号</th>
            <th>数据名称</th>
            <th width="4%"  >数据状态</th>
            <th width="25%">备注</th>
            <th width="15%">创建时间</th>
            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <pg:list requestKey="jzMains">


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
                    <dict:itemname type="jzStatus" colName="jzStatus"/>

                </td>

                <td>
                    <pg:cell colName="creatDate"/>

                </td>
                <td>
						 		                				                	<span class="tooltips"
                                                                                          data-original-title="<pg:cell colName="remark"/>">
										<pg:cell colName="remark" maxlength="10" replace=""/>
								</span>

                </td>
                <td nowrap>
                    <a class="btn btn-xs blue btn-viewJzMain" data='<pg:cell colName="jzId"  />'> 详情 </a>
                    <%--<a class="btn btn-xs red btn-editJzMain" data='<pg:cell colName="jzId"  />'>--%>
                        <%--修改--%>
                    <%--</a>--%>
                </td>

            </tr>

        </pg:list>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {

        var usercontextpath = "<%=request.getContextPath()%>";
        $(".table-JzMainlist .btn-viewJzMain").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看数据加总",
                showfooter: false,
                url: usercontextpath + "/jsp/modeljz/getJzMain.page",
                params: {
                    "jzId": data
                },
                width: "1024px",
                height: "768px"

            });
        });
        $(".table-JzMainlist .btn-editJzMain").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改数据加总",
                showfooter: false,
                url: usercontextpath + "/jsp/modeljz/toUpdateJzMain.page",
                params: {
                    "jzId": data
                },
                width: "1024px",
                height: "768px"

            });
        });
    });
</script>	
