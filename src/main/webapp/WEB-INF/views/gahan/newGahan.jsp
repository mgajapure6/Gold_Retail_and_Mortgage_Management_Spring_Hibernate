<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="newGahan.New_Gahan" /> </title>
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
                    <h1 class="page-title"> <spring:message code="newGahan.New_Gahan_From" /> ${customer.getCustomer_name()}
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span> <spring:message code="newGahan.New_Gahan_From" /> ${customer.getCustomer_name()}</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   
                 <div class="portlet box red ">
			         <div class="portlet-title">
			             <div class="caption">
                           <i class="icon-settings"></i>
                           <span class="caption-subject bold uppercase"><spring:message code="newGahan.Add_Gahan_products" /></span>
                       	</div>
			        </div>
		          	<div class="portlet-body" id="panelBody"> 
		          	
		          		<table class=" table table-striped  table-hover table-light"  id="gahanProductTable">
		          		<tr>
		          			<th><spring:message code="newGahan.Product_name" /></th>
		          			<th><spring:message code="newGahan.Product_weight" /></th>
		          			<th><spring:message code="newGahan.Product_net_weight" /></th>
		          			<th><spring:message code="newGahan.Product_Image" /></th>
		          			<th><spring:message code="newGahan.Add_Delete" /></th>
		          		</tr>
		          		<tr id="clonable_tr_0">
		          			<td>
		          				 <select name="product_list" id="product_name_0" class="product_list form-control input-sm pn">
								   <option></option>
								   <c:forEach var="product" items="${allProductsList}" varStatus="i" > 
										<option textue="${product.getProduct_name()}">${product.getProduct_name() }</option>
									</c:forEach>
								 </select>
		          			</td>
		          			<td>
                                 <input type="text" id="product_weight_0" class="form-control input-sm pw">
		          			</td>
		          			<td>
		          				   <input type="text" id="product_net_weight_0" class="form-control input-sm pnw">
		          			</td>
		          			<td>
		          				   <a href="#webcamModal" id="product_image_link_0" onclick="webcamLanchBtn(this)" data-toggle="modal">
                                		<img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-circle" alt=""  style="width: 100px; height: 100px"id="product_image_src_0" />
				         			</a>
				         			
				         			<div class="modal fade " id="webcamModal" tabindex="-1"role="basic" aria-hidden="true" data-backdrop="static">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title"><spring:message code="newGahan.Take_Picture" /></h4>
										</div>
										<div class="modal-body">
											<div id="my_camera"></div>
										</div>
										<div class="modal-footer">
												<input type="button" class="btn green" data-dismiss="modal"value="Take Snap"  onClick="take_snapshot(this)"/>
												<button type="button" class="btn dark btn-outline"data-dismiss="modal" onClick="close_camera()"><spring:message code="newGahan.Close" /></button>
										</div>
                                	</div>
		          			</td>
		          			<td>
		          				<input type="button" value="Add" class="btn red btn-sm" id="addBtn_0" onclick="addNewProduct(this)">
		          			</td>
		          		</tr>
		          		</table>
		          		<hr>
		          	 	<div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
	                                <label class="control-label col-md-5"><spring:message code="newGahan.Select_gahan_date" />:</label>
	                                <div class="col-md-7">
	                                      <input  id="select_gahan_date" placeholder="<spring:message code="newGahan.Select_gahan_date" />" class="form-control input-sm form-control-inline date-picker select_date gahan_date gd" type="text" 
	                                     	data-date-autoclose ="true" data-date-today-btn ="linked" data-date-today-highlight ="true"  data-date-format="dd-mm-yyyy">
	                                </div>
                            	</div>
                      		 </div>
                       		 <div class="col-md-6">
                            	<div class="form-group">
                                    <label class="control-label col-md-5"><spring:message code="newGahan.Total_Net_Weight" />:</label>
                                    <div class="col-md-7">
                                      	<input type="text" id="total_net_weight" class="form-control input-sm wm" disabled="disabled">
                                 	</div>
                            	</div>
                        	</div>
                   		</div>
	                   	<br>
	                   	<div class="row">
	                       <div class="col-md-6">
	                                <div class="form-group">
                                    <label class="control-label col-md-5"><spring:message code="newGahan.Withdrawal_money" />:</label>
                                    <div class="col-md-7">
                                      	<input type="text" id="withdrawal_money" class="form-control input-sm wm">
                                 	</div>
                            	</div>
	                       </div>
	                        <div class="col-md-6">
	                       			<div class="form-group">
		                                <label class="control-label col-md-5"><spring:message code="newGahan.Month_period" />:</label>
		                                <div class="col-md-7">
		                                      <input type="text" id="month_period" class="form-control input-sm mp">
		                                </div>
		                            </div>
	                        </div>
	                   	</div>
	                   	<br>
                   	<div class="row">
                       <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-5"><spring:message code="newGahan.Interest_rate" />:</label>
                                    <div class="col-md-7">
                                      	<input type="text" id="interest_rate" class="form-control input-sm ir" oninput="getInterest(this)">
                                 </div>
                            </div>
                       </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-5"><spring:message code="newGahan.Interest_amount" />:</label>
                                <div class="col-md-7">
                                      <input type="text" id="interest_amount" class="form-control input-sm ia" disabled="disabled">
                                </div>
                            </div>
                        </div>
                   	</div>
                   	<br>
                   	<div class="row">
                       <div class="col-md-6">
                                 <div class="form-group">
                                    <label class="control-label col-md-5"><spring:message code="newGahan.Total_amount_with_interest" />:</label>
                                    <div class="col-md-7">
                                      	<input type="text" id="total_amount_with_interest" class="form-control input-sm tawi" disabled="disabled">
                                 </div>
                            </div>
                       </div>
                        <div class="col-md-6">
                        	  <div class="form-group">
                                    <label class="control-label col-md-5"></label>
                                    <div class="col-md-7">
                                      	<a class="btn green btn-sm" onclick="saveGahanData()"> <spring:message code="newGahan.save_gahan" /></a>
                                 </div>
                            </div>
                        </div>
                   	</div>
		    	</div>
		    	<div class="portlet-footer">
		     	</div>
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
           </div>
           
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/webcam.js"></script>
<script type="text/javascript">
var imageIdGlobal=null;
var productNameGlobal=null;
function webcamLanchBtn(data){
	imageIdGlobal=null;
	productNameGlobal=null;
	var webcamLinkId = $(data).attr('id');
	var lastValue = webcamLinkId.substring(webcamLinkId.lastIndexOf('_')+1);
	var productName = $('#select_product_'+lastValue+'').val();
	var imageId = $('#product_image_src_'+lastValue+'').attr('id');
	imageIdGlobal=imageId;
	productNameGlobal=productName;
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
		$("#"+imageIdGlobal+"").attr("src",data_uri);
		
		Webcam.upload( data_uri, '${pageContext.request.contextPath}/gahan/addWebcamProductImage', function(code, text) {
            if(code===200){
            	swal({
					  title: "<spring:message code="newSalesOrder.Success" />",
					  text: "<spring:message code="newSalesOrder.Image_Added_successfully" />",
					  type: "success",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "Ok, Fine"
					});
            	Webcam.reset();
            }else{
            	swal({
					  title: "<spring:message code="newSalesOrder.Oops_Failed" />",
					  text: "<spring:message code="newSalesOrder.Image_Not_Added" />",
					  type: "warning",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "Try Again"
					});
            	Webcam.reset();
            }
        } );
	} );
	
}


