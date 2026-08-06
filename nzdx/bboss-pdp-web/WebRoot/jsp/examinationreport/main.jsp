<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no"/>
    <%@ include file="../index/front_head.jsp" %>

    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 本页内容区样式，不影响公共页头页脚 */
        .site-page-main {
            background-color: #ffffff;
        }
        .site-page-main .portlet.light.bordered {
            border: 1px solid #e7ecf1;
            background: #fff;
        }
        .site-page-main .portlet.light .portlet-body {
            padding-top: 8px;
        }
        .site-page-main .btn.green-haze {
            color: #fff;
            background-color: #44b6ae;
            border-color: #44b6ae;
        }
        .site-page-main .btn.green-haze:hover,
        .site-page-main .btn.green-haze:focus {
            color: #fff;
            background-color: #3a9a94;
            border-color: #378c86;
        }
        .site-page-main .table th,
        .site-page-main .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        .report-date-group .form-control {
            background: #fff;
            cursor: pointer;
        }
    </style>
</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。
</div>
<![endif]-->
<body>
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main subcolumn_nav_met_16_1 border-bottom1" m-id='8' m-type='nocontent'>
    <div class="container">
        <div class="row">
            <div class=" col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet light bordered">
                            <div class="portlet-body form">
                                <form role="form" class="form-horizontal form-queryExaminationReport">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group form-md-line-input">
                                                    <div class="col-md-6">
                                                        <div class="report-date-group">
                                                            <input type="text" class="form-control input-xs date-picker" id="startTime" placeholder="开始时间" name="startTime" autocomplete="off" readonly="readonly">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="report-date-group">
                                                            <input type="text" class="form-control input-xs date-picker" id="endTime" placeholder="结束时间" name="endTime" autocomplete="off" readonly="readonly">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group form-md-line-input">
                                                    <div class="col-md-12">
                                                        <div class="input-group">
															<span class="input-group-btn btn-left">
																<button type="button"
                                                                        class="btn btn-xs green-haze btn-queryExaminationReport "
                                                                        aria-expanded="false">查询</button>

                                                                  <button type="reset" class="btn btn-xs default btn-del"
                                                                          aria-expanded="false">删除</button>

															</span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet light bordered">
                            <div class="portlet-body portlet-ExaminationReportlist"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div><!-- site-page-main -->
<%@ include file="../index/foot.jsp" %>

