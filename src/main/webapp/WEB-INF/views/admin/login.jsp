<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="login.Retail_Admin_Login" /></title>
        <jsp:include page="../utility/headTag.jsp" />
</head>
    <!-- END HEAD -->

    <body class=" login">
        <!-- BEGIN : LOGIN PAGE 5-1 -->
        <div class="user-login-5">
            <div class="row bs-reset">
                 <div class="col-md-6 bs-reset mt-login-5-bsfix">
                    <div style="background-image: url(${pageContext.request.contextPath}/resources/assets/pages/img/login/bg1.jpg);background-position: center;background-size: cover;background-repeat: no-repeat;min-height: 100vh">
                        <img class="login-logo" src="${pageContext.request.contextPath}/resources/assets/pages/img/login/logo.png" /> </div>
                </div>
                <div class="col-md-6 login-container bs-reset mt-login-5-bsfix" style="background-color: #ffffff;">
                    <div class="login-content">
                        <h1><spring:message code="login.Admin_Login" /></h1>
                        <p> <spring:message code="login.login_title" /> 
                        <p style="color:red;">${msg}</p>
                        <form action="${pageContext.request.contextPath}/admin/login" class="login-form" method="post" id="loginForm">
                      
                             <div class="alert alert-danger display-hide" id="output">
                                <button class="close" data-close="alert"></button>
                                <span><spring:message code="login.Invalid_username_and_password" /></span>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <input class="form-control form-control-solid placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="<spring:message code="login.username" />" name="admin_username" required/> </div>
                                <div class="col-xs-6">
                                    <input class="form-control form-control-solid placeholder-no-fix form-group" type="password" autocomplete="off" placeholder="<spring:message code="login.password" />" name="admin_password" required/> </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="rem-password">
                                        <label class="rememberme mt-checkbox mt-checkbox-outline">
                                            <input type="checkbox" name="remember" value="1" /> <spring:message code="login.Remember_me" />
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8 text-right">
                                    <div class="forgot-password">
                                        <a href="javascript:;" id="forget-password" class="forget-password"><spring:message code="login.Forgot_Password" /> ?</a>
                                    </div>
                                    <button class="btn green" type="submit"><spring:message code="login.Sign_In" /></button>
                                </div>
                            </div>
                        </form>
                        <!-- BEGIN FORGOT PASSWORD FORM -->
                        <form class="forget-form" action="javascript:;" method="post">
                            <h3 class="font-green"><spring:message code="login.Forgot_Password" /> ?</h3>
                            <p> <spring:message code="login.Enter_email" />. </p>
                            <div class="form-group">
                                <input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="<spring:message code="login.Email" />" name="email" /> </div>
                            <div class="form-actions">
                                <button type="button" id="back-btn" class="btn green btn-outline"><spring:message code="login.Back" /></button>
                                <button type="submit" class="btn btn-success uppercase pull-right"><spring:message code="login.Submit" /></button>
                            </div>
                        </form>
                        <!-- END FORGOT PASSWORD FORM -->
                    </div>
                    <div class="login-footer">
                        <div class="row bs-reset">
                            <div class="col-xs-5 bs-reset">
                                <ul class="login-social">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-dribbble"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-7 bs-reset">
                                <div class="login-copyright text-right">
                                    <p> 2016 &copy; by MGSoft Solution</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../utility/footerScript.jsp" />
</body>
</html>