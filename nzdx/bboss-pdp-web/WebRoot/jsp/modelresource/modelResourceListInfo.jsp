<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<style>
    .table th, .table td {text-align: center;vertical-align: middle!important;}
</style>
<!--
描述:模型资源分页列表界面。
作者:lijia
版权:bjxbc
版本:v1.0
日期:2018-07-26 12:17:13
-->
<div class="table-scrollable">
<pg:pager scope="request" data="modelResources" containerid=".portlet-ModelResourcelist">
    <pg:param name="sourceName"/>
    <!-- 加入 class="tableOutline" 可控制表格宽度，滚动条展示 -->
    <table class="table table-bordered table-striped table-condensed table-ModelResourcelist">
        <thead>
        <pg:header>
            <th width="2%"><input type="checkbox" class="checkboxall"
                                  onClick="checkAll('.table-ModelResourcelist .checkboxall','.table-ModelResourcelist .checkone')"/>
            </th>
            <th width="2%">序号</th>
            <th>资料名称</th>
            <th>所属模型</th>
            <th>资料类型</th>
            <th>难度</th>
            <th>是否付费</th>
            <th>下载次数</th>
            <th>浏览次数</th>
            <th>更新日期</th>
            <th width="10%">操作</th>
        </pg:header>
        </thead>
        <tbody>
        <pg:list>

            <tr id="tr_<pg:cell colName="id"/>">
                <td><input name="id" type="checkbox" class="checkone"
                        onClick="checkOne('.table-ModelResourcelist .checkboxall','.table-ModelResourcelist .checkone')"
                        value="<pg:cell colName="id"    />"
                />
                </td>

                <td><pg:rowid increament="1" offset="false"/>
                </td>
                <td style="text-align: left;">

                    <pg:notequal colName="cdnum" value="0">
                        <span  id="sp_<pg:cell colName="id"/>" onclick="showChildren('<pg:cell colName="id"/>','<pg:cell colName="sourceType"/>')" class="glyphicon glyphicon-chevron-right"  style="cursor:pointer"></span>
                        <input type="hidden" id="spv_<pg:cell colName="id"/>" value="true"/>
                    </pg:notequal>
                    <pg:cell colName="sourceName"/>
                </td>
                <td>

                    <dict:itemname type="blongsModel"  colName="blongsModel"/>

                </td>
                <td>

                    <dict:itemname type="sourceType"  colName="sourceType"/>


                </td>
                <td>
                    <dict:itemname type="difficLevel"  colName="difficLevel"/>
                </td>
                <td>
                    <dict:itemname type="isCharge"  colName="isCharge"/>
                </td>
                <td>
                    <pg:cell colName="downloadCount"/>

                </td>

                <td>
                    <pg:cell colName="viewCount"/>

                </td>
                <td >
                    <pg:cell colName="updateDate"/>

                </td>
                <td nowrap>
                    <a class="btn btn-xs red btn-editModelResource" data='<pg:cell colName="id"  />'>
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

    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        $(".table-ModelResourcelist .btn-viewModelResource").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "查看模型资源信息",
                showfooter: false,
                url: usercontextpath + "/modelresource/getModelResource.page",
                params: {
                    "id": data
                },
                width: "1024px",
                height: "568px"

            });
        });
        $(".table-ModelResourcelist .btn-editModelResource").bind('click', function () {
            var data = $(this).attr("data");

            ModelDialog.dialog({
                title: "修改模型资源信息",
                showfooter: false,
                url: usercontextpath + "/modelresource/toUpdateModelResource.page",
                params: {
                    "id": data
                },
                width: "1024px",
                height: "568px"

            });
        });
    });

    function showChildren(id,sourceType) {
        var flag = $("#spv_"+id).val();
        debugger;
        if(flag == "true") {
            $.post(usercontextpath +"/modelresource/getChildren.page", {parentId: id},
                function(data){
                    debugger;
                    var tr = ""
                    for (var i=0;i<data.length;i++) {
                        var num = i+1;
                        tr = tr + "<tr><td>"+num+"</td><td>"+data[i].sourceName+"</td>";

                            if(sourceType =='01') {
                                tr = tr + "<td>"+data[i].timeLength+"</td>";
                            }

                        tr = tr + "<td>"+data[i].description+"</td></tr>";
                    }
                    
                    var chitr = "<tr id='chi_"+id+"'><td colspan=\"2\" ></td><td  colspan=\"9\"><table class=\"table table-bordered table-striped table-condensed table-ModelResourcelist\" ><tr><td width='5%'>序号</td><td>资料名称</td>";
                    if(sourceType =='01') {
                        chitr = chitr +  "<td>时长</td>";
                    }
                    chitr = chitr +  "<td>描述</td></tr>"+tr+"</table></td></tr>";

                    $("#sp_"+id).addClass("glyphicon glyphicon-chevron-down");
                    $("#tr_"+id).after(chitr);
                    $("#spv_"+id).val(false);

                });
        }else {
            $("#sp_"+id).removeClass("glyphicon glyphicon-chevron-down");
            $("#sp_"+id).addClass("glyphicon glyphicon-chevron-right");
            $("#spv_"+id).val(true);
            $("#chi_"+id).remove();
        }



    }
</script>