function close_camera() {
	Webcam.reset();
}

function getInterest() {
	var withdrawalMoney = parseFloat($("#withdrawal_money").val());
	var monthPeriod = parseInt($("#month_period").val());
	var interestRate = parseFloat($("#interest_rate").val());
	if(withdrawalMoney > 0 && monthPeriod > 0 && interestRate > 0){
		var countInterest = (monthPeriod*interestRate)/100*withdrawalMoney;
		$("#interest_amount").val(countInterest);
		$("#total_amount_with_interest").val(withdrawalMoney+countInterest);
	}
}


function addNewProduct(data){
	var addBtnId = $(data).attr("id");
	var lastValue = addBtnId.substring(addBtnId.lastIndexOf('_') + 1);
	var productName = $("#product_name_"+lastValue+"").val();
	var productWeight = parseFloat($("#product_weight_"+lastValue+"").val());
	var productNetWeight = parseFloat($("#product_net_weight_"+lastValue+"").val());
	var old_num=lastValue;
	if($(data).attr("value")==="Add"){
		if(productName!="" && productWeight > 0 && productNetWeight > 0){
			$.ajax({
				url:"${pageContext.request.contextPath}/gahan/addToGahanProductMap",
				method:"post",
				data : {
					'productName': productName,
					'productWeight' : productWeight,
					'productNetWeight' : productNetWeight,
				},
				dataType:"json",
				success: function(data){
					if(data==="success"){
						
						lastValue++;
						$('#clonable_tr_'+old_num+'').find(".product_list").select2('destroy');
						
						var $clone = $('#clonable_tr_'+old_num+'').clone().appendTo('#gahanProductTable');
						$clone.attr("id", "clonable_tr_"+lastValue+"");
						
						$clone.find("#product_name_"+old_num+"").attr("id","product_name_"+lastValue+"").prop('disabled', false);
						$("#product_name_"+lastValue+"").val("");
						$clone.find("#product_name_"+lastValue+"").select2({
							placeholder:"Select/Add product",
							tags: true
						});
						
						$clone.find("#product_weight_"+old_num+"").attr("id","product_weight_"+lastValue+"").prop('disabled', false);;
						$("#product_weight_"+lastValue+"").val("");
						
						$clone.find("#product_net_weight_"+old_num+"").attr("id","product_net_weight_"+lastValue+"").prop('disabled', false);;
						$("#product_net_weight_"+lastValue+"").val("");
						
						$clone.find("#product_image_link_"+old_num+"").attr("id","product_image_link_"+lastValue+"").prop('disabled', false);;
						
						$clone.find("#product_image_src_"+old_num+"").attr("id","product_image_src_"+lastValue+"");
						$("#product_image_src_"+lastValue+"").attr("src", "${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png");
						
						$clone.find("#addBtn_"+old_num+"").attr("id","addBtn_"+lastValue+"");
						
						$("#addBtn_"+old_num+"").attr('class', 'btn purple btn-sm');
						$("#addBtn_"+old_num+"").attr('value','Remove')
						
						$("#product_name_"+old_num+"").prop('disabled', true);
						$("#product_weight_"+old_num+"").prop('disabled', true);
						$("#product_net_weight_"+old_num+"").prop('disabled', true);
						$("#product_image_link_"+old_num+"").prop('disabled', true);
						$("#product_image_link_"+old_num+"").attr('onclick', '');
						$("#product_image_link_"+old_num+"").removeAttr('href');
						
						calculateSumOf_Total_net_weight();
						swal({
							  title: "<spring:message code="newSalesOrder.Success" />",
							  text: "<spring:message code="newGahan.Gahan_data_save_successfully" />",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok",
							  closeOnConfirm: false
							});
						
					}else{
						swal("<spring:message code="newGahan.Server_error" />","<spring:message code="newGahan.Unable_to_Save_Gahan_data" />", "error");
					}
				},
				error:function(){
					swal("<spring:message code="newGahan.Server_error" />","<spring:message code="newGahan.Unable_to_Save_Gahan_data" />", "error");
				}
			});
		}else{
			swal({
				  title: "<spring:message code="newSalesOrder.Error" />",
				  text: "<spring:message code="newGahan.Please_enter_productname_weight_and_net_weight" />",
				  type: "error",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Ok",
				  closeOnConfirm: false
			});
		}
	}else{
		var netWeightBoxValue = parseFloat($("#product_net_weight_"+lastValue+"").val());
		calculateSubOf_Total_net_weight(netWeightBoxValue);
		$('#clonable_tr_'+lastValue+'').remove();
	}
}


