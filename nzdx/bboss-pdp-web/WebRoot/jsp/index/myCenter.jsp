<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>在线模拟</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no"/>
    <%@ include file="front_head.jsp" %>
    <meta name="description" content="平台服务主要包括提供量化经济分析平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持"/>
    <meta name="keywords" content="量化经济分析平台"/>
    <meta name="generator" content="量化经济分析平台" data-variable=""/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/simulate/css/demo.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/product.css"/>

    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/><style>
        .dropdown-toggle::after {
            margin-top: -3px;
        }
        .dropdown-toggle:after {
            margin-right: 0;
            margin-left: .3em;
        }
        .dropdown-toggle::after {
            display: inline-block;
            width: 0;
            height: 0;
            margin-left: .286rem;
            content: '';
            vertical-align: middle;
            border-top: .286rem solid;
            border-right: .286rem solid transparent;
            border-left: .286rem solid transparent;
        }
        *, ::after, ::before {
            -webkit-box-sizing: inherit;
            -moz-box-sizing: inherit;
            box-sizing: inherit;
        }

        .mt-element-step .step-thin .active {
            background-color: #438adc !important;
        }
        .mt-element-step .step-thin .mt-step-title {
             font-size: 24px;
             font-weight: 500;
             padding-left:35%;

        }

        .table th, .table td {text-align: center;vertical-align: middle!important;}
        .help-block{
            color: #e73d4a;
        }
		#menu_8{
			padding: 10px 15px;
			background: #438adc;
			border-radius: 3px;
		}
    </style>




</head>
<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main">

