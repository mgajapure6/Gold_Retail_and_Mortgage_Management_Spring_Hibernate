<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="newSalesOrder.New_Sales_Order" /> </title>
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
                    <h1 class="page-title"> <spring:message code="newSalesOrder.New_Sales_Order_From" /> ${customer.getCustomer_name()}
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span> <spring:message code="newSalesOrder.New_Sales_Order_From" /> ${customer.getCustomer_name()}</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   
                 <div class="panel panel-primary ">
			         <div class="panel-heading">
			             <h3 class="panel-title"><spring:message code="newSalesOrder.Add_Sales_products_one_by_one" /></h3>
			        </div>
		          	<div class="panel-body"> 
		          	
		          	<table class="table table-striped table-bordered table-hover table-light"  id="addProductTable">
		          		<tr>
		          			<th>#</th>
		          			<th><spring:message code="newSalesOrder.Metal_Type" /></th>
		          			<th><spring:message code="newSalesOrder.Karret" /></th>
		          			<th><spring:message code="newSalesOrder.Todays_Metal_Rate_per_tola" /></th>
			          		<th><spring:message code="newSalesOrder.Product" /></th>
			          		<th><spring:message code="newSalesOrder.Weight" /></th>
			          		<th><spring:message code="newSalesOrder.Price" /></th>
			          		<th><spring:message code="newSalesOrder.Quantities" /></th>
			          		<th><spring:message code="newSalesOrder.Making_Charge" /></th>
			          		<th><spring:message code="newSalesOrder.Total_Price" /></th>
			          		<th><spring:message code="newSalesOrder.Product_Image" /></th>
			          		<th><spring:message code="newSalesOrder.Add_Remove" /></th>
		          		</tr>
		          		<tr id="addProduct_row_0">
		          			<td id="row_num_0">1</td>
		          			<td> <select name="product_metal_karret" id="product_metal_karret_0" class="product_metal_karret form-control input-small input-sm">
				                	<option></option>
						           	<option value="<spring:message code="newSalesOrder.24k" />"><spring:message code="newSalesOrder.24k" /></option>
						           	<option value="<spring:message code="newSalesOrder.23k" />"><spring:message code="newSalesOrder.23k" /></option>
						           	<option value="<spring:message code="newSalesOrder.22k" />"><spring:message code="newSalesOrder.22k" /></option>
						           	<option value="<spring:message code="newSalesOrder.21k" />"><spring:message code="newSalesOrder.21k" /></option>
						           	<option value="<spring:message code="newSalesOrder.20k" />"><spring:message code="newSalesOrder.20k" /></option>
						           	
						        </select></td>
		          			<td>
				                <select name="product_metal_type" id="product_metal_type_0" class="product_metal_type form-control input-small input-sm">
				                	<option></option>
						           	<option value="<spring:message code="newSalesOrder.gold" />"><spring:message code="newSalesOrder.gold" /></option>
						           	<option value="<spring:message code="newSalesOrder.silver" />"><spring:message code="newSalesOrder.silver" /></option>
						           	<option value="<spring:message code="newSalesOrder.platinum" />"><spring:message code="newSalesOrder.platinum" /></option>
						           	<option value="<spring:message code="newSalesOrder.stone_silver" />"><spring:message code="newSalesOrder.stone_silver" /></option>
						           	<option value="<spring:message code="newSalesOrder.bentex" />"><spring:message code="newSalesOrder.bentex" /></option>
						           	
						        </select>
				         	</td>
				         	<td><input type="text" class="form-control input-sm" id="todays_metal_rate_0" size="15" /></td>
						    <td>
						   		 <select name="product_list" id="select_product_0" class="product_list form-control input-small input-sm">
						   		 <option></option>
						   		 	<c:forEach var="product" items="${allProductsList}" varStatus="i" > 
										<option textue="${product.getProduct_name()}">${product.getProduct_name() }</option>
									</c:forEach>
						         </select>
				         	</td>
				         	<td><input type="text" class="form-control input-sm" id="product_weight_0" size="15" onInput="getProductPrice(this)" /></td>
				         	<td><input type="text" class="form-control input-sm" id="product_price_0" size="15" value="0"/></td>
				         	 <td><input type="number" size="15" class="form-control input-sm input-xs" id="product_quantities_0" onchange="getTotalPriceOfQuantities(this)"  value="1" min="1" /></td>
				         	<td><input type="text" size="15" class="form-control input-sm" id="making_charge_0"   onkeyup="makingCharge(this)"/></td>
				         	<td><input type="text" class="form-control totalTxt input-sm" id="product_total_price_0" size="15"/></td>
				         	<td>
                                <a href="#webcamModal" id="product_image_link_0" onclick="webcamLanchBtn(this)" data-toggle="modal">
                                	<img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-circle" alt=""  style="width: 60px; height: 60px"id="product_image_src_0" />
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
				         	</td>
						    <td><input type="button" value="add" id="addField_0" class="btn blue addClass btn-sm"  onclick="addField(this)" /></td>
				         </tr>
		          	</table>
		          	<div class="pull-right"><h2><spring:message code="newSalesOrder.Total_Price_Rs" />: <label id="tp" class="text-danger">0</label></h2>
		          		<div>
		          			<input type="button" value="<spring:message code="newSalesOrder.Add_payment_for_this_order" />" id="addSalesPayment" class="btn btn-lg purple"  onclick="addSalesPayment(this)" disabled="disabled" />
		          		</div>
		          	</div>
		          </div>
		    </div>
			
		    <!-- Start Payment panel  -->
		     <div class="panel panel-danger " id="paymentPanel">
		         <div class="panel-heading">
		             <h3 class="panel-title"><spring:message code="newSalesOrder.Add_payment_for_this_order" /></h3>
		          </div>
		          <div class="panel-body"> 
		          	<table class=" table table-striped table-bordered table-hover table-light"  id="addPaymentTable">
		          		<tr>
			          		<th class=""><spring:message code="newSalesOrder.Total_Products" /></th>
			          		<th><spring:message code="newSalesOrder.Total_Quantities_of_Products" /></th>
			          		<th><spring:message code="newSalesOrder.Discount" /></th>
			          		<th><spring:message code="newSalesOrder.Vat_Rate" /></th>
			          		<th><spring:message code="newSalesOrder.Paying_Amount" /></th>
			          		<th><spring:message code="newSalesOrder.Paying_By" /></th>
		          		</tr>
		          		<tr>
			          		<td id="totalProducts"></td>
			          		<td id="totalQuantities"></td>
			          		<td><input type="text" class="form-control" id="discountAmt" oninput="getAfterDiscountPrice()" value="0"/></td>
			          		<td><input type="text" class="form-control" id="vatRate" oninput="getAfterVatPrice()" value="0"/></td>
			          		<td><input type="text" class="form-control" id="paymentAmt" oninput="getBalancePrice()" value="0"/></td>
			          		<td>
						   		 <select name="payingMethod" id="payingMethod" class="form-control " onchange="">
						   		 	<option value="<spring:message code="newSalesOrder.Cash" />"><spring:message code="newSalesOrder.Cash" /></option>
						   		 	<option value="<spring:message code="newSalesOrder.Check" />"><spring:message code="newSalesOrder.Check" /></option>
						   		 	<option value="<spring:message code="newSalesOrder.DD" />"><spring:message code="newSalesOrder.DD" /></option>
						   		 	<option value="<spring:message code="newSalesOrder.Net_Banking_Transfer" />"><spring:message code="newSalesOrder.Net_Banking_Transfer" /></option>
						   		 	<option value="<spring:message code="newSalesOrder.Mobile_App_Transfer" />"><spring:message code="newSalesOrder.Mobile_App_Transfer" /></option>
						         </select>
				         	</td>
		          		</tr>
		          	</table>
		          	<div class="pull-right">
			          	<h2><spring:message code="newSalesOrder.Total_Amount_Rs" />:<label id="ta" class="text-primary">0</label></h2>
			          	<h3><spring:message code="newSalesOrder.Balance_Amount_Rs" />:<label id="ba" class="text-danger">0</label></h3>
		          			<input type="button" value="<spring:message code="newSalesOrder.Save_this_sales_order" />" id="saveWholeSalesOrder" class="btn btn-lg red"  onclick="saveWholeSalesOrder(this)" />
		          	</div>
		          </div>
		    </div>
		    <!-- End Payment panel  -->
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/webcam.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/myScript/newSalesOrder.js" type="text/javascript"></script>
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
		
		Webcam.upload( data_uri, '${pageContext.request.contextPath}/salesOrder/addWebcamProductImage', function(code, text) {
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

function getProductPrice(data){
	var productPriceId = $(data).attr('id');
	var lastValue = productPriceId.substring(productPriceId.lastIndexOf('_')+1);
	var metalRate = parseFloat($('#todays_metal_rate_'+lastValue+'').val());
	var productName = $('#select_product_'+lastValue+'').val();
	var productWeight = parseFloat($(data).val());
	if (metalRate > 0 && productWeight > 0 && productName!='') {
		var perGramPrice = (metalRate/10)*productWeight;
		$('#product_price_'+lastValue+'').val(perGramPrice.toFixed(2));
		$('#product_quantities_'+lastValue+'').val(1)
		$('#product_total_price_'+lastValue+'').val(perGramPrice.toFixed(2));
	} else {
		//swal("<spring:message code="newSalesOrder.priceErrorMsg" />","", "error");
	}
}
function makingCharge(data){
	var  makingChargeId= $(data).attr('id');
	var lastValue = makingChargeId.substring(makingChargeId.lastIndexOf('_')+1);
	var makingCharge = parseFloat($(data).val());
	var productPrice = parseFloat($('#product_price_'+lastValue+'').val());
	var quantities = parseInt($('#product_quantities_'+lastValue+'').val());
	if(makingCharge > 0){
		var totalPrice =  (productPrice*quantities)+makingCharge;
		$('#product_total_price_'+lastValue+'').val(totalPrice.toFixed(2));
	}else{
		$('#product_total_price_'+lastValue+'').val((productPrice*quantities).toFixed(2));
	}
	
}
function getTotalPriceOfQuantities(data) {
	var  productQuantityId= $(data).attr('id');
	var lastValue = productQuantityId.substring(productQuantityId.lastIndexOf('_')+1);
	var makingCharge = parseFloat($('#making_charge_'+lastValue+'').val());
	var productPrice = parseFloat($('#product_price_'+lastValue+'').val());
	var productQuantities = parseInt($(data).val());
	if(productPrice > 0 && productQuantities > 0 &&  makingCharge > 0){
		var totalPrice = (productPrice*productQuantities)+makingCharge;
		$('#product_total_price_'+lastValue+'').val(totalPrice.toFixed(2));
	}else{
		if(productPrice > 0 && productQuantities > 0 &&  (makingCharge < 0 || makingCharge === '')){
			var totalPrice = productPrice*productQuantities;
			$('#product_total_price_'+lastValue+'').val(totalPrice.toFixed(2));
		}
	}
	
}


function addField(btn) {
	var addBtnId = $(btn).attr('id');
	var lastValue = addBtnId.substring(addBtnId.lastIndexOf('_') + 1);
	var metalType =  $('#product_metal_type_'+lastValue+'').val();
	var metalKarret =  $('#product_metal_karret_'+lastValue+'').val();
	var metalRate = parseFloat($('#todays_metal_rate_'+lastValue+'').val());
	var productName = $('#select_product_'+lastValue+'').val();
	var productWeight = parseFloat($('#product_weight_'+lastValue+'').val());
	var makingCharge = parseFloat($('#making_charge_'+lastValue+'').val());
	var productPrice = parseFloat($('#product_price_'+lastValue+'').val());
	var productImage = $('#product_image_src_'+lastValue+'').attr('src');
	var quantities = parseInt($('#product_quantities_'+lastValue+'').val());
	var totalQuantityPrice = parseFloat($('#product_total_price_'+lastValue+'').val());
	var old_num=lastValue;
	var row_num =parseInt(lastValue)+1;
	
	if ($(btn).attr('value') === "remove") {
			$.ajax({
				   url:"${pageContext.request.contextPath}/salesOrder/removeProductFromMap",
					method : "get",
					dataType : "json",
					data : {
						'productName' : productName
					},
					success : function(data) {
						if(data==="success"){
							var totalPriceBoxValue = parseFloat($('#product_total_price_'+lastValue+'').val());
							calculateSub(totalPriceBoxValue);
							var rowId = $('#addProduct_row_'+lastValue+'').remove();
							var labelPrice =  parseFloat($("#tp").text());
							if(labelPrice<=0){
								$("#paymentPanel").hide();
								$('#addSalesPayment').prop('disabled', true);
							}
						}else{
							swal("<spring:message code="newSalesOrder.Product_list_is_empty" />","<spring:message code="newSalesOrder.All_product_remove_successfully" />.", "warning");
							var totalPriceBoxValue = parseFloat($('#product_total_price_'+lastValue+'').val());
							calculateSub(totalPriceBoxValue);
							var rowId = $('#addProduct_row_'+lastValue+'').remove();
							var labelPrice =  parseFloat($("#tp").text());
							if(labelPrice<=0){
								$("#paymentPanel").hide();
								$('#addSalesPayment').prop('disabled', true);
							}
						}
					},
					error : function() {
						swal("<spring:message code="newSalesOrder.Failed_to_remove" />","<spring:message code="newSalesOrder.Unable_to_remove_product_Please_try_again" />", "error");
					}
			});
		
	}
	if ($(btn).attr('value') === "add") {
		if(productPrice > 0 && quantities > 0 && totalQuantityPrice > 0 && metalType!='' && metalRate > 0 && productName != '' && productWeight > 0){
			$.ajax({
				   url:"${pageContext.request.contextPath}/salesOrder/addToSalesOrderProductMap",
					method : "POST",
					dataType : "json",
					data : {
						  'metalType' : metalType,
						  'metalKarret' : metalKarret,
						  'metalRate' : metalRate,
						  'productName' : productName,
						 'productWeight' : productWeight,
						 'makingCharge' : makingCharge,
						  'productPrice' : productPrice,
						  'productImage' : productImage,
						  'quantities' : quantities,
						  'totalQuantityPrice' : totalQuantityPrice
					},
					success : function(data) {
						if(data==="success"){
							$('#product_metal_type_'+lastValue+'').prop('disabled', true);
							$('#product_metal_karret_'+lastValue+'').prop('disabled', true);
							$('#todays_metal_rate_'+lastValue+'').prop('disabled', true);
							$('#product_weight_'+lastValue+'').prop('disabled', true);
							$('#making_charge_'+lastValue+'').prop('disabled', true);
							$('#product_image_link_'+lastValue+'').prop('disabled', true);
							$('#select_product_'+lastValue+'').prop('disabled', true);
							$('#product_price_'+lastValue+'').prop('disabled', true);
							$('#product_quantities_'+lastValue+'').prop('disabled', true);
							$('#product_total_price_'+lastValue+'').prop('disabled', true);
							$('.addClass').prop('disabled', false);
							$('#addSalesPayment').prop('disabled', false);
							calculateSum();
							
								//code for clone
								$('#addProduct_row_'+old_num+'').find(".product_metal_type").select2('destroy');
								 $('#addProduct_row_'+old_num+'').find(".product_list").select2('destroy');
								 lastValue++;
								row_num++;
								
								var $clone = $('#addProduct_row_'+old_num+'').clone().appendTo('#addProductTable');
								$clone.attr("id", "addProduct_row_"+lastValue+"");
								
								$clone.find("#row_num_"+old_num+"").attr("id", "row_num_"+lastValue+"").text(""+row_num);
								$clone.find("#row_num_"+lastValue+"").text(row_num);
								
								$clone.find("#product_metal_type_"+old_num+"").attr("id", "product_metal_type_"+lastValue+"").prop('disabled', false);
								$clone.find("#product_metal_type_"+lastValue+"").select2({
									placeholder:"Select metal type",
									width:"auto",
								});
								
								$clone.find("#product_metal_karret_"+old_num+"").attr("id", "product_metal_type_"+lastValue+"").prop('disabled', false);
								$clone.find("#product_metal_karret_"+lastValue+"").select2({
									placeholder:"Select metal karret",
									width:"auto",
								});
								
								$clone.find("#todays_metal_rate_"+old_num+"").attr("id", "todays_metal_rate_"+lastValue+"").prop('disabled', false); 
								$clone.find("#todays_metal_rate_"+lastValue+"").val("").end(); 
								
								$clone.find("#select_product_"+old_num+"").attr("id", "select_product_"+lastValue+"").prop('disabled', false);
								$clone.find("#select_product_"+lastValue+"").select2({
									placeholder:"Select/Add product",
									width:"auto",
									tags: true
								});
								
								$clone.find("#product_weight_"+old_num+"").attr("id", "product_weight_"+lastValue+"").prop('disabled', false); 
								$clone.find("#product_weight_"+lastValue+"").val("").end(); 
								
								$clone.find("#making_charge_"+old_num+"").attr("id", "making_charge_"+lastValue+"").prop('disabled', false); 
								$clone.find("#making_charge_"+lastValue+"").val("").end(); 
								
								$clone.find("#product_image_link_"+old_num+"").attr("id", "product_image_link_"+lastValue+"").prop('disabled', false); 
								
								$clone.find("#product_image_src_"+old_num+"").attr("id", "product_image_src_"+lastValue+"").prop('disabled', false); 
								$("#product_image_src_"+lastValue+"").attr("src", "${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png")
								
								$clone.find("#product_price_"+old_num+"").attr("id", "product_price_"+lastValue+"").prop('disabled', false); 
								$clone.find("#product_price_"+lastValue+"").val("").end(); 
								
								$clone.find("#product_quantities_"+old_num+"").attr("id", "product_quantities_"+lastValue+"").prop('disabled', false); 
								$clone.find("#product_quantities_"+lastValue+"").val("").end(); 
								
								$clone.find("#product_total_price_"+old_num+"").attr("id", "product_total_price_"+lastValue+"").prop('disabled', false);
								$clone.find("#product_total_price_"+lastValue+"").val("").end(); 
								
								$clone.find("#addField_"+old_num+"").attr("id", "addField_"+lastValue+"");
								$clone.find("#addField_"+lastValue+"").prop('disabled', false);
								
								$(btn).attr('class', 'btn red btn-sm');
								$(btn).attr('value', 'remove');
								
							
						}else{
							swal("<spring:message code="newSalesOrder.Oops_Failed" />","<spring:message code="newSalesOrder.Please_check_your_entered_data_Fill_all_fields_properly" />", "error");
						}
					},
					error : function() {
						swal("<spring:message code="newSalesOrder.Oops_Failed" />","<spring:message code="newSalesOrder.Please_check_your_entered_data_Fill_all_fields_properly" />", "error");
					}
				});
			
		}else{
			swal("<spring:message code="newSalesOrder.Oops_Failed" />","<spring:message code="newSalesOrder.Please_check_your_entered_data_Fill_all_fields_properly" />", "error");
		}
		 
		
	}
	
}

function calculateSum() {
    var sum = 0;
    //iterate through each textboxes and add the values
    $(".totalTxt").each(function () {
        //add only if the value is number
        if (!isNaN(this.value) && this.value.length != 0) {
            sum += parseFloat(this.value);
        }
    });
    //.toFixed() method will roundoff the final sum to 2 decimal places
    $("#tp").html(sum.toFixed(2));
}

function calculateSub(totalPriceBoxValue) {
	var total = parseFloat($("#tp").text());
    total -= totalPriceBoxValue;
    $("#tp").html(total.toFixed(2));
}

function addSalesPayment(btn){
	var total = parseFloat($("#tp").text());
	var labelPrice =  parseFloat($("#tp").text());
	getTotalProducts();
	getTotalQuantity();
	var labelPrice = parseFloat($("#tp").text());
	$("#ta").text(labelPrice.toFixed(2));
	$("#ba").text(labelPrice.toFixed(2));
	$("#discountAmt").val("0");
	$("#paymentAmt").val("0");
	$("#paymentPanel").show();
	App.scrollTo($("#paymentPanel"),200);
}

function getTotalProducts(){
	$.ajax({
		   url:"${pageContext.request.contextPath}/salesOrder/getTotalProductsInMap",
			method : "get",
			dataType : "json",
			success : function(data) {
				$("#totalProducts").text(data);
			},
			error : function() {
				swal("<spring:message code="newSalesOrder.Failed_to_get_Total_Products" />","", "error");
			}
		});
}

function getTotalQuantity(){
	$.ajax({
		   url:"${pageContext.request.contextPath}/salesOrder/getTotalProductQuantitiesInMap",
			method : "get",
			dataType : "json",
			success : function(data) {
				$("#totalQuantities").text(data);
			},
			error : function() {
				swal("<spring:message code="newSalesOrder.Failed_to_get_Total_Quantities" />","", "error");
			}
		});
}

function getAfterDiscountPrice(){
	var labelPrice = parseFloat($("#tp").text());
	var dscAmt = $("#discountAmt").val();
	labelPrice -= dscAmt;
	$("#ta").text(labelPrice.toFixed(2))
	$("#ba").text(labelPrice.toFixed(2))
}

function getBalancePrice(){
	var payAmt = $("#paymentAmt").val();
	var labelPrice = parseFloat($("#ta").text());
	var balAmt = labelPrice;
	balAmt -=payAmt;
	$("#ba").text(balAmt.toFixed(2))
}
</script>
<script type="text/javascript">
function saveWholeSalesOrder(){
	var totalAmtBeforeDiscount = $("#tp").text();
	var discountAmt = $("#discountAmt").val();
	var totalAmtAfterDiscount = $("#ta").text();
	var paymentAmt =  $("#paymentAmt").val();
	var balanceAmt =  $("#ba").text();
	var paidMethod = $("#payingMethod").val();
	$.ajax({
		   url:"${pageContext.request.contextPath}/salesOrder/saveComplateSalesOrder/${customer.getCustomer_id()}",
			method : "post",
			dataType : "json",
			data : {
				'totalAmtBeforeDiscount' : totalAmtBeforeDiscount,
				'discountAmt' : discountAmt,
				'totalAmtAfterDiscount' : totalAmtAfterDiscount,
				'paymentAmt' : paymentAmt,
				'balanceAmt' : balanceAmt,
				'paidMethod' : paidMethod
			},
			success : function(data) {
				if(data==="success"){
					swal({
						  title: "<spring:message code="newSalesOrder.Sales_order_saved_successfully" />",
						  text: "",
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
					swal("<spring:message code="newSalesOrder.Uable_to_save_Sales_Order" /> .","", "error");	
				}
			},
			error : function() {
				swal("<spring:message code="newSalesOrder.Uable_to_save_Sales_Order" />","", "error");
			}
		});
}


$(".product_metal_type").select2({
	placeholder:"Select metal type",
	width:"auto"
});
$(".product_list").select2({
	placeholder:"Select/Add product",
	width:"auto",
	tags: true
	
});
$(".product_metal_karret_").select2({
	placeholder:"Select metal karret",
	width:"auto",
	tags: true
	
});

$("#paymentPanel").hide();
</script>
</body>
</html>