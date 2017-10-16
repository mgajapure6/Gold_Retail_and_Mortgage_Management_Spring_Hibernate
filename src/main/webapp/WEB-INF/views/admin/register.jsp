<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
<title><spring:message code="register.Retail_Admin_Register" /></title>
<jsp:include page="../utility/headTag.jsp" />
</head>
<body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/logo-big.png" alt="" /> 
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN REGISTRATION FORM -->
            <form id="admin_registration" class="register-form" action="#" method="post">
                <h3><spring:message code="register.Sign_Up" /></h3>
                <p> <spring:message code="register.Enter_your_personal_details_below" />: </p>
                <div class="form-group" align="center">
	                <a href="#webcamModal" id="product_image_link_0" onclick="webcamLanchBtn(this)" data-toggle="modal">
	                	<img id="adminPicPlace" src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="lock-avatar" style="border: 1px solid gray"> 
	                </a>
	                <div class="modal fade " id="webcamModal" tabindex="-1"role="basic" aria-hidden="true" data-backdrop="static">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Take Picture</h4>
						</div>
						<div class="modal-body">
							<div id="my_camera"></div>
						</div>
						<div class="modal-footer">
								<input type="button" class="btn green" data-dismiss="modal"value="Take Snap"  onClick="take_snapshot(this)"/>
								<button type="button" class="btn dark btn-outline"data-dismiss="modal" onClick="close_camera()">Close</button>
						</div>
                     </div>
                     </div>
                    
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Full_Name" /></label>
                    <div class="input-icon">
                        <i class="fa fa-font"></i>
                        <input class="form-control placeholder-no-fix" type="text" placeholder="<spring:message code="register.Full_Name" />" name="admin_name" /> </div>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Email" /></label>
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                        <input class="form-control placeholder-no-fix" type="text" placeholder="<spring:message code="register.Email" />" name="admin_email" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Address" /></label>
                    <div class="input-icon">
                        <i class="fa fa-check"></i>
                        <input class="form-control placeholder-no-fix" type="text" placeholder="<spring:message code="register.Address" />" name="admin_address" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.City_Town" /></label>
                    <div class="input-icon">
                        <i class="fa fa-location-arrow"></i>
                        <input class="form-control placeholder-no-fix" type="text" placeholder="<spring:message code="register.City_Town" />" name="admin_town" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Country" /></label>
                    <select name="admin_country" id="country_list" class="select2 form-control">
                        <option value="India"><spring:message code="register.India" /></option>
                        
                    </select>
                </div>
                <p> <spring:message code="register.Enter_your_account_details_below" />: </p>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Username" /></label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="<spring:message code="register.Username" />" name="admin_username" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Password" /></label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="<spring:message code="register.Password" />" name="admin_password" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><spring:message code="register.Re-type_Your_Password" /></label>
                    <div class="controls">
                        <div class="input-icon">
                            <i class="fa fa-check"></i>
                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="<spring:message code="register.Re-type_Your_Password" />" name="rpassword" /> </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="mt-checkbox mt-checkbox-outline">
                        <input type="checkbox" name="tnc" /><spring:message code="register.I_agree_to_the" /> 
                        <a href="javascript:;"><spring:message code="register.Terms_of_Service" /> </a> &
                        <a href="javascript:;"><spring:message code="register.Privacy_Policy" /> </a>
                        <span></span>
                    </label>
                    <div id="register_tnc_error"> </div>
                </div>
                <div class="form-actions">
                    <button id="register-back-btn" type="reset" class="btn grey-salsa btn-outline"><spring:message code="register.Cancel" />  </button>
                    <button type="submit" id="register-submit-btn" class="btn green pull-right"><spring:message code="register.Sign_Up" />  </button>
                </div>
            </form>
            <!-- END REGISTRATION FORM -->
        </div>
<jsp:include page="../utility/footerScript.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/webcam.js"></script>
<script type="text/javascript">
var FormValidation=function(){
	var r=function(){
		var e=$("#admin_registration"),
		r=$(".alert-danger",e),
		i=$(".alert-success",e);
		e.show();
		e.validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			rules:{
				admin_name:{minlength:2,required:!0},
				admin_email:{required:!0,email:!0},
				admin_address:{required:!0,minlength:2},
				admin_town:{required:!0,minlength:2},
				admin_country:{required:!0},
				admin_username:{required:!0,minlength:2},
				admin_password:{required:!0,minlength:2},
				rpassword:{equalTo:"#register_password"},
				tnc:{required:!0}
			},
			messages:{
				tnc:{required:"Please accept TNC first."}
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
				
				"tnc"==r.attr("name")?e.insertAfter($("#register_tnc_error")):1===r.closest(".input-icon").size()?e.insertAfter(r.closest(".input-icon")):e.insertAfter(r)
				
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

function webcamLanchBtn(data){
	Webcam.set({
		width: 470,
		height: 420,
		image_format: 'jpeg',
		jpeg_quality: 90
	});
	Webcam.attach( '#my_camera' );
}
function take_snapshot() {
	Webcam.snap( function(data_uri) {
		$("#adminPicPlace").attr("src",data_uri);
		
		Webcam.upload( data_uri, '${pageContext.request.contextPath}/admin/addWebcamAdminImage', function(code, text) {
            if(code===200){
            	swal({
					  title: "<spring:message code="register.Success" />",
					  text: "<spring:message code="register.Image_Added_successfully" />",
					  type: "success",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "Ok, Fine"
					});
            	Webcam.reset();
            }else{
            	swal({
					  title: "<spring:message code="register.Oops_Failed" />",
					  text: "<spring:message code="register.Image_Not_Added" />",
					  type: "warning",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "<spring:message code="register.Try_Again" />"
					});
            	Webcam.reset();
            }
        } );
	} );
	
}


function close_camera() {
	Webcam.reset();
}
</script>

</body>
</html>
