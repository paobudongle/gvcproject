<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 4.7.1
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>数智实验室</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for " name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
          <link href="${pageContext.request.contextPath}/assets/global/css/googleapis.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${pageContext.request.contextPath}/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${pageContext.request.contextPath}/assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="index.html">
                <%--<img src="${pageContext.request.contextPath}/assets/pages/img/logo-big.png" alt="" /> --%>
            </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" action="${pageContext.request.contextPath}/login.page" method="post" target="_self">
            <input type="hidden" id="accesscontrol_check_referpath" name="accesscontrol_check_referpath" value="${successRedirect}"/>
            <input type="hidden" id="qz" name="qz" value=""/>

               <%-- --%>

                <input type="hidden" name="flag" value="yes" />
                          <h3 class="form-title font-green">用户登陆</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span  class="msg"> 请输入用户名和密码 </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="请输入用户名"  name="userName" id="userName"  required /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="请输入密码"  name="password" id="password"  required/> </div>
                  <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">选择风格</label>
                    <select class="form-control form-control-solid placeholder-no-fix" name="theme" style="display: none" >
                    					 <option value="admin_1_darkblue">经典_darkblue</option>
                      		 			  <option value="admin_1_default">经典-默认</option>
                                          <option value="admin_1_light2">经典_light2</option>

                                          <option value="admin_1_grey">经典_grey</option>
                                          <option value="admin_1_light">经典_light</option>
                                          <option value="admin_1_blue">经典_blue</option>

                                          <option value="admin_3_default">简约-默认</option>
                                          <option value="admin_3_light2">简约_light2</option>
                                          <option value="admin_3_darkblue">简约_darkblue</option>
                                          <option value="admin_3_grey">简约_grey</option>
                                          <option value="admin_3_light">简约_light</option>
                                          <option value="admin_3_blue">简约_blue</option>
                     </select> </div>
                 <pg:true actual="${enable_login_validatecode }">
                  <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">验证码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" style="width: 190px;float: left;" type="text" autocomplete="off" placeholder="请输入验证码" name="verifyCode" id="verifyCode"   required/>
                   &nbsp; <img id="verifyCodeImg" src="${pageContext.request.contextPath}/security/generateVerifyCode.freepage" style="width:100px;height: 40px;"/>
                        <a href="javascript:void(0)" onclick="javascript:Login.changeVerifyCode('${pageContext.request.contextPath}/security/generateVerifyCode.freepage');">换一个</a>
                  </div>
                 </pg:true>
                <div class="form-actions">
                    <button type="submit" id="btn_login" class="btn green uppercase">登陆</button>
                    <label class="rememberme check mt-checkbox mt-checkbox-outline">
                        <input type="checkbox" name="remember" value="1" />记住我
                        <span></span>
                    </label>
                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码</a>
                </div>
               <%-- <div class="login-options">
                    <h4>论坛</h4>
                    <ul class="social-icons">
                        <li>
                            <a class="social-icon-color facebook" data-original-title="facebook" href="javascript:;"></a>
                        </li>
                    </ul>
                </div>--%>
                <div class="create-account">
                    <p>
                        <a href="javascript:;" id="register-btn" class="uppercase">免费注册</a>
                    </p>
                </div>
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="index.html" method="post">
                <h3 class="font-green">Forget Password ?</h3>
                <p> Enter your e-mail address below to reset your password. </p>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn green btn-outline">返回</button>
                    <button type="submit" class="btn btn-success uppercase pull-right">提交</button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
            <!-- BEGIN REGISTRATION FORM -->
            <form class="register-form" action="#"  method="post">
                <h3 class="font-green">注册</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span  class="msg"></span>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">英文用户名</label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="请输入英文用户名" name="userName" id="reg_userName"/> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="请输入密码" name="password" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">确认密码</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="请输入确认密码" name="rpassword" /> </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Email</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="请输入邮箱地址" name="email" /> </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">手机号码</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="请输入手机号码" name="userMobiletel1" /> </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">单位信息</label>
                    <textarea class="form-control" name="remark1" rows="3" placeholder="请输入单位信息"></textarea> </div>
                    <div class="form-group">
                        <label class="control-label visible-ie8 visible-ie9">验证码</label>
                        <input class="form-control form-control-solid placeholder-no-fix" style="width: 190px;float: left;" type="text" autocomplete="off" placeholder="请输入验证码" name="rverifyCode" id="rverifyCode"   required/>
                        &nbsp; <img id="rverifyCodeImg" src="${pageContext.request.contextPath}/security/generateVerifyCode.freepage" style="width:100px;height: 40px;"/>
                        <a href="javascript:void(0)" onclick="javascript:Login.changeVerifyCode('${pageContext.request.contextPath}/security/generateVerifyCode.freepage');">换一个</a>
                    </div>
                <div class="form-actions">
                    <button type="button" id="register-back-btn" class="btn green btn-outline">返回</button>
                    <button type="type" id="register-submit-btn" class="btn btn-success uppercase pull-right" >提交</button>
                </div>
            </form>
            <!-- END REGISTRATION FORM
        </div>
        <div class="copyright"> 2014 © Metronic. Admin Dashboard Template. </div>
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
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/pages/scripts/login.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
            <script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>

         <script   type="text/javascript">

             var confirm = function(msg,confirmfun,extendtext,html){
                 if(!html) html = false;
                 if(!extendtext) extendtext = "";
                 swal({
                         title: msg,
                         text: extendtext,
                         type: "info",
                         allowOutsideClick: false,
                         showConfirmButton: true,
                         showCancelButton: true,
                         confirmButtonClass: "btn-info",
                         cancelButtonClass: "btn-default",
                         closeOnConfirm: false,
                         closeOnCancel: true,
                         confirmButtonText: "强制登录",
                         cancelButtonText: "取消",
                         "html":html
                     },
                     confirmfun
                 );
             }

        jQuery(document).ready(function() {
            Login.init('${pageContext.request.contextPath}');
        	App.setAssetsPath('${pageContext.request.contextPath}/assets/'); // init metronic core componets
        	<pg:notempty actual="${errorMessage}">
            var em = '${errorMessage}';
            if(em.indexOf("系统不能同时登录一个账号") != -1) {
                var arr = em.split('^');
                $("#userName").val(arr[0]);
                $("#password").val(arr[1]);
                confirm(arr[2],function(isConfirm){

                    if(isConfirm)
                    {
                        $("#qz").val("1");
                        $("#btn_login").click();
                    }

                });
               // $('.msg','.alert-danger', $('.login-form')).html(arr[2]);
               // $('.alert-danger', $('.login-form')).show();
            }else {
                PDP.warn("${errorMessage}")
            }

				//$('.msg','.alert-danger', $('.login-form')).html('');
				//$('.alert-danger', $('.login-form')).show();




			</pg:notempty>
            var successRedirect = '${successRedirect}';
            if(successRedirect!='' && successRedirect == 0) {
                $("#register-btn").click();
                $("#accesscontrol_check_referpath").val("/");
            }

        });

         </script>
    </body>

</html>
