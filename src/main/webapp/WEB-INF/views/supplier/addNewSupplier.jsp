<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="addNewSupplier.Add_New_Supplier" /></title>
        <jsp:include page="../utility/headTag.jsp" />
</head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-md ">
        <!-- BEGIN HEADER -->
         <jsp:include page="../utility/header.jsp" />
        <!-- END HEADER -->
      
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
             <jsp:include page="../utility/sideMenu.jsp" />
            <!-- END SIDEBAR -->
            
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <h1 class="page-title"><spring:message code="addNewSupplier.New_Supplier" /> 
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="addNewSupplier.Home" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span><spring:message code="addNewSupplier.Add_new_supplier" /> </span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   <div class="row">
                        <div class="col-md-12">
                        
                            <div class="portlet light " id="form_wizard_1">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=" icon-layers font-red"></i>
                                        <span class="caption-subject font-red bold uppercase"><spring:message code="addNewSupplier.add_New_Supplier" />  -
                                            <span class="step-title"> <spring:message code="addNewSupplier.Step_1_of_3" />  </span>
                                        </span>
                                    </div>
                                    <div class="actions">
                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                            <i class="icon-cloud-upload"></i>
                                        </a>
                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                            <i class="icon-wrench"></i>
                                        </a>
                                        <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                            <i class="icon-trash"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <form class="form-horizontal" id="submit_form" action="${pageContext.request.contextPath}/supplier/addNewSupplier" method="post"  enctype="multipart/form-data">
                                        <div class="form-wizard">
                                            <div class="form-body">
                                                <ul class="nav nav-pills nav-justified steps">
                                                    <li>
                                                        <a href="#tab1" data-toggle="tab" class="step">
                                                            <span class="number"> 1 </span>
                                                            <span class="desc">
                                                                <i class="fa fa-check"></i> <spring:message code="addNewSupplier.Supplier_Information" />  </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab2" data-toggle="tab" class="step">
                                                            <span class="number"> 2 </span>
                                                            <span class="desc">
                                                                <i class="fa fa-check"></i> <spring:message code="addNewSupplier.Profile_Image" />  </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab3" data-toggle="tab" class="step active">
                                                            <span class="number"> 3 </span>
                                                            <span class="desc">
                                                                <i class="fa fa-check"></i><spring:message code="addNewSupplier.Confirm" />  </span>
                                                        </a>
                                                    </li>
                                                   
                                                </ul>
                                                <div id="bar" class="progress progress-striped" role="progressbar">
                                                    <div class="progress-bar progress-bar-success"> </div>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="alert alert-danger display-none">
                                                        <button class="close" data-dismiss="alert"></button> <spring:message code="addNewSupplier.You_have_some_form_errors_Please_check_below" /> . </div>
                                                    <div class="alert alert-success display-none">
                                                        <button class="close" data-dismiss="alert"></button> <spring:message code="addNewSupplier.Your_form_inputs_are_successful" /> ! </div>
                                                    
                                                    <div class="tab-pane" id="tab1">
                                                        <h3 class="block"><spring:message code="addNewSupplier.Enter_Supplier_information" /> .</h3>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Full_name" /> 
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_name" />
                                                                <span class="help-block"><spring:message code="addNewSupplier.Provide_Full_name" />   </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Gender" /> 
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <div class="radio-list">
                                                                    <label>
                                                                        <input type="radio" name="supplier_gender" value="<spring:message code="addNewSupplier.Male" />" data-title="Male" /> <spring:message code="addNewSupplier.Male" />  </label>
                                                                    <label>
                                                                        <input type="radio" name="supplier_gender" value="<spring:message code="addNewSupplier.Female" />" data-title="Female" /> <spring:message code="addNewSupplier.Female" />  </label>
                                                                </div>
                                                                <div id="form_gender_error"> </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Email" /> 
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_email" />
                                                                <span class="help-block"> <spring:message code="addNewSupplier.Provide_Email" />  </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Mobile_Number" /> 
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_mobile" />
                                                                <span class="help-block"> <spring:message code="addNewSupplier.Provide_Mobile_Number" /></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Company_Store_name" />
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_company_name" />
                                                                <span class="help-block"> <spring:message code="addNewSupplier.Provide_Company_or_Store_name" /></span>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.full_address" />
                                                                <span class="required"> * </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_full_address" />
                                                                <span class="help-block"><spring:message code="addNewSupplier.Provide_Full_Address" />  </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Licence_Number" />
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="supplier_licence_number" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="tab-pane active" id="tab2">
                                                        <h3 class="block"><spring:message code="addNewSupplier.Provide_Supplier_profile_image" /></h3>
                                                        <div class="form-group ">
			                                                <label class="control-label col-md-3"><spring:message code="addNewSupplier.Image_Upload" /></label>
			                                                <div class="col-md-9">
			                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
			                                                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"> 
			                                                        	<img id="profilePicPlace" src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" alt="" />
			                                                        </div>
			                                                        <div>
			                                                            <span class="btn red btn-outline btn-file">
			                                                                <span class="fileinput-new"> <spring:message code="addNewSupplier.Select_image" /> </span>
			                                                                <span class="fileinput-exists"> <spring:message code="addNewSupplier.Change" /> </span>
			                                                                <input type="file" name="supplier_image"> </span>
			                                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> <spring:message code="addNewSupplier.Remove" /> </a>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                              <a href="#webcamModal" class="btn green webcamLanchBtn" data-toggle="modal" style="margin-left: 220px; width: 300px"> <spring:message code="addNewSupplier.Take_Picture" />Take a Picture</a>
				                                           <div class="modal fade container" id="webcamModal" tabindex="-1"role="basic" aria-hidden="true" data-backdrop="static">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
																	<h4 class="modal-title"><spring:message code="addNewSupplier.Take_Picture" /></h4>
																</div>
																<div class="modal-body">
																	<div id="my_camera"></div>
																</div>
																<div class="modal-footer">
																		<input type="button" class="btn green" data-dismiss="modal"value="<spring:message code="addNewSupplier.Take_Picture" />"  onClick="take_snapshot()"/>
																		<button type="button" class="btn dark btn-outline"data-dismiss="modal" onClick="close_camera()"><spring:message code="addNewSupplier.Close" /></button>
																</div>
															</div>
                                                    </div>
                                                    
                                                    <div class="tab-pane" id="tab3">
                                                        <h3 class="block"><spring:message code="addNewSupplier.Confirm_supplier_information" /></h3>
                                                        <h4 class="form-section"><spring:message code="addNewSupplier.Personal_information" /></h4>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Full_name" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_name"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Gender" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_gender"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Email" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_email"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Mobile_Number" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_mobile"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Company_Store_name" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_company_name"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Full_Address" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_full_address"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><spring:message code="addNewSupplier.Licence_number" /> :</label>
                                                            <div class="col-md-4">
                                                                <p class="form-control-static" data-display="supplier_licence_number"> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <a href="javascript:;" class="btn default button-previous">
                                                            <i class="fa fa-angle-left"></i><spring:message code="addNewSupplier.Back" />  </a>
                                                        <a href="javascript:;" class="btn btn-outline green button-next"><spring:message code="addNewSupplier.Continue" /> 
                                                            <i class="fa fa-angle-right"></i>
                                                        </a>
                                                        <a href="javascript:;" class="btn green button-submit"><spring:message code="addNewSupplier.Submit" /> 
                                                            <i class="fa fa-check"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    
                    
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
            <jsp:include page="../utility/footer.jsp" />
        <!-- END FOOTER -->
            <!-- BEGIN QUICK NAV -->
            <!-- END QUICK NAV -->
           </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/webcam.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/myScript/supplier-form-wizard.js" type="text/javascript"></script>
