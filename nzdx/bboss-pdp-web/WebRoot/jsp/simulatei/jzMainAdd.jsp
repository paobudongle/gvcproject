<%@ page import="org.frameworkset.platform.security.AccessControl" %>
<%@ page import="com.common.UserUtils" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<%
    AccessControl control = AccessControl.getAccessControl();
%>

<script src="${pageContext.request.contextPath}/assets/pages/scripts/table-datatables-editable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/datatables/datatables.all.min.js" type="text/javascript"></script>
<!--
描述:添加模型数据加总界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<style>
    .dataTables_length {
        display: none
    }

    #sample_editable_1 .sorting_1 {
        display: none
    }

    #sample_editable_2 .sorting_1 {
        display: none
    }


    .dataTables_info {
        display: none
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addJzMainexist">
            <button class="close close-addJzMainexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addJzMainnotexist">
            <button class="close close-addJzMainnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <span class="label label-primary">参考区域分类</span>
        <div style="float: right;">
            <button type="button" class="btn btn-danger" id="sample_editable_1_load" >载入</button>
        </div>
        <table class="table table-bordered" id="areaSymb"></table>
    </div>

    <div class="col-md-6">
        <span class="label label-primary">参考行业分类</span>
        <div style="float: right;">
            <button type="button" class="btn btn-danger" id="sample_editable_2_load">载入</button>
        </div>
        <table class="table table-bordered" id="indusSymb"></table>
    </div>
</div>

<!-- 国别、行业分类定义区域-->
<div class="row">
    <div class="portlet-body">
        <div class="col-md-6">
            <div class="table-toolbar">
                <div class="row">
                    <div class="col-md-12">
                        <div class="btn-group">
                            <button id="sample_editable_1_new" class="btn green">添加区域分类
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!--id="sample_editable_1"-->
            <table class="table table-striped table-hover table-bordered" id="sample_editable_1" typeValue="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th> 区域</th>
                    <th> 备注</th>
                    <th> 序号</th>
                    <th width="13%"> 编辑</th>
                    <th width="13%"> 删除</th>
                </tr>
                </thead>
                <tbody id="sample_editable_1_tbody">
                <pg:list requestKey="areaList">
                    <tr>
                        <td ><pg:cell colName="dfId"/></td>
                        <td><pg:cell colName="dfTitle"/></td>
                        <td><pg:cell colName="remark"/></td>
                        <td><pg:cell colName="sortNo"/></td>
                        <td>
                            <a class="edit" href="javascript:;"> 编辑 </a>
                        </td>
                        <td>
                            <a class="delete" href="javascript:;"> 删除 </a>
                        </td>
                    </tr>
                </pg:list>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div class="portlet-body">
            <div class="table-toolbar">
                <div class="row">
                    <div class="col-md-12">
                        <div class="btn-group">
                            <button id="sample_editable_2_new" class="btn green"> 添加行业分类
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover table-bordered" id="sample_editable_2" typeValue="1">
                <thead>
                <tr>
                    <td >ID</td>
                    <th> 行业</th>
                    <th> 备注</th>
                    <th> 序号</th>
                    <th> 编辑</th>
                    <th> 删除</th>
                </tr>
                </thead>
                <tbody id="sample_editable_2_tbody">
                <pg:list requestKey="indusList">
                    <tr>
                        <td><pg:cell colName="dfId"/></td>
                        <td><pg:cell colName="dfTitle"/></td>
                        <td><pg:cell colName="remark"/></td>
                        <td><pg:cell colName="sortNo"/></td>
                        <td>
                            <a class="edit" href="javascript:;"> 编辑 </a>
                        </td>
                        <td>
                            <a class="delete" href="javascript:;"> 删除 </a>
                        </td>
                    </tr>
                </pg:list>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- 国别、行业数据区域-->
<div class="row">
    <div class="col-md-6">
        <span class="label label-primary">区域数据</span>&nbsp;&nbsp;<span style="color: #919191;">Ctrl+F 查找</span>
        <!--id="sample_editable_1"-->
        <table class="table table-striped table-hover table-bordered" id="sample_editable_3">
            <thead>
            <tr>
                <th> 国家</th>
                <th> 中文</th>
                <th> 原区域</th>
                <th> 新区域</th>
                <td style="display: none">sortNo</td>
            </tr>
            </thead>
            <tbody id="sample_editable_3_tbody">
            <pg:list requestKey="aList">
                <tr>
                    <td><pg:cell colName="dicTitle"/></td>
                    <td><pg:cell colName="remark"/></td>
                    <td><pg:cell colName="belongs"/></td>
                    <td>
                            <%--TODO--%>
                        <select name="dfTitle" id="dfTitleA_<pg:rowid increament="0" offset="false"/>" ondblclick="changeAfterOption('<pg:rowid increament="0" offset="false"/>','<pg:rowcount />')" onfocus='refSelOption(this,0)'>>
                            <option value="">-请选择-</option>
                            <pg:list requestKey="selA">
                                <option value="<pg:cell colName='dfTitle'/>" <pg:equal expression="{0.dfTitle}"
                                                                                       expressionValue="{dfTitle}">
                                    selected</pg:equal>>
                                    <pg:cell colName='dfTitle'/>
                                </option>
                            </pg:list>
                        </select>
                            <%--<pg:cell colName="dfTitle"/>--%>
                            <%--<select id="select_sample_editable_1" name="dfTitle" style="width:90px;">--%>
                            <%--<option value="">--请选择--</option>--%>
                            <%--<pg:list requestKey="amaps">--%>
                            <%--<option value="<pg:cell colName="dfTitle"/>"><pg:cell colName="dfTitle"/></option>--%>
                            <%--</pg:list>--%>
                            <%--</select>--%>
                    </td>
                    <td style="display: none"><pg:cell colName="sortNo"/></td>
                </tr>
            </pg:list>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <span class="label label-primary">行业数据</span>&nbsp;&nbsp;<span style="color: #919191;">Ctrl+F 查找</span>
        <table class="table table-striped table-hover table-bordered" id="sample_editable_4">
            <thead>
            <tr>
                <th> 行业</th>
                <th> 中文</th>
                <th> 原分类</th>
                <th> 新分类</th>
                <td style="display: none">sortNo</td>
            </tr>
            </thead>
            <tbody id="sample_editable_4_tbody">
            <pg:list requestKey="iList">
                <tr>
                    <td><pg:cell colName="dicTitle"/></td>
                    <td><pg:cell colName="remark"/></td>
                    <td><pg:cell colName="belongs"/></td>
                    <td>
                        <select name="dfTitle" id="dfTitleI_<pg:rowid increament="0" offset="false"/>" ondblclick="changeIfterOption('<pg:rowid increament="0" offset="false"/>','<pg:rowcount />')" onfocus='refSelOption(this,1)'>>
                            <option value="">-请选择-</option>
                            <pg:list requestKey="selD">
                                <option value="<pg:cell colName='dfTitle'/>" <pg:equal expression="{0.dfTitle}"
                                                                                       expressionValue="{dfTitle}">
                                    selected</pg:equal>>
                                    <pg:cell colName='dfTitle'/>
                                </option>
                            </pg:list>
                        </select>
                    </td>
                    <td style="display: none"><pg:cell colName="sortNo"/></td>
                </tr>
            </pg:list>
            </tbody>
        </table>
    </div>
</div>

<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_sys_addJzMain" id="form_sys_addJzMain">
    <div class="form-body">
        <input id="jzId" name="jzId" type="hidden"/>
        <input id="jzStatus" name="jzStatus" type="hidden"/>
        <input id="creatDate" name="creatDate" type="hidden"/>
        <input id="lastModifyDate" name="lastModifyDate" type="hidden"/>
        <input id="mdId" name="mdId" type="hidden"/>
        <input id="outputDir" name="outputDir" type="hidden"/>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-1 control-label">数据名称 </label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" placeholder="" name="jzTitle" autocomplete="off"
                               id="jzTitle">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-1 control-label">备注</label>
                    <div class="col-md-11">
                        <textarea class="form-control" rows="2" name="remark" autocomplete="off"></textarea>
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">&nbsp;
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <button type="button" class="btn green btn-JzMainaddsave">创建</button>
                <button type="reset" class="btn default">重置</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<!-- END FORM-->
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";
    var userid = "<%=AccessControl.getAccessControl().getUserID()%>";
    var miid = ${miid};
    var area_DF_length = 0;
    var indus_DF_length = 0;
    var area_DTable;
    var indus_DTable;
    var AIDATAS = {};
    $("#mdId").val(miid);
    jQuery(document).ready(function () {
        var addJzMain = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/modeljzi/addJzMain.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            PlatformCommonUtils.loading('保存中...');

                        },
                        data: {'str': JSON.stringify(AIDATAS)},
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            PDP.warn(thrownError);
                        },

                        success: function (responseText,
                                           statusText, xhr, $form) {

                            window.setTimeout(function () {
                                PDP.unloading();
                            }, 4000);
                            var msg = responseText;
                            var title = '增加模型数据加总';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加模型数据加总完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    $("#jzId").val(miid);
                                    selectTab();
                                    // refSimulateSelect();
                                    // getYears();
                                });
                            } else {
                                PlatformCommonUtils.warn(msg);
                            }
                        }
                    });
        }
        PDP.validateform({
            form: "#form_sys_addJzMain",
            messages: {
                jzTitle: {
                    required: "请选择输入数据名称！"
                }
            },
            rules: {
                jzTitle: {
                    required: true,
                    remote: {          //远程ajax验证
                        url:  usercontextpath + '/modeljzi/checkJzName.page', //检查是否存在重名
                        type: "GET",
                        dataType: "json",
                        data: {
                            jzTitle: function () {
                                return $("#jzTitle").val(); //要验证的内容
                            }
                        }, dataFilter: function (data) {  //判断控制器返回的内容
                            if( data>0 ){
                                return false;
                            }else{
                                return true;
                            }
                        }
                }
            }},
            submitHandler: addJzMain
        });

        $(".btn-JzMainaddsave", ModelDialog.getCurrentModal()).bind("click", function () {
            var areaDatas = getEditTableData("sample_editable_3_tbody", "A", "0");
            var indusDatas = getEditTableData("sample_editable_4_tbody", "I", "1");
            if(!areaDatas) {
                return;
            }
            if(!indusDatas) {
                return;
            }

            var ms = valiRow();

            if(ms != "") {
                PlatformCommonUtils.warn(ms);
                return;
            }



            AIDATAS.areadatas = areaDatas;
            AIDATAS.inudsdatas = indusDatas;
            $("form", ModelDialog.getCurrentModal()).submit();
        });

    });

    /*    function creatSubmitData() {
            var areaDatas = getEditTableData(area_DTable, getSelectDatas("sample_editable_3"), "0");
            var indusDatas = getEditTableData(indus_DTable, getSelectDatas("sample_editable_4"), "1");
            AIDATAS.areadatas = areaDatas;
            AIDATAS.inudsdatas = indusDatas;
        }*/

    /**
     * 获取Table中的所有select的值，同时验证定义与使用是否一致
     * */
    /*function getSelectDatas(tableID) {
        var selDatas = [];
        var checkMap = {};
        $("#" + tableID + " select").each(function () {
            var _value = $(this).val();
            if (_value == "" || _value == null) {
                PlatformCommonUtils.warn("选项为空，请检查！");
                return;
            } else {
                selDatas.push(_value);
                if (_value != "" && _value != null) checkMap[_value] = _value;
            }
        });
        // TODO
       /!* if (tableID == "sample_editable_3") {
            if (Object.keys(checkMap).length == area_DF_length) {
                return selDatas;
            } else {
                PlatformCommonUtils.warn("[新区域]与[区域分类]未完全匹配，请检查！");
                return;
            }
        } else {
            if (Object.keys(checkMap).length == indus_DF_length) {
                return selDatas;
            } else {
                PlatformCommonUtils.warn("[新分类]与[行业分类]未完全匹配，请检查！");
                return;
            }
        }*!/
    }

    function getTableContent() {
        var nTrs = area_DTable.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
        for (var i = 0; i < nTrs.length; i++) {
            var t = area_DTable.fnGetData(nTrs[i]);
        }
    }*/

    /**
     * 表格数据组装
     * @param vtable
     * @param nlist
     * @param aitype
     * @returns {Array}
     */
    function getEditTableData(vtable,selectType,aitype) {
        var dt = new Date(+new Date() + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '');
        var allDatas = [];
        var seDatas = [];
        var tyDatas = [];
        var table =document.getElementById(vtable);
        var rows = table.rows;

        if(aitype == 0) {
            tyDatas = getTableTypeArr("sample_editable_1_tbody");
        }else {
            tyDatas = getTableTypeArr("sample_editable_2_tbody");
        }

        for(var i = 0; i<rows.length; i++ ){

            var aiBlongNew = $("#dfTitle"+selectType+"_"+i).val();
            var flag = false;
            if(aitype == 0) {
                flag = getTableType("sample_editable_1_tbody",aiBlongNew);
            }else {
                flag = getTableType("sample_editable_2_tbody",aiBlongNew);
            }
            if(flag) {
                debugger;
                var dataBean = {};
                dataBean.mdId = miid;
                dataBean.aiType = aitype;
                dataBean.aiName = rows[i].cells[0].innerHTML;
                dataBean.aiRemark= rows[i].cells[1].innerHTML;
                dataBean.aiBlongBefore = rows[i].cells[2].innerHTML;
                dataBean.sortNo = i+1;//rows[i].cells[3].innerHTML;//TODO
                dataBean.aiBlongNew = aiBlongNew;
                dataBean.createDate = dt;
                dataBean.lastModifyDate = dt;
                dataBean.creater = userid;
                allDatas.push(dataBean);
                seDatas.push(aiBlongNew);
            }else {
                PlatformCommonUtils.warn("未添加分类或"+rows[i].cells[0].innerHTML+"与新分类不匹配！");
                return false;
                break;
            }

        }
        var str = unique(seDatas);
        for(j =0;j<tyDatas.length;j++) {
            k = tyDatas[j];
            if(str.indexOf(k) < 0) {
                PlatformCommonUtils.warn(k+"分类没有使用!");
                return false;
                break;
            }
        }
        return allDatas;
    }


    function unique(arr) {
        var result = [], hash = {};
        for (var i = 0, elem; (elem = arr[i]) != null; i++) {
            if (!hash[elem]) {
                result.push(elem);
                hash[elem] = true;
            }
        }
        return result.join(",");
    }

    function getTableType(vtable,val) {
        var table =document.getElementById(vtable);
        var rows = table.rows;
        var flag = false;

        for(var i = 0; i<rows.length; i++ ){
            var rv0 = rows[i].cells[0].innerHTML;
            if(rv0 != '没有检索到数据' && rows[i].cells[0].innerHTML == val){
                flag = true;
                break
            }
        }
        return flag;
    }
    function getTableTypeArr(vtable) {
        var table =document.getElementById(vtable);
        var rows = table.rows;
        var chs = new Array();

        for(var i = 0; i<rows.length; i++ ){
            var rv0 = rows[i].cells[0].innerHTML;
            if(rv0 != '没有检索到数据'){
                chs.push(rows[i].cells[0].innerHTML)
            }
        }
        return chs;
    }

    jQuery(document).ready(function () {
        TableDatatablesEditable.init("sample_editable_1", usercontextpath + '/modeljzi/updateJzDfA.page');
        TableDatatablesEditable.init("sample_editable_2", usercontextpath + '/modeljzi/updateJzDfA.page');
        CreateSymbTable();
    });
    function refSelOption(e,dfType){
        var selectID=$(e).attr("id");
        var url = usercontextpath + '/modeljzi/refSelect.page';
        $.post(url, {"dfType": dfType, "mdId": miid},
            function (json) {
                $("#" + selectID).empty();
                $("#" + selectID).append('<option value="">--请选择--</option>');
                if (json != null) {
                    for (var i = 0; i < json.length; i++) {
                        var t = json[i].dfTitle;
                        $("#" + selectID).append('<option value="' + json[i].dfTitle + '">' + t + '</option>');
                    }
                }
            });
    }

    function changeAfterOption(start,end) {

        PDP.confirm("确认后面新区域以当前数据填充？", function (isConfirm) {
            if (isConfirm) {
                var val = $("#dfTitleA_"+start).val();
                for(var i = start*1;i < end*1;i++) {
                    $("#dfTitleA_"+i).append('<option value="' + val+ '">' + val + '</option>');
                    $("#dfTitleA_"+i).val(val);
                }
                PDP.success("数据设置成功!");
            }
        });



    }

    function changeIfterOption(start,end) {
        PDP.confirm("确认后面新行业以当前数据填充？", function (isConfirm) {
            if (isConfirm) {
                var val = $("#dfTitleI_"+start).val();

                for(var i = start*1;i < end*1;i++) {
                    $("#dfTitleI_"+i).append('<option value="' + val+ '">' + val + '</option>');
                    $("#dfTitleI_"+i).val(val);
                }
                PDP.success("设置成功!");
            }
        });
    }

    /**
     * 刷新下拉列表数据
     * */
    function refSelect(id, dfType) {
        var url = usercontextpath + '/modeljzi/refSelect.page';
        $.post(url, {"dfType": dfType, "mdId": miid},
            function (json) {
                var sel_id = "";
                if("sample_editable_1" == id) {
                    sel_id="sample_editable_3_tbody"
                }else{
                    sel_id="sample_editable_4_tbody"
                }
                $("#" + sel_id + " select").empty();

                $("#" + sel_id + " select").empty();
                $("#" + sel_id + " select").append('<option value="">--请选择--</option>');
                if (json != null) {
                    if (id == "sample_editable_1") area_DF_length = json.length; else indus_DF_length = json.length;
                    for (var i = 0; i < json.length; i++) {
                        var t = json[i].dfTitle;
                        $("#" + sel_id + " select").append('<option value="' + json[i].dfTitle + '">' + t + '</option>');
                    }
                }
            });
    }

    /**
     * 初始化模板区域、行业表格
     */
    function CreateSymbTable(){
        var url = usercontextpath + '/modeljzi/querySymbJzMain.page';
        $.post(url, {},
            function (symbList) {
                if(symbList!=null && symbList.length>0){
                    var  rowCount = parseInt(symbList.length/4);
                    var cellCount=4;
                    var table2 =  $("table[id='indusSymb']");
                    var table1=  $("table[id='areaSymb']");
                    var htmlsr1="";
                    var htmlsr2="";
                    for (var i = 0; i <= rowCount; i++) {
                        htmlsr1 = htmlsr1+"<tr>";
                        htmlsr2 = htmlsr2+"<tr>";
                        for (var j = 0; j < cellCount; j++) {
                            if(i * 4 + j<symbList.length){
                                htmlsr1 = htmlsr1+"<td style='width: 25%;'><a style=\"text-decoration:none\" href=\"#\" title=\""+symbList[i * 4 + j]["remark"]+"\"><input type=\"radio\" name=\"sample_editable_1_radio\" value=\""+symbList[i * 4 + j]["mdId"]+"\"/>&nbsp;"+symbList[i * 4 + j]["jzTitle"]+"</a></td>";
                                htmlsr2 = htmlsr2+"<td style='width: 25%;'><a style=\"text-decoration:none\" href=\"#\" title=\""+symbList[i * 4 + j]["remark"]+"\"><input type=\"radio\" name=\"sample_editable_2_radio\" value=\""+symbList[i * 4 + j]["mdId"]+"\"/>&nbsp;"+symbList[i * 4 + j]["jzTitle"]+"</a></td>";
                            }else{
                                htmlsr1=htmlsr1+"<td></td>";
                                htmlsr2=htmlsr2+"<td></td>";
                            }
                        }
                        htmlsr1=htmlsr1+"</tr>";
                        htmlsr2=htmlsr2+"</tr>";
                    }
                    table1.append(htmlsr1);

                    table2.append(htmlsr2);
                }else {
                    table1.append("暂无数据……");
                    table2.append("暂无数据……");
                }
            });

    }
    /**
     * 载入参考区域分类
     */
    function loadAreas(){
        var sourMdId = $('#areaSymb input[name="radio1"]:checked ').val();
        // 获取区域分类数据，区域数据String miId,String type
        if(sourMdId!=null&&sourMdId!=""){
            //清空区域数据
            // area_DTable.fnDestroy();//还原初始化了的datatable
            area_DTable.dataTable().fnClearTable();//清空一下table
            $("#sample_editable_1_tbody").html("");
            $("#sample_editable_3_tbody").html("");


            var url = usercontextpath + '/modeljzi/getSymbDatas.page';
            $.post(url, {"sourMdId":sourMdId,"type":'0',"mdId":miid},
                function (json) {
                    var df = json.dfAorI;
                    var ai = json.vAorI;
                    if(df!=null&&df.length>0){
                        var dfStr="";
                        for (var i=0 ; i<df.length ; i++){
                            dfStr="<tr role=\"row\" class=\"odd\"><td class=\"sorting_1\">"+df[i]["dfId"]+"</td><td>"+df[i]["dfTitle"]+"</td><td>"+df[i]["remark"]+"</td><td><a class=\"edit\" href=\"\">编辑</a></td><td><a class=\"delete\" href=\"\">删除</a></td></tr>";
                            $("#sample_editable_1_tbody").append(dfStr);
                        }

                    }
                    if(ai!=null&&ai.length>0){
                        for (var n=0 ; n<ai.length ; n++){
                            var aiStr="<tr><td>"+ai[n]["aiName"]+"</td><td>"+ai[n]["aiBlongBefore"]+"</td><td><select name=\"dfTitle\" id=\"\"><option value=\"\">-请选择-</option>";
                            for (var m=0 ; m<df.length ; m++){
                                if(ai[n]["aiBlongNew"]==df[m]["dfTitle"]){
                                    aiStr=aiStr+"<option value="+df[m]["dfTitle"]+" selected>"+df[m]["dfTitle"]+"</option>";
                                }else{
                                    aiStr=aiStr+"<option value="+df[m]["dfTitle"]+">"+df[m]["dfTitle"]+"</option>";
                                }
                            }
                            aiStr=aiStr+"</select></td></tr>";
                            $("#sample_editable_3_tbody").append(aiStr);
                        }
                    }
                    // area_DTable .draw();
                });

        }
    }

    /**
     * 载入参考行业分类
     */
    function loadIndus(){
        var sourMdId = $('#indusSymb input[name="radio2"]:checked ').val();
        // 获取区域分类数据，区域数据String miId,String type
        if(sourMdId!=null&&sourMdId!=""){
            //清空区域数据
            $("#sample_editable_2_tbody").html("");
            $("#sample_editable_4_tbody").html("");
            var url = usercontextpath + '/modeljzi/getSymbDatas.page';
            $.post(url, {"sourMdId":sourMdId,"type":'1',"mdId":miid},
                function (json) {
                    var df = json.dfAorI;
                    var ai = json.vAorI;
                    if(df!=null&&df.length>0){
                        var dfStr="";
                        for (var i=0 ; i<df.length ; i++){
                            dfStr="<tr role=\"row\" class=\"odd\"><td class=\"sorting_1\">"+df[i]["dfId"]+"</td><td>"+df[i]["dfTitle"]+"</td><td>"+df[i]["remark"]+"</td><td><a class=\"edit\" href=\"\">编辑</a></td><td><a class=\"delete\" href=\"\">删除</a></td></tr>";
                            $("#sample_editable_2_tbody").append(dfStr);
                        }

                    }
                    if(ai!=null&&ai.length>0){
                        for (var n=0 ; n<ai.length ; n++){
                            var aiStr="<tr><td>"+ai[n]["aiName"]+"</td><td>"+ai[n]["aiBlongBefore"]+"</td><td><select name=\"dfTitle\" id=\"\"><option value=\"\">-请选择-</option>";
                            for (var m=0 ; m<df.length ; m++){
                                if(ai[n]["aiBlongNew"]==df[m]["dfTitle"]){
                                    aiStr=aiStr+"<option value="+df[m]["dfTitle"]+" selected>"+df[m]["dfTitle"]+"</option>";
                                }else{
                                    aiStr=aiStr+"<option value="+df[m]["dfTitle"]+">"+df[m]["dfTitle"]+"</option>";
                                }
                            }
                            aiStr=aiStr+"</select></td></tr>";
                            $("#sample_editable_4_tbody").append(aiStr);
                        }
                    }

                });

        }
    }


    function valiRow() {

        var areaNums = document.getElementById("sample_editable_1_tbody").rows.length;
        var indusNums = document.getElementById("sample_editable_2_tbody").rows.length;
        var sum = areaNums + indusNums;
        var role1 =<%=UserUtils.isHasRole("globalmodel")%>;
        var role2 =<%=UserUtils.isHasRole("usersfree")%>;

        if(role1) {
            if(sum > 100) {
                return "区域分类和行业分类数量一共不能超过100个";
            }
        }else if(role2 && sum > 10) {
            return "免费用户区域分类和行业分类数量一共不能超过10个";
        }

        return "";
    }
</script>