function saveGahanData(){
	var gahanDate = $("#select_gahan_date").val();
	var productNetWeight = parseFloat($("#total_net_weight").val());
	var withdrawalMoney = parseFloat($("#withdrawal_money").val());
	var monthPeriod = parseInt($("#month_period").val());
	var interestRate = parseFloat($("#interest_rate").val());
	var interestAmount = parseFloat($("#interest_amount").val());
	var totalAmountWithInterest = parseFloat($("#total_amount_with_interest").val());
	if (gahanDate!="" &&  productNetWeight > 0 && withdrawalMoney > 0 && monthPeriod > 0 && interestRate > 0 && interestAmount > 0 && totalAmountWithInterest > 0) {
		$.ajax({
			url:"${pageContext.request.contextPath}/gahan/saveComplateGahan/${customer.getCustomer_id()}",
			method:"post",
			data : {
				'gahanDate' : gahanDate,
				'productNetWeight' : productNetWeight,
				'withdrawalMoney' : withdrawalMoney,
				'monthPeriod' : monthPeriod,
				'interestRate' : interestRate,
				'interestAmount' : interestAmount,
				'totalAmountWithInterest' : totalAmountWithInterest,
			},
			dataType:"json",
			success: function(data){
				if(data==="success"){
					swal({
						  title: "<spring:message code="newSalesOrder.Success" />",
						  text: "<spring:message code="newGahan.Gahan_data_save_successfully" />",
						  type: "success",
						  showCancelButton: false,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "Ok",
						  closeOnConfirm: false
						},
						function(){
							window.location.href = "${pageContext.request.contextPath}/customer/profile/${customer.getCustomer_id()}";
						});
				}else{
					swal("<spring:message code="newGahan.Server_error" />","<spring:message code="newGahan.Unable_to_Save_Gahan_data" />", "error");
				}
			},
			error:function(){}
		});
	} else {
		swal("<spring:message code="newSalesOrder.Please_check_your_entered_data_Fill_all_fields_properly" />","","error");
	}
}



</script>
<script type="text/javascript">
function calculateSumOf_Total_net_weight(){
	var netWeight=0;
	$(".pnw").each(function () {
     if (!isNaN(this.value) && this.value.length != 0) {
         netWeight += parseFloat(this.value);
     }
 	});
	$("#total_net_weight").val(netWeight)
}

function calculateSubOf_Total_net_weight(netWeightBoxValue){
	var total = parseFloat($("#total_net_weight").val());
    total = total-netWeightBoxValue;
	$("#total_net_weight").val(total)
}


$(".product_list").select2({
	placeholder:"Select/Add product",
	tags: true
});
</script>
</body>
</html>