<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="lockScreen.Admin_Lock_Screen" /></title>
        <jsp:include page="../utility/headTag.jsp" />
</head>
    <!-- END HEAD -->

    <body class="">
        <div class="page-lock">
            <div class="page-logo">
                <a class="brand" href="index-2.html">
                    <img src="${pageContext.request.contextPath}/resources/assets/pages/img/logo-big.png" alt="logo" /> </a>
            </div>
            <div class="page-body">
                <div class="lock-head"> <spring:message code="lockScreen.Locked" /> </div>
                <div class="lock-body">
                    <div class="pull-left lock-avatar-block">
                        <img src="${pageContext.request.contextPath}/adminImage/${sessionScope.image}" class="lock-avatar"> </div>
                    <form class="lock-form pull-left" action="${pageContext.request.contextPath}/admin/lock" method="post">
                        <h4>${name }</h4>
                        <div class="form-group">
                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="<spring:message code="lockScreen.Password" />" name="admin_password" /> </div>
                        <div class="form-actions">
                            <button type="submit" class="btn red uppercase"><spring:message code="lockScreen.Login" /></button>
                        </div>
                    </form>
                </div>
                <div class="lock-bottom">
                <p style="color: red;">${msg }</p>
                    <a href="${pageContext.request.contextPath}/admin/logout"><spring:message code="lockScreen.Not" /> ${name }?</a>
                </div>
            </div>
            <div class="page-footer-custom"> 2017 &copy; by MGGSoft Solution. </div>
        </div>
        <jsp:include page="../utility/footerScript.jsp" />
</body>
</html>