<script defer src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/scripts/pager.js" type="text/javascript"></script>
<script defer src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script defer type="text/javascript">
    var SysExaminationReportManager = function(){
        var usercontextpath = "<%=request.getContextPath()%>";
        var datePattern = /^\d{4}-\d{2}-\d{2}$/;
        var buildQueryParams = function(){
            var endTime = jQuery.trim(jQuery("#endTime").val());
            var startTime = jQuery.trim(jQuery("#startTime").val());

            if(PDP.containSpecial(endTime) || PDP.containSpecial(startTime)){
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return false;
            }
            if(startTime && !datePattern.test(startTime)){
                PDP.warn('开始时间格式应为 yyyy-MM-dd');
                return false;
            }
            if(endTime && !datePattern.test(endTime)){
                PDP.warn('结束时间格式应为 yyyy-MM-dd');
                return false;
            }
            if(startTime && endTime && startTime > endTime){
                PDP.warn('开始时间不能晚于结束时间');
                return false;
            }

            return {
                startTime: startTime ? startTime + " 00:00:00" : "",
                endTime: endTime ? endTime + " 23:59:59" : ""
            };
        };
        var queryExaminationReports = function(doquery){
            var params = doquery ? buildQueryParams() : {};
            if(doquery && params === false){
                return;
            }
            jQuery(".portlet-ExaminationReportlist").load(usercontextpath+"/examinationreport/queryListInfoExaminationReports.page",
                params,
                function(){
                });
        }
        return {
            queryExaminationReports:function(doquery){
                queryExaminationReports(doquery);
            },
            usercontextpath:function(){
                return usercontextpath;
            }
        }
    }();

    function bindNativeDateRange(inputSelector, peerSelector, limitPeer) {
        var $input = jQuery(inputSelector);
        var $peer = jQuery(peerSelector);
        $input.on('change', function () {
            var value = jQuery(this).val();
            if (limitPeer === 'start') {
                $peer.attr('min', value || '');
            } else {
                $peer.attr('max', value || '');
            }
        });
    }

    function bindJqueryUiDatePicker(inputSelector, peerSelector, limitPeer) {
        var $input = jQuery(inputSelector);
        var $peer = jQuery(peerSelector);
        $input.datepicker({
            dateFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            beforeShow: function(input, inst) {
                setTimeout(function () {
                    inst.dpDiv.css({
                        top: (jQuery(input).offset().top + jQuery(input).outerHeight() + 2) + 'px',
                        left: jQuery(input).offset().left + 'px'
                    });
                }, 0);
            },
            onSelect: function(value) {
                if (limitPeer === 'start') {
                    $peer.datepicker('option', 'minDate', value || null);
                } else {
                    $peer.datepicker('option', 'maxDate', value || null);
                }
            }
        }).on('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            jQuery(this).datepicker('show');
        });
    }

    (function bootExaminationReportPage() {
        if (typeof jQuery === 'undefined' || typeof PDP === 'undefined' || typeof jQuery.ui === 'undefined') {
            setTimeout(bootExaminationReportPage, 30);
            return;
        }
        jQuery(function() {
            var menuId = '${menu_id}';
            jQuery("#menu_" + menuId).addClass("active");
            var usercontextpath = SysExaminationReportManager.usercontextpath();

            bindNativeDateRange('#startTime', '#endTime', 'start');
            bindNativeDateRange('#endTime', '#startTime', 'end');
            bindJqueryUiDatePicker('#startTime', '#endTime', 'start');
            bindJqueryUiDatePicker('#endTime', '#startTime', 'end');

            SysExaminationReportManager.queryExaminationReports(false);

            jQuery(".form-queryExaminationReport .btn-queryExaminationReport").bind('click',function(){
                SysExaminationReportManager.queryExaminationReports(true);
            });

            jQuery(".btn-updateFile").bind('click',function(){
                var experId =  jQuery('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");
                var experName =  jQuery('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experName");

                if(typeof experId == "undefined"){
                    PDP.warn("请选择需要上传的实验记录!");
                    return;
                }
                ModelDialog.dialog({
                    title:"上传",
                    showfooter:false,
                    url:usercontextpath+"/examinationreport/toUploadFile.page",
                    params:{"experId":experId,"experName":experName},
                    width: "600px",
                    height: "360px"
                });
            });

            jQuery(".btn-del").bind('click',function(){
                var experId =  jQuery('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");

                PDP.confirm("确定要删除选中的实验记录吗?",function(isConfirm){
                    if(isConfirm)
                    {
                        jQuery.post(usercontextpath+"/examinationreport/deleteBatchExaminationReport.page",
                            jQuery.param({
                                "experId" : experId
                            },true),
                            function(responseText){
                                if(responseText=="success"){
                                    PDP.success("删除成功!");
                                    SysExaminationReportManager.queryExaminationReports(true);
                                }else{
                                    PDP.warn("删除失败:"+responseText);
                                }
                            });
                    }
                });
            });

            jQuery(".btn-score").bind('click',function(){
                var experId =  jQuery('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");
                if(typeof experId == "undefined"){
                    PDP.warn("请选择需要评分的实验记录!");
                    return;
                }else{
                    jQuery.post(usercontextpath+"/examinationreport/isCanScore.page",
                        jQuery.param({
                            "experId" : experId
                        },true),
                        function(responseText){
                            if(responseText=="true"){
                                ModelDialog.dialog({
                                    title:"评分",
                                    showfooter:false,
                                    url:usercontextpath+"/examinationreport/toScore.page",
                                    params:{"experId":experId},
                                    width: "600px",
                                    height: "360px"
                                });
                            }else{
                                PDP.warn("计划书或者报告未上传！");
                            }
                        });
                }
            });
        });
    })();
</script>

</div><!-- site-page-wrap -->

</body>

</html>