<script type="text/javascript">
//submit save customer  form with ajax request without any plugin
$(document).ready(function() {

	$("#form_wizard_1 .button-submit").click(function(){
		sendForm();
	}).hide();
	
	function sendForm(){
		var formdata = new FormData($('#submit_form')[0])
		 $.ajax({
				method : "post",
				dataType : "json",
				data : formdata,
				async : false,
				success : function(data) {
					if(data==="success"){
						swal({
							  title: "<spring:message code="addNewSupplier.Success" />",
							  text: "<spring:message code="addNewSupplier.Supplier_information_saved_successfully" />.",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok, Fine",
							  closeOnConfirm: false
							},
							function(){
								window.location.href = window.location.href;
							});
					}else if(data==="avilable"){
						swal("<spring:message code="addNewSupplier.Oops_Failed" />","<spring:message code="addNewSupplier.Supplier_is_already_available" />", "warning");
						
					}
					else{
						swal("<spring:message code="addNewSupplier.Oops_Failed" />","<spring:message code="addNewSupplier.error" />","error" );
					}
				},
				cache : false,
				contentType : false,
				processData : false,
				error : function() {
					swal("<spring:message code="addNewSupplier.Oops_Failed" />","<spring:message code="addNewSupplier.Unable_To_Save_Supplier_information" />", "error");
				}
			});
	};


});
</script>
<script type="text/javascript">
$(".webcamLanchBtn").click(function(){
	Webcam.set({
		width: 580,
		height: 420,
		image_format: 'jpeg',
		jpeg_quality: 90
	});
	Webcam.attach( '#my_camera' );
});

</script>
<script language="JavaScript">
		function take_snapshot() {
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				// display results in page
				$("#profilePicPlace").attr("src",data_uri);
	
				
				Webcam.upload( data_uri, '${pageContext.request.contextPath}/supplier/webcamImageData', function(code, text) {
		            if(code===200){
		            	swal({
							  title: "<spring:message code="addNewSupplier.Success" />",
							  text: "<spring:message code="addNewSupplier.Image_Added_successfully" />",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok, Fine"
							});
		            	Webcam.reset();
		            }else{
		            	swal({
							  title: "<spring:message code="addNewSupplier.Oops_Failed"/>",
							  text: "<spring:message code="addNewSupplier.Image_Not_Added_Try_again" />",
							  type: "warning",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "<spring:message code="addNewSupplier.Try_again" />"
							});
		            	Webcam.reset();
		            }
		        } );
				
			} );
			
		}
		
</script>
<script language="JavaScript">
		function close_camera() {
			Webcam.reset();
		}
</script>

</body>
</html>