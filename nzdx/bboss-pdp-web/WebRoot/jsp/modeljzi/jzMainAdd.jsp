<%@ page import="org.frameworkset.platform.security.AccessControl" %>
<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<script src="../../assets/pages/scripts/table-datatables-editable.js" type="text/javascript"></script>
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


<!-- 国别、行业分类定义区域-->

<div class="row">
    <div class="portlet-body">
        <div class="col-md-6">
            <div class="table-toolbar">
                <div class="row">
                    <div class="col-md-12">
                        <div class="btn-group">
                            <button id="sample_editable_1_new" class="btn green"> 添加区域分类
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
                    <td style="display: none">ID</td>
                    <th> 区域</th>
                    <th> 备注</th>
                    <th> 编辑</th>
                    <th> 删除</th>
                </tr>
                </thead>
                <tbody>
                <pg:list requestKey="areaList">
                    <tr>
                        <td style="display: none"><pg:cell colName="dfId"/></td>
                        <td><pg:cell colName="dfTitle"/></td>
                        <td><pg:cell colName="remark"/></td>
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
                    <td style="display: none">ID</td>
                    <th> 行业</th>
                    <th> 备注</th>
                    <th> 编辑</th>
                    <th> 删除</th>
                </tr>
                </thead>
                <tbody>
                <pg:list requestKey="indusList">
                    <tr>
                        <td style="display: none"><pg:cell colName="dfId"/></td>
                        <td><pg:cell colName="dfTitle"/></td>
                        <td><pg:cell colName="remark"/></td>
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
        <span class="label label-primary">区域数据</span>
        <!--id="sample_editable_1"-->
        <table class="table table-striped table-hover table-bordered" id="sample_editable_3">
            <thead>
            <tr>
                <td style="display: none">dicId</td>
                <th> 国家</th>
                <th> 原区域</th>
                <th> 新区域</th>
            </tr>
            </thead>
            <tbody>
            <pg:list requestKey="aList">
                <tr>
                    <td style="display: none"><pg:cell colName="dicId"/></td>
                    <td><pg:cell colName="dicTitle"/></td>
                    <td><pg:cell colName="belongs"/></td>
                    <td>
                        <select id="select_sample_editable_1" name="select_sample_editable_1" style="width:90px;">
                            <option value="">--请选择--</option>
                            <pg:list requestKey="areaList">
                                <option value="<pg:cell colName="dfTitle"/>"><pg:cell colName="dfTitle"/></option>
                            </pg:list>
                        </select>
                    </td>
                </tr>
            </pg:list>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <span class="label label-primary">行业数据</span>
        <table class="table table-striped table-hover table-bordered" id="sample_editable_4">
            <thead>
            <tr>
                <td style="display: none">dicId</td>
                <th> 行业</th>
                <th> 原分类</th>
                <th> 新分类</th>
            </tr>
            </thead>
            <tbody>
            <pg:list requestKey="iList">
                <tr>
                    <td style="display: none"><pg:cell colName="dicId"/></td>
                    <td><pg:cell colName="dicTitle"/></td>
                    <td><pg:cell colName="belongs"/></td>
                    <td>
                        <select id="select_sample_editable_2" name="select_sample_editable_2" style="width:90px;">
                            <option value="">--请选择--</option>
                            <pg:list requestKey="indusList">
                                <option value="<pg:cell colName="dfTitle"/>"><pg:cell colName="dfTitle"/></option>
                            </pg:list>

                        </select>
                    </td>
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
            <div class="col-md-offset-3 col-md-9">
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
    var area_DF_length=0;
    var indus_DF_length=0;
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
                        url: usercontextpath + '/modeljz/addJzMain.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {

                            App.startPageLoading({message: '保存中...'});
                        },
                        data: {'str': JSON.stringify(AIDATAS)},
                        error: function (xhr, ajaxOptions,
                                         thrownError) {
                            PDP.warn(thrownError);
                        },

                        success: function (responseText,
                                           statusText, xhr, $form) {

                            window.setTimeout(function () {
                                App.stopPageLoading();
                            }, 2000);
                            var msg = responseText;
                            var title = '增加模型数据加总';
                            var tiptype = "success";
                            if (msg == 'success') {
                                msg = "增加模型数据加总完毕"
                                PDP.success(msg, function () {
                                    ModelDialog.getCurrentModal().modal('hide');
                                    SysJzMainManager.queryJzMains(false);
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
                jzTitle:{
                    required: "请选择输入数据名称！"
                }},
            rules: {
                jzTitle:{
                    required: true
                }},
            submitHandler: addJzMain
        });

        $(".btn-JzMainaddsave", ModelDialog.getCurrentModal()).bind("click", function () {
            var areaDatas = getEditTableData(area_DTable, getSelectDatas("sample_editable_3"), "0");
            var indusDatas = getEditTableData(indus_DTable, getSelectDatas("sample_editable_4"), "1");
            AIDATAS.areadatas = areaDatas;
            AIDATAS.inudsdatas = indusDatas;
            $("form", ModelDialog.getCurrentModal()).submit();
        });

    });

    function creatSubmitData(){
        var areaDatas = getEditTableData(area_DTable, getSelectDatas("sample_editable_3"), "0");
        var indusDatas = getEditTableData(indus_DTable, getSelectDatas("sample_editable_4"), "1");
        AIDATAS.areadatas = areaDatas;
        AIDATAS.inudsdatas = indusDatas;
    }
    /**
     * 获取Table中的所有select的值，同时验证定义与使用是否一致
     * */
    function getSelectDatas(tableID) {
        var selDatas = [];
        var checkMap={};
        $("#" + tableID + " select").each(function () {
            var _value = $(this).val();
            if(_value==""||_value==null){
                PlatformCommonUtils.warn("选项为空，请检查！");
                return;
            }else{
                selDatas.push(_value);
                if(_value!=""&&_value!=null)checkMap[_value]=_value;
            }
        });
        if(tableID=="sample_editable_3"){
            if(Object.keys(checkMap).length==area_DF_length){
                return selDatas;
            }else{
                PlatformCommonUtils.warn("[新区域]与[区域分类]未完全匹配，请检查！");
                return;
            }
        }else{
            if(Object.keys(checkMap).length==indus_DF_length){
                return selDatas;
            }else{
                PlatformCommonUtils.warn("[新分类]与[行业分类]未完全匹配，请检查！");
                return;
            }
        }
    }

    function getTableContent() {
        var nTrs = area_DTable.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
        for (var i = 0; i < nTrs.length; i++) {
            var t = area_DTable.fnGetData(nTrs[i]);
        }
    }

    /**
     * 表格数据组装
     * @param vtable
     * @param nlist
     * @param aitype
     * @returns {Array}
     */
    function getEditTableData(vtable, nlist, aitype) {
        var dt = new Date(+new Date() + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '');
        var allDatas = [];
        var nTrs = vtable.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
        for (var i = 0; i < nTrs.length; i++) {
            var dataBean = {};
            var t = vtable.fnGetData(nTrs[i]);
            dataBean.mdId = miid;
            dataBean.aiType = aitype;
            dataBean.aiName = t[1];
            dataBean.aiBlongBefore = t[2];
            dataBean.aiBlongNew = nlist[i];
            dataBean.createDate = dt;
            dataBean.lastModifyDate = dt;
            dataBean.creater = userid;
            allDatas.push(dataBean);
        }
        return allDatas;
    }

    jQuery(document).ready(function () {
        TableDatatablesEditable.init("sample_editable_1", usercontextpath + '/modeljz/updateJzDfA.page');
        TableDatatablesEditable.init("sample_editable_2", usercontextpath + '/modeljz/updateJzDfA.page');
        area_DTable = TableDatatablesEditable.init("sample_editable_3", "");
        indus_DTable = TableDatatablesEditable.init("sample_editable_4", "");
    });

    function refSelect2(id, dfType) {
        var url = usercontextpath + '/modeljz/refSelect.page';
        $.post(url, {"dfType": dfType,"mdId":miid},
            function (json) {
                if (json != null) {
                    if(id=="sample_editable_1")area_DF_length = json.length;else indus_DF_length=json.length;
                    var sel_id = 'select_'+ id;
                    var optlength = $("select[name='"+sel_id+"']")[0].length;
                    for (var i = optlength-1; i < json.length; i++) {
                        var t = json[i].dfTitle;
                        $("select[name='"+sel_id+"']").append('<option value="' + json[i].dfTitle + '">' + t + '</option>');
                    }
                }
            });
    }

    function refSelect(id, dfType) {
        var url = usercontextpath + '/modeljz/refSelect.page';
        $.post(url, {"dfType": dfType,"mdId":miid},
            function (json) {
                var sel_id = 'select_'+ id;
                $("select[name='"+sel_id+"']").empty();
                $("select[name='"+sel_id+"']").append('<option value="">--请选择--</option>');
                if (json != null) {
                    if(id=="sample_editable_1")area_DF_length = json.length;else indus_DF_length=json.length;
                    for (var i = 0; i < json.length; i++) {
                        var t = json[i].dfTitle;
                        $("select[name='"+sel_id+"']").append('<option value="' + json[i].dfTitle + '">' + t + '</option>');
                    }
                }
            });
    }
</script>