<div class="news_list_met_21_4 met-index-body met-index-imgnews bgcolor" m-id='4' style="padding: 0px 0 0 0;">
    <div class="container" style="padding-top: 50px;">
        <div class="hall" id="hall_1" <c:if test="${type != 1}">style="display: none"</c:if>>
            <div class="row">
                <div class=" col-md-12">
                    <div class="mt-element-step" style="cursor:pointer">
                        <div class="row step-thin">
                            <div class="col-md-4 bg-grey mt-step-col  active" onclick="showMsg('1')" >
                                <div class="mt-step-title uppercase font-grey-cascade" >消息提醒</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col" onclick="showMsg('2')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >订阅信息</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col" onclick="showMsg('3')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >账号设置</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class=" col-md-12" style="padding-top: 10px;padding-left: 25px;padding-right: 25px;">
                    <div class="row">
                        <div class="portlet light portlet-fit bordered">
                            <div class="portlet-title">
                                <div class="actions">
                                    <div>
                                        <button type="button" class="btn blue" onclick="readAllMessge()">已读</button>&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <table class="table table-bordered table-hover" >
                                        <thead>
                                        <tr >
                                            <th  width="5%">序号 </th>
                                            <th  width="60%"> 内容</th>
                                            <th  width="20%"> 时间</th>
                                            <th  width="10%"> 操作 </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${notifications}" var="bean" varStatus="status">
                                            <tr id="tr_${bean.notificationId}" <c:if test="${bean.readState == '0'}">style="font-weight:bold;"</c:if> >
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <a data-target="#stack1" data-toggle="modal" onclick="showContent('${bean.notificationTitle}','${bean.notificationContent}','${bean.notificationId}')" >${bean.notificationContent}</a>

                                                </td>
                                                <td>${bean.notificationTime}</td>
                                                <td>
                                                    <span  class="label label-sm label-danger" style="cursor:pointer"; onclick="delMessge('${bean.notificationId}')"> 删除 </span>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hall" id="hall_2" <c:if test="${type != 2}">style="display: none"</c:if>  >
            <div class="row">
                <div class=" col-md-12">
                    <div class="mt-element-step" style="cursor:pointer">
                        <div class="row step-thin">
                            <div class="col-md-4 bg-grey mt-step-col " onclick="showMsg('1')" >
                                <div class="mt-step-title uppercase font-grey-cascade" >消息提醒</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col active"  onclick="showMsg('2')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >订阅信息</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col" onclick="showMsg('3')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >账号设置</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class=" col-md-12" style="padding-top: 10px;padding-left: 25px;padding-right: 25px;">
                    <div class="row">
                        <div class="portlet light portlet-fit bordered">
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <table class="table table-bordered table-hover" >
                                        <thead>
                                        <tr >
                                            <th  width="5%">序号 </th>
                                            <th  width="40%">订阅内容</th>
                                            <th  width="10%">订阅日期</th>
                                            <th  width="10%">到期日期</th>
                                            <th  width="10%">剩余天数</th>
                                            <th  width="10%"> 操作 </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${subscriptions}" var="bean" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${bean.orderName}</td>
                                                <td>${bean.validStartTime}</td>
                                                <td>${bean.validEndTime}</td>
                                                <td>${bean.periodDay}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/product/toProductsIndex.page" style="text-decoration:none">
                                                    <span  class="label label-sm label-danger" style="cursor:pointer";  > 续期 </span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hall" id="hall_3" <c:if test="${type != 3}">style="display: none"</c:if> >
            <div class="row">
                <div class=" col-md-12">
                    <div class="mt-element-step" style="cursor:pointer">
                        <div class="row step-thin">
                            <div class="col-md-4 bg-grey mt-step-col  " onclick="showMsg('1')" >
                                <div class="mt-step-title uppercase font-grey-cascade" >消息提醒</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col" onclick="showMsg('2')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >订阅信息</div>
                            </div>
                            <div class="col-md-4 bg-grey mt-step-col active"  onclick="showMsg('3')">
                                <div class="mt-step-title uppercase font-grey-cascade"  >账号设置</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
               <div class=" col-md-12" style="padding-top: 10px;padding-left: 25px;padding-right: 25px;">
                   <div class="portlet-body form">
                       <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-red-sunglo">
                                   <i class="icon-settings font-red-sunglo"></i>
                                   <span class="caption-subject bold uppercase">账号信息</span>
                               </div>
                           </div>
                           <div class="portlet-body form">
                               <form role="form" id="form_sys_addNotification">
                                   <div class="form-body">
                                       <div class="form-group">
                                           <label>邮箱地址</label>
                                           <div class="input-group">
                                               <input type="text" id="userEmail" name="userEmail" class="form-control" placeholder="邮箱地址" value="${userEmail}">
                                           </div>
                                       </div>
                                       <div class="form-group">
                                           <label>手机号码</label>
                                           <input class="form-control spinner" type="text" id="userMobiletel1" name="userMobiletel1" placeholder="手机号码" value="${userMobiletel}"/>
                                       </div>
                                       <div class="form-group">
                                           <label for="oldPassword">旧密码</label>
                                           <div class="input-group">
                                               <input type="password" class="form-control" id="oldPassword"  name="oldPassword" placeholder="密码为空，只修改邮箱和手机号码">
                                               <span class="input-group-addon">
                                                            <i class="fa fa-user font-red"></i>
                                                        </span>
                                           </div>
                                       </div>
                                       <div class="form-group">
                                           <label for="newPassword">新密码</label>
                                           <div class="input-group">
                                               <input type="password" class="form-control" id="newPassword" id="newPassword" name="newPassword" placeholder="新密码">
                                               <span class="input-group-addon">
                                                            <i class="fa fa-user font-red"></i>
                                                        </span>
                                           </div>
                                       </div>
                                       <div class="form-group">
                                           <label for="newPasswordSecond">确认密码</label>
                                           <div class="input-group">
                                               <input type="password" class="form-control" id="newPasswordSecond" id="newPasswordSecond" name="newPasswordSecond" placeholder="确认密码">
                                               <span class="input-group-addon">
                                                            <i class="fa fa-user font-red"></i>
                                                        </span>
                                           </div>
                                       </div>

                                   </div>
                                   <div class="form-actions" style="padding-left: 40%;padding-right: 35%">
                                       <button type="button" class="btn blue" onclick="mySubmit()">提交</button>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="stack1" class="modal fade" tabindex="-1" data-backdrop="static" >
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">详细信息</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-3">
                <h4 style="font-weight:bold;">标题:</h4>
            </div>
            <div class="col-md-9">
                <input class="form-control" type="text" readonly name="bt" id="bt">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <h4 style="font-weight:bold;">内容:</h4>
            </div>
            <div class="col-md-9">
                <textarea rows="6" cols="52" id="nr" readonly></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn btn-outline dark" id="div_close">关闭</button>
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
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
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
<script>
    var usercontextpath = "<%=request.getContextPath()%>";

    function delMessge(notificationId) {
        PDP.confirm("确定要删除选中的通知公告吗?",function(isConfirm){
            if(isConfirm)
            {

                $.post(usercontextpath+"/notifcation/delNotificationByUserId.page",
                    $.param( {
                        "notificationId" : notificationId
                    },true),
                    function(responseText){
                        if(responseText=="success"){
                          $("#tr_"+notificationId).remove();
                            PDP.success("删除成功!");
                        }else{
                            PDP.warn("删除失败!");
                        }
                    });
            }
        });

    }

    function readAllMessge() {
        PDP.confirm("未读消息设置已读?",function(isConfirm){
            if(isConfirm)
            {

                $.post(usercontextpath+"/notifcation/readAllMessge.page",
                    $.param( {
                    },true),
                    function(responseText){
                        if(responseText=="success"){
                            window.location.reload();
                            PDP.success("设置成功!");
                        }else{
                            PDP.warn("设置失败!");
                        }
                    });
            }
        });

    }

    var updateUser = function (type) {

        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var newPasswordSecond = $("#newPasswordSecond").val();
        var userEmail = $("#userEmail").val();
        var userMobiletel1 = $("#userMobiletel1").val();

        $.post(usercontextpath+"/notifcation/updateUser.page",
            $.param( {
                "oldPassword":oldPassword,
                 "newPassword":newPassword,
                 "newPasswordSecond":newPasswordSecond,
                "userEmail":userEmail,"userMobiletel1":userMobiletel1,
                "type":type
            },true),
            function(responseText){
                if(responseText=="success"){

                    PDP.success("设置成功!");
                    setTimeout(function () {
                        window.location.reload();
                    },3000)


                }else{
                    PDP.warn(responseText);
                }
            });

    }

    jQuery(document).ready(function () {

        PDP.validateform({
            inmodal:false,
            form: "#form_sys_addNotification",
            messages: {
                userEmail : {
                    required : "请输入邮箱",
                    email:"请输入合法的邮箱地址"
                },
                userMobiletel1 : {
                    required : "请输入手机号码",
                    number:"请输入正确的手机号"
                }
            },
            rules: {
                userEmail : {
                    required : true,
                    email: true
                },
                userMobiletel1 : {
                    required : true,
                    number : true
                }

            },
            submitHandler: function(){ verifyPassword()}
        });
    });


    var verifyPassword = function () {

        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var newPasswordSecond = $("#newPasswordSecond").val();

        if(oldPassword == "") {
            updateUser('0');
        }else {

            if(newPassword != newPasswordSecond) {
                PDP.warn("两次密码不一致!");
                return;
            }

            if(newPassword == "") {
                PDP.warn("请输入6位以上口令!");
                return;
            }
            updateUser('1');
        }
    }

    function mySubmit() {
        $("form").submit();
    }

    function showMsg(id) {
        $(".hall").hide();
        $("#hall_"+id).show();
    }


    function showContent(t,c,i) {
        $("#bt").val(t);
        $("#nr").val(c);
        $.post(usercontextpath+"/notifcation/setReadMessge.page", {notificationId:i});
    }
</script>
</div><!-- site-page-wrap -->
</body>
</html>