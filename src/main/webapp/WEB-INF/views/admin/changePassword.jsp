<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title>Admin Change Password</title>
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
                <div class="lock-head"> Change Password </div>
                <div class="lock-body">
                    <div class="pull-left lock-avatar-block">
                        <img src="${pageContext.request.contextPath}/resources/assets/pages/media/profile/photo3.jpg" class="lock-avatar"> </div>
                    <form id="changePasswordForm"class="lock-form pull-left" action="${pageContext.request.contextPath}/admin/changePassword" method="post">
                        <h4>${name }</h4>
                         <div class="form-group">
                            <input type="hidden" name="admin_id" value="${sessionScope.admin_id }" /> </div>
                        <div class="form-group">
                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Old password" name="old_password" /> </div>
                        <div class="form-group">
                            <input class="form-control placeholder-no-fix" type="password" id="new_password" autocomplete="off" placeholder="New password" name="new_password" /> </div>
                        <div class="form-group">
                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Re-type new password" name="rpassword" /> </div>
                        <div class="form-actions">
                            <button type="submit" class="btn red uppercase">Change Password</button>
                        </div>
                    </form>
                </div>
                <div class="lock-bottom">
                <p style="color: red;">${msg }</p>
                    <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                </div>
            </div>
            <div class="page-footer-custom"> 2017 &copy; by MGGSoft Solution. </div>
        </div>
        <jsp:include page="../utility/footerScript.jsp" />
<script type="text/javascript">
var FormValidation=function(){
	var r=function(){
		var e=$("#changePasswordForm"),
		r=$(".alert-danger",e),
		i=$(".alert-success",e);
		e.show();
		e.validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			rules:{
				old_password:{minlength:2,required:!0},
				new_password:{required:!0,minlength:2},
				rpassword:{equalTo:"#new_password"}
			},
			
			invalidHandler:function(e,t){
				i.hide(),
				r.show(),
				App.scrollTo(r,-200)
			},
			errorPlacement:function(e,r){
				var i=$(r).parent(".input-icon").children("i");
				i.removeClass("fa-check").addClass("fa-warning"),
				i.attr("data-original-title",e.text()).tooltip({container:"body"})
				
				1===r.closest(".input-icon").size()?e.insertAfter(r.closest(".input-icon")):e.insertAfter(r)
				
			},
			highlight:function(e){
				$(e).closest(".form-group").removeClass("has-success").addClass("has-error")
			},
			unhighlight:function(e){},
			success:function(e,r){
				var i=$(r).parent(".input-icon").children("i");
				$(r).closest(".form-group").removeClass("has-error").addClass("has-success"),
				i.removeClass("fa-warning").addClass("fa-check")
			},
			submitHandler:function(e){
				i.show(),
				r.hide(),
				e[0].submit()
			}
		})
	};
	
	return{init:function(){
		r()
	}}
}();

jQuery(document).ready(function(){
	FormValidation.init()
});
</script>

</body>
</html>