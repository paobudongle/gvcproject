<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<!--
描述:上传加总文件界面。
作者:LIUWU
版权:北京碧信诚
版本:v1.0
日期:2018-02-22 16:09:19
-->
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger display-hide  alert-addProductexist">
            <button class="close close-addProductexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success display-hide  alert-addProductnotexist">
            <button class="close close-addProductnotexist" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>


<!-- BEGIN FORM-->
<form action="#" class="form-horizontal form_addjz" id="form_addjz" enctype="multipart/form-data">
    <input type="hidden" id="experId" name="experId" value="${experId}"/>

    <div class="form-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >实验名称:</label>
                    <div class="col-md-6">
                        ${experName}
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >操作耗时:</label>
                    <div class="col-md-6">
                        ${costTime}
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >政策计划书</label>
                    <div class="col-md-4">
                       <a onclick="downDoc('0','${planDoc}')">${planDoc}</a>
                    </div>
                    <label class="col-md-2 control-label" >评分</label>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="planSocre" name="planSocre" value="${planSocre}" placeholder="满分40"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-2 control-label" >实验报告</label>
                    <div class="col-md-4">
                        <a onclick="downDoc('1','${reportDoc}')">${reportDoc}</a>
                    </div>
                    <label class="col-md-2 control-label" >评分</label>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="reportSocre" name="reportSocre" value="${reportSocre}" placeholder="满分40"/>
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
            <div class="col-md-offset-5 col-md-6">
                <button type="button" class="btn green btn-JzFilesave">完成评分</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<!-- END FORM-->
<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";
    jQuery(document).ready(function () {
        $(".btn-JzFilesave", ModelDialog.getCurrentModal()).bind("click", function () {
            var experId = $("#experId").val();
            var reportSocre = $("#reportSocre").val();
            var planSocre = $("#planSocre").val();

            if(reportSocre == "") {
                PDP.warn("实验报告不能为空!");
                return;
            }
            if(planSocre == "") {
                PDP.warn("政策计划书评分不能为空!");
                return;
            }

            if(!strToNum(planSocre)) {
                PDP.warn("政策计划书评分,请输入正确数字!");
                return;
            }

            if(!strToNum(reportSocre)) {
                PDP.warn("实验报告评分,请输入正确数字!");
                return;
            }

            PDP.confirm("是否确认评分?", function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: usercontextpath+"/examinationreport/updateScore.page",
                        type: "post",
                        data: {"experId":experId,"reportSocre":reportSocre,"planSocre":planSocre},
                        dataType:"json",
                        success: function(data){
                            if(data == "success") {
                                PDP.success("评分成功!");
                                ModelDialog.getCurrentModal().modal('hide');
                                SysExaminationReportManager.queryExaminationReports(true);
                            }else {
                                PlatformCommonUtils.warn("评分失败!");
                            }

                        }
                    });
                }
            });


        });

    });

    function strToNum(str) {
        var convertNum = Number(str); // 将字符串强制转换为数字
        if (str === "") { // 排除空字符串
            console.log("\"" + str + "\" is an Empty String.");
        } else {
            if (str.includes(" ")) { // 排除空格
                console.log("\"" + str + "\" contains spaces.");
            } else {
                if (isNaN(convertNum)) {
                    return false;
                } else {
                   return true;
                }
            }
        }
    }

    function downDoc(docType,docName) {
        var experId = $("#experId").val();

        window.location = usercontextpath + "/examinationreport/downFile.page?experId="+experId+"&docType="+docType+"&docName="+docName;
    }

</script>
