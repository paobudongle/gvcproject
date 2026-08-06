<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>贸易政策经济影响虚拟仿真实验教学项目</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8"/>
    <%@ include file="../index/front_head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no"/><link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/demo.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/experiment.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/sucainiu-demo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/tabs-vertical.css"/>


    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/fSelect/css/fSelect.css">
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-tabdrop/css/tabdrop.css">--%>
</script>
</script>

    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>



    <style>
        .table th, .table td {text-align: center;vertical-align: middle!important;}
        .note-popover{display: none}
        .portlet.light.bordered > .portlet-title {
            border-bottom: 0px solid #eef1f5;
        }
        .portlet.light .portlet-body {
            padding-top: 0px;
        }
        .table-scrollable{
            margin:0 !important;
        }
    </style>

</head>
<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main">

<div class="news_list_met_21_4 met-index-body met-index-imgnews bgcolor" m-id='4' style="padding-top: 20px;">
    <div class="container" style="padding-top: 15px;">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <form role="form" class="form-queryQuestion form-inline">
                        <input type="hidden" id="desc" name="pager.desc"/>
                        <input type="hidden" id="myQuestion" name="myQuestion"/>
                        <input type="hidden" id="myAnswer" name="myAnswer"/>

                        <div class="form-group">
                            <input type="text" class="form-control" id="qTitle" name="qTitle" autocomplete="off" placeholder="标题" style="height: 30px;line-height: 30px;border-radius: 4px;font-size: 12px;">
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="timeOrg" onchange="handerChange()" style="height: 30px;border-radius: 4px;font-size: 12px;padding: 2px 15px;padding-right: 30px;">
                                <option value="false">时间正序</option>
                                <option value="true">时间倒序</option>
                            </select>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="c_myQuestion" onclick="queryCommon('myQuestion')"> 我的提问
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="c_myAnswer" onclick="queryCommon('myAnswer')"> 我的回复
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary" style="height: 30px;line-height: 12px;border-radius: 4px;font-size: 12px;">查询</button>
                    </form>
                </div>
            </div>
        </div>


<%--                <div class="form-body">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-md-12">--%>
<%--                            <div class="form-group form-md-line-input">--%>
<%--                                <div class="col-md-2">--%>
<%--                                    <div class="input-group">--%>
<%--                                        <span class="input-group-btn btn-left">--%>
<%--                                            <button type="button" class="btn btn-success" aria-expanded="false" onclick="queryTime(false)">时间正序</button>--%>
<%--                                            <button type="button" class="btn btn-success" aria-expanded="false" onclick="queryTime(true)">时间倒序</button>--%>
<%--                                        </span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="col-md-2">--%>
<%--                                    <div class="input-icon right">--%>
<%--                                        <input type="text" class="form-control  input-xs" placeholder="标题" id="qTitle" name="qTitle">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="col-md-6">--%>
<%--                                    <div class="input-group">--%>
<%--                                        <span class="input-group-btn btn-left">--%>
<%--                                            <button type="button" class="btn btn-success btn-queryQuestion" aria-expanded="false">查询</button>--%>
<%--                                        </span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="col-md-2">--%>
<%--                                    <div class="mt-checkbox-inline">--%>
<%--                                        <label class="mt-checkbox">--%>
<%--                                            <input type="checkbox" id="c_myQuestion" onclick="queryCommon('myQuestion')"  > 我的提问--%>
<%--                                            <span></span>--%>
<%--                                        </label>--%>
<%--                                        <label class="mt-checkbox">--%>
<%--                                            <input type="checkbox" id="c_myAnswer" onclick="queryCommon('myAnswer')" > 我的回复--%>
<%--                                            <span></span>--%>
<%--                                        </label>--%>

<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </form>--%>

        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered" style="padding: 10px 20px;">
                    <div class="portlet-title tabbable-line">
                        <div class="caption">
                            <i class="icon-pin font-yellow-crusta"></i> <span class="caption-subject bold font-yellow-crusta uppercase">问答列表 </span>
                        </div>
                        <div class="actions">
                            <a class="btn btn-xs blue btn-addQuestion"><i class="fa fa-edit"></i> 发表新帖 </a>
                        </div>
                    </div>
                    <div class="portlet-body portlet-Questionlist"></div>
                </div>
            </div>
        </div>


    </div>
</div>
</div><!-- site-page-main -->
<%@ include file="../index/foot.jsp" %>

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
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

<script type="text/javascript">
    var SysQuestionManager = function(){
        var usercontextpath = "<%=request.getContextPath()%>";
        var queryQuestions = function(doquery){
            var qTitle=$("#qTitle").val();
            if(  PDP.containSpecial(qTitle)){
                PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
                return;
            }
            $(".portlet-Questionlist").load(usercontextpath+"/question/queryListInfoQuestions.page",
                doquery?$('.form-queryQuestion').serialize():{},
                function(){
                });
        }
        return {
            queryQuestions:function(doquery){
                queryQuestions(doquery);
            },
            usercontextpath:function(){
                return usercontextpath;
            }
        }
    }();

    $(document).ready(function() {
        var usercontextpath = SysQuestionManager.usercontextpath();
        SysQuestionManager.queryQuestions(false);
        $(".form-queryQuestion .btn-queryQuestion").bind('click',function(){
            SysQuestionManager.queryQuestions(true);
        });
        $(".btn-addQuestion").bind('click',function(){
            ModelDialog.dialog({
                title:"发表新帖",
                showfooter:false,
                url:usercontextpath+"/question/toAddQuestion.page",
                width:"1024px",
                height:"568px"

            });
        });

    });
    function handerChange() {
        var timeOrg = $("#timeOrg").val()
        queryTime(timeOrg)
    }
    //$()
    function queryTime(sort) {
        $("#desc").val(sort);
        SysQuestionManager.queryQuestions(true);
    }

    function queryCommon(id) {
        if($('#c_'+id).is(':checked')) {
            $('#'+id).val('1');
        }else {
            $('#'+id).val('');
        }
        SysQuestionManager.queryQuestions(true);
    }


</script>
</div><!-- site-page-wrap -->
</body>
</html>