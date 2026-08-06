<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:编辑考核报告界面。
作者:lijia
版权:bxt
版本:v1.0
日期:2019-10-26 16:43:47
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-adduserexist">
            <button class="close close-adduserexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addusernotexist">
            <button class="close close-addusernotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<pg:beaninfo requestKey="examinationReport">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal form_sys_modifyExaminationReport" id="form_sys_modifyExaminationReport">
        <div class="form-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">实验ID </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="experId" autocomplete="off"
                                   value="<pg:cell colName="experId"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">耗时（分钟） </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="costTime" autocomplete="off"
                                   value="<pg:cell colName="costTime"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">对抗国A </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="countryA" autocomplete="off"
                                   value="<pg:cell colName="countryA"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1"> </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="countryAb" autocomplete="off"
                                   value="<pg:cell colName="countryAb"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">两个对抗国：中国-美国 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="countryB" autocomplete="off"
                                   value="<pg:cell colName="countryB"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1"> </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="endTime" autocomplete="off"
                                   value="<pg:cell colName="endTime"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">实验名称 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="experName" autocomplete="off"
                                   value="<pg:cell colName="experName"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">00:进行中；05：实验完成 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="experState" autocomplete="off"
                                   value="<pg:cell colName="experState"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">所属组ID </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="groupId" autocomplete="off"
                                   value="<pg:cell colName="groupId"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1"> </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="operatSocre" autocomplete="off"
                                   value="<pg:cell colName="operatSocre"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1"> </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="remark" autocomplete="off"
                                   value="<pg:cell colName="remark"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1"> </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="startTime" autocomplete="off"
                                   value="<pg:cell colName="startTime"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">所属队ID </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="teamId" autocomplete="off"
                                   value="<pg:cell colName="teamId"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-3 control-label" for="form_control_1">得分 </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="" name="totalSocre" autocomplete="off"
                                   value="<pg:cell colName="totalSocre"  />">
                            <div class="form-control-focus"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button type="button" class="btn green btn-ExaminationReportmodifysave">保存</button>
                    <button type="reset" class="btn default">重置</button>
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            var usercontextpath = "<%=request.getContextPath()%>";
            var modifyExaminationReport = function () {
                $('#form_sys_modifyExaminationReport', ModelDialog.getCurrentModal())
                    .ajaxSubmit(
                        {
                            type: 'POST',
                            url: usercontextpath + '/jsp/examinationreport/updateExaminationReport.page',
                            forceSync: false,
                            dataType: 'json',
                            beforeSubmit: function () {
                                App.startPageLoading({message: '保存中...'});
                            },
                            error: function (xhr, ajaxOptions,
                                             thrownError) {
                                PlatformCommonUtils.warn(thrownError);
                            },

                            success: function (responseText,
                                               statusText, xhr, $form) {

                                window.setTimeout(function () {
                                    App.stopPageLoading();
                                }, 2000);
                                var msg = responseText;
                                var title = '修改考核报告';
                                var tiptype = "success";
                                if (msg == 'success') {
                                    msg = "修改考核报告完毕"
                                    PDP.success(msg, function () {
                                        ModelDialog.getCurrentModal().modal('hide');
                                        SysExaminationReportManager.queryExaminationReports(false);
                                    });
                                } else {
                                    PDP.warn(msg);
                                }


                            }

                        });
            }
            PDP.validateform({
                form: "#form_sys_modifyExaminationReport",
                messages: {},
                rules: {},
                submitHandler: modifyExaminationReport
            });

            $(".btn-ExaminationReportmodifysave", ModelDialog.getCurrentModal()).bind("click", function () {
                $("#form_sys_modifyExaminationReport", ModelDialog.getCurrentModal()).submit();
            });
        });
    </script>
</pg:beaninfo> 
