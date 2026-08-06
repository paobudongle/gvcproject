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
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon"
          type="image/x-icon"/>
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/show.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/xajd/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/bootstrap.min.css"/>


    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/fSelect/css/fSelect.css">

    <link href="${pageContext.request.contextPath}/jsp/index/css/foundation-datepicker.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/jsp/index/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/index/js/show.js"></script>
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
<%@ include file="../index/title.jsp" %>
<div class="subcolumn_nav_met_16_1 border-bottom1" m-id='8' m-type='nocontent'>
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
                                                        <div class="input-icon right">
                                                            <input type="text" class="form-control  input-xs" id="startTime" placeholder="开始时间" name="startTime">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="input-icon right">
                                                            <input type="text" class="form-control  input-xs" id="endTime" placeholder="结束时间" name="endTime">
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
																<%--<button type="reset" class="btn btn-xs default btn-updateFile"--%>
                                                                        <%--aria-expanded="false" >上传</button>--%>

                                                                  <button type="reset" class="btn btn-xs default btn-del"
                                                                          aria-expanded="false">删除</button>

                                                                <%--<c:if test="${isTeacher}">--%>
                                                                    <%--<button type="reset" class="btn btn-xs default btn-score"--%>
                                                                            <%--aria-expanded="false">评分</button>--%>
                                                                <%--</c:if>--%>

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

<%@ include file="../index/foot.jsp" %>

<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/pager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/foundation-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/foundation-datepicker.zh-CN.js"></script>


<script type="text/javascript">
    var SysExaminationReportManager = function(){
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryExaminationReports = function(doquery){
            var endTime=$("#endTime").val();
            var startTime=$("#startTime").val();
            if(  PDP.containSpecial(endTime)  || PDP.containSpecial(startTime)){
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-ExaminationReportlist").load(usercontextpath+"/examinationreport/queryListInfoExaminationReports.page",
                doquery?$('.form-queryExaminationReport').serialize():{},
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

    $(document).ready(function() {
        var menuId = '${menu_id}'
        $("#menu_"+menuId).addClass("active");
        var usercontextpath = SysExaminationReportManager.usercontextpath();

        SysExaminationReportManager.queryExaminationReports(false);

        $(".form-queryExaminationReport .btn-queryExaminationReport").bind('click',function(){
            SysExaminationReportManager.queryExaminationReports(true);
        });

        $(".btn-updateFile").bind('click',function(){
            var experId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");
            var experName =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experName");


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

        $(".btn-del").bind('click',function(){
            var experId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");

            PDP.confirm("确定要删除选中的实验记录吗?",function(isConfirm){
                if(isConfirm)
                {
                    $.post(usercontextpath+"/examinationreport/deleteBatchExaminationReport.page",
                        $.param( {
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

        $(".btn-score").bind('click',function(){
            var experId =  $('.portlet-ExaminationReportlist input[name="experId"]:checked').attr("experId");
            if(typeof experId == "undefined"){
                PDP.warn("请选择需要评分的实验记录!");
                return;
            }else{

                $.post(usercontextpath+"/examinationreport/isCanScore.page",
                    $.param( {
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


        $('#startTime,#endTime').fdatepicker({
            format: 'yyyy-mm-dd'
        });



    });



</script>

</body>

</html>