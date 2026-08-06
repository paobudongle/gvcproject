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
    <div class="col-md-6">
        <label>区域分类</label>
        <!--id="sample_editable_1"-->
        <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
            <thead>
            <tr>
                <th> 序号 </th>
                <th> 区域</th>
                <th> Edit </th>
                <th> Delete </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td> 1 </td>
                <td> Alex Nilson </td>
                <td>
                    <a class="edit" href="javascript:;"> Edit </a>
                </td>
                <td>
                    <a class="delete" href="javascript:;"> Delete </a>
                </td>
            </tr>
            <tr>
                <td> 2 </td>
                <td> Lisa Wong </td>
                <td>
                    <a class="edit" href="javascript:;"> Edit </a>
                </td>
                <td>
                    <a class="delete" href="javascript:;"> Delete </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <label>行业分类</label>
        <table class="table table-striped table-hover table-bordered" id="editable_1">
            <thead>
            <tr>
                <th> 序号 </th>
                <th> 行业 </th>
                <th> Edit </th>
                <th> Delete </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td> 1 </td>
                <td> Alex Nilson </td>
                <td>
                    <a class="edit" href="javascript:;"> Edit </a>
                </td>
                <td>
                    <a class="delete" href="javascript:;"> Delete </a>
                </td>
            </tr>
            <tr>
                <td> 2 </td>
                <td> Lisa Wong </td>
                <td>
                    <a class="edit" href="javascript:;"> Edit </a>
                </td>
                <td>
                    <a class="delete" href="javascript:;"> Delete </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>


<!-- 国别、行业数据区域-->
<div class="row">
    <div class="col-md-6">
        <label>区域数据</label>
        <!--id="sample_editable_1"-->
        <table class="table table-striped table-hover table-bordered" id="area_editable">
            <thead>
            <tr>
                <th> 国家 </th>
                <th> 原区域</th>
                <th> 新区域</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td> aut </td>
                <td> EU28</td>
                <td> aut </td>
            </tr>
            <tr>
                <td> bel </td>
                <td> EU28</td>
                <td> EU28 </td>
            </tr>
            <tr>
                <td>
                    <select name="order_status" class="form-control form-filter input-sm">
                        <option value="">Select...</option>
                    </select>
                </td>
                <td>
                    <select name="order_status" class="form-control form-filter input-sm">
                        <option value="">Select...</option>
                    </select>
                </td>
                <td>
                    <select name="order_status" class="form-control form-filter input-sm">
                        <option value="">Select...</option>
                    </select>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <label>行业数据</label>
        <table class="table table-striped table-hover table-bordered" id="indus_editable">
            <thead>
            <tr>
                <th> 行业 </th>
                <th> 原分类</th>
                <th> 新分类</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td> pdr paddy rice </td>
                <td> food</td>
                <td> food </td>
            </tr>
            <tr>
                <td> rmk raw milk  </td>
                <td> food</td>
                <td> food </td>
            </tr>
            <tr>
                <td> frs forestry </td>
                <td> mnfc</td>
                <td> mnfc </td>
            </tr>
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
                    <label class="col-md-1 control-label" for="form_control_1">数据名称 </label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" placeholder="" name="jzTitle" autocomplete="off">
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-1 control-label" for="form_control_1">备注</label>
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
    jQuery(document).ready(function () {
        var usercontextpath = "<%=request.getContextPath()%>";
        var addJzMain = function () {
            $('form', ModelDialog.getCurrentModal())
                .ajaxSubmit(
                    {
                        type: 'POST',
                        url: usercontextpath + '/jsp/modeljz/addJzMain.page',
                        forceSync: false,
                        dataType: 'json',
                        beforeSubmit: function () {
                            App.startPageLoading({message: '保存中...'});
                        },
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
            messages: {},
            rules: {},
            submitHandler: addJzMain
        });

        $(".btn-JzMainaddsave", ModelDialog.getCurrentModal()).bind("click", function () {

            $("form", ModelDialog.getCurrentModal()).submit();


        });

    });
</script>
