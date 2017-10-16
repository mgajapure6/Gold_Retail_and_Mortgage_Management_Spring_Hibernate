<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="newPurchaseOrder.New_Purchase_Order" /></title>
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
                    <h1 class="page-title"><spring:message code="newPurchaseOrder.New_Purchase_Order_From_Supplier" />  ${supplier.getSupplier_name()}
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span> <spring:message code="newPurchaseOrder.New_Purchase_Order_From_Supplier" /> ${supplier.getSupplier_name()}</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   
                 <div class="panel panel-primary ">
			         <div class="panel-heading">
			             <h3 class="panel-title"><spring:message code="newPurchaseOrder.Add_purchase_products_one_by_one" /></h3>
			        </div>
		          	<div class="panel-body"> 
<!-- 		          		<div class=" form-group"> -->
<!-- 		          		 	<select name="product_supplier_list" id="select_product_supplier" class="form-control  product_supplier_list " > -->
<!-- 				                 <option></option> -->
<%-- 						           	<c:forEach var="supplier" items="${allSupplierList}" varStatus="i" > --%>
<%-- 									    <option value="${supplier.getSupplier_id()}">${supplier.getSupplier_name() }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 						   </select> -->
<!-- 		          		</div> -->
		          	
		          	<table class=" table table-striped table-bordered table-hover"  id="addProductTable">
		          		<tr>
		          			<th>#</th>
			          		<th><spring:message code="newPurchaseOrder.New_Existing_Product" /></th>
			          		<th><spring:message code="newPurchaseOrder.Cost_price" /></th>
			          		<th><spring:message code="newPurchaseOrder.Selling_Price" /></th>
			          		<th><spring:message code="newPurchaseOrder.Total_Quantities" /></th>
			          		<th><spring:message code="newPurchaseOrder.Total_Price" /></th>
			          		<th><spring:message code="newPurchaseOrder.Save_product" /></th>
			          		<th><spring:message code="newPurchaseOrder.Add_Remove" /></th>
		          		</tr>
		          		<tr id="addProduct_row_0">
		          			<td id="row_num_0">1</td>
<!-- 		          			<td> -->
<!-- 				                <select name="product_category_list" id="select_product_category_0" class="product_category_list form-control " onchange="getAllCategoryPoducts(this)"> -->
<!-- 				                <option></option> -->
<%-- 						           	<c:forEach var="productCategory" items="${allCategoryList}" varStatus="i" > --%>
<%-- 									    <option value="${productCategory.getProductCategory_id()}">${productCategory.getProductCategory_name() }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 						        </select> -->
<!-- 				         	</td> -->
						    <td>
						   		 <select name="product_list" id="select_product_0" class="product_list form-control " onchange="getProductDetail(this)">
						   		 <option></option>
						   		 	<c:forEach var="product" items="${allProductsList}" varStatus="i" > 
										<option textue="${product.getProduct_name()}">${product.getProduct_name() }</option>
									</c:forEach>
						         </select>
				         	</td>
				         	<td><input type="text" class="form-control" id="product_cost_price_0"  /></td>
						    <td><input type="text" class="form-control" id="product_selling_price_0" /></td>
						    <td><input type="number" class="form-control" id="product_quantities_0" onchange="getTotalPriceOfQuantities(this)"  value="0" min="0"/></td>
						    <td><input type="text" class="form-control totalTxt" id="product_total_price_0"  /></td>
						    <td> <input type="button" class="btn green" id="saveProduct_0" onclick="saveProduct(this)" value="save" /></td>
						    <td><input type="button" value="add" id="addField_0" class="btn blue addClass"  onclick="addField(this)" disabled="disabled" /></td>
				         </tr>
		          	</table>
		          	<div class="pull-right"><h2><spring:message code="newPurchaseOrder.Total_Price_Rs" />:<label id="tp" class="text-danger">0</label></h2>
		          		<div>
		          			<input type="button" value="Add payment for this order" id="addPurchasePayment" class="btn btn-lg purple"  onclick="addPurchasePayment(this)" disabled="disabled" />
		          		</div>
		          	</div>
		          </div>
		    </div>
		    <!-- Start Payment panel  -->
		     <div class="panel panel-danger " id="paymentPanel">
		         <div class="panel-heading">
		             <h3 class="panel-title"><spring:message code="newPurchaseOrder.Add_payment_for_this_purchase_order" /></h3>
		          </div>
		          <div class="panel-body"> 
		          	<table class=" table table-striped table-bordered table-hover"  id="addPaymentTable">
		          		<tr>
			          		<th class=""><spring:message code="newPurchaseOrder.Total_Products" /></th>
			          		<th><spring:message code="newPurchaseOrder.Total_Quantities_of_Products" /></th>
			          		<th><spring:message code="newPurchaseOrder.Discount" /></th>
			          		<th><spring:message code="newPurchaseOrder.Paying_Amount" /></th>
			          		<th><spring:message code="newPurchaseOrder.Paying_By" /></th>
		          		</tr>
		          		<tr>
			          		<td id="totalProducts"></td>
			          		<td id="totalQuantities"></td>
			          		<td><input type="text" class="form-control" id="discountAmt" oninput="getAfterDiscountPrice()" value="0"/></td>
			          		<td><input type="text" class="form-control" id="paymentAmt" oninput="getBalancePrice()" value="0"/></td>
			          		<td>
						   		 <select name="payingMethod" id="payingMethod" class="form-control " onchange="">
						   		 	<option value="Cash"><spring:message code="newPurchaseOrder.Cash" /></option>
						   		 	<option value="Check"><spring:message code="newPurchaseOrder.Check" /></option>
						   		 	<option value="DD"><spring:message code="newPurchaseOrder.DD" /></option>
						   		 	<option value="Online Net Banking Transfer"><spring:message code="newPurchaseOrder.Net_Banking_Transfer" /></option>
						   		 	<option value="Mobile App Transfer"><spring:message code="newPurchaseOrder.Mobile_App_Transfer" /></option>
						         </select>
				         	</td>
		          		</tr>
		          	</table>
		          	<div class="pull-right">
			          	<h2><spring:message code="newPurchaseOrder.Total_Amount_Rs" />:<label id="ta" class="text-primary">0</label></h2>
			          	<h3><spring:message code="newPurchaseOrder.Balance_Amount_Rs" />:<label id="ba" class="text-danger">0</label></h3>
		          			<input type="button" value="Save this order and payment now" id="saveWholePurchaseOrder" class="btn btn-lg red"  onclick="saveWholePurchaseOrder(this)" />
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
<script src="${pageContext.request.contextPath}/resources/assets/myScript/newPurchaseOrder.js" type="text/javascript"></script>
<script type="text/javascript">

function getProductDetail(data) {
	var productName = $(data).val();
	var productBoxId = $(data).attr('id');
	var lastValue = productBoxId.substring(productBoxId.lastIndexOf('_')+1);
		$.ajax({
			   url:"${pageContext.request.contextPath}/inventoryProduct/getInventoryProductByName/"+productName+"",
				method : "get",
				dataType : "json",
				success : function(product) {
					if(product != null){
						$('#product_cost_price_'+lastValue+'').val(product.inventoryProduct_cost_price);
						$('#product_selling_price_'+lastValue+'').val(product.inventoryProduct_selling_price);
					}else{
						$('#product_cost_price_'+lastValue+'').val('');
						$('#product_selling_price_'+lastValue+'').val('');
						$('#product_quantities_'+lastValue+'').val('');
						$('#product_total_price_'+lastValue+'').val('');
						swal("<spring:message code="newPurchaseOrder.This_product_is_not_available" />","<spring:message code="newPurchaseOrder.This_is_new_product_so_add_its_detail" />.", "warning");
					}
				},
				error : function() {
					
					swal("<spring:message code="newPurchaseOrder.Ooops_Failed" />","<spring:message code="newPurchaseOrder.Uable_to_get_product_price" />.", "error");
				}
			});
}

function getTotalPriceOfQuantities(data) {
	var totalQuantity = parseInt($(data).val());
	var  productQuantityId= $(data).attr('id');
	var lastValue = productQuantityId.substring(productQuantityId.lastIndexOf('_')+1);
	var costPrice = parseFloat($('#product_cost_price_'+lastValue+'').val());
	if(costPrice >0){
		$('#product_total_price_'+lastValue+'').val(costPrice * totalQuantity);
	}else{
		$('#product_quantities_'+lastValue+'').val('');
		$('#product_cost_price_'+lastValue+'').focus();
		swal("Cost price require","", "error");	
	}
	
}

function saveProduct(btn) {
	var saveBtnId = $(btn).attr('id');
	var lastValue = saveBtnId.substring(saveBtnId.lastIndexOf('_') + 1);
	var productName = $('#select_product_'+lastValue+'').val();
	var costPrice = parseFloat($('#product_cost_price_'+lastValue+'').val());
	var sellingPrice = parseFloat($('#product_selling_price_'+lastValue+'').val());
	var quantities = parseInt($('#product_quantities_'+lastValue+'').val());
	var totalQuantityPrice = parseFloat($('#product_total_price_'+lastValue+'').val());
	var btnName =  $(btn).attr("value");
	
	if(btnName==="update"){
// 		$('#select_product_supplier_'+lastValue+'').prop('disabled', false);
// 		$("#select_product_supplier_"+lastValue+"").select2({
// 			placeholder:"Select Supplier",
// 			width:"auto",
// 			tags: true
// 		});
		
// 		$('#select_product_category_'+lastValue+'').prop('disabled', false);
// 		$("#select_product_category_"+lastValue+"").select2({
// 			placeholder:"Select category",
// 			width:"auto"
// 		});
		
		$('#select_product_'+lastValue+'').prop('disabled', true);
		
		$('#product_cost_price_'+lastValue+'').prop('disabled', false);
		
		$('#product_selling_price_'+lastValue+'').prop('disabled', false);
		
		$('#product_quantities_'+lastValue+'').prop('disabled', false);
		
		$('#product_total_price_'+lastValue+'').prop('disabled', false);
		
		$('#saveProduct_'+lastValue+'').attr('class', 'btn green');
		$('#saveProduct_'+lastValue+'').attr('value', 'save');
		
		$('.addClass').prop('disabled', true);
		
		$("#paymentPanel").hide();
		
		$('#addPurchasePayment').prop('disabled', true);
		
	}else 
		if(costPrice > 0 && sellingPrice > 0 && quantities > 0 && totalQuantityPrice > 0){
				$.ajax({
					   url:"${pageContext.request.contextPath}/purchaseOrder/addToPruchaseOrderProductMap",
						method : "POST",
						dataType : "json",
						data : {
							'productName' : productName,
							'costPrice' : costPrice,
							'sellingPrice' : sellingPrice,
							'quantities' : quantities,
							'totalQuantityPrice' : totalQuantityPrice
						},
						success : function(data) {
							if(data==="success"){
								//$('#select_product_supplier_'+lastValue+'').prop('disabled', true);
								//$('#select_product_category_'+lastValue+'').prop('disabled', true);
								$('#select_product_'+lastValue+'').prop('disabled', true);
								$('#product_cost_price_'+lastValue+'').prop('disabled', true);
								$('#product_selling_price_'+lastValue+'').prop('disabled', true);
								$('#product_quantities_'+lastValue+'').prop('disabled', true);
								$('#product_total_price_'+lastValue+'').prop('disabled', true);
								$('#saveProduct_'+lastValue+'').attr('value', 'update');
								$('#saveProduct_'+lastValue+'').attr('class', 'btn grey-mint');
								$('.addClass').prop('disabled', false);
								$('#addPurchasePayment').prop('disabled', false);
								calculateSum();
							}else{
								swal("<spring:message code="newPurchaseOrder.Ooops_Failed" />","<spring:message code="newPurchaseOrder.Please_check_your_entered_data_Fill_all_fields_properly" />.", "error");
							}
						},
						error : function() {
							swal("<spring:message code="newPurchaseOrder.Ooops_Failed" />","<spring:message code="newPurchaseOrder.Please_check_your_entered_data_Fill_all_fields_properly" />.", "error");
						}
					});
			}else{
				swal("<spring:message code="newPurchaseOrder.Unable_to_save_product" />","<spring:message code="newPurchaseOrder.Please_check_your_entered_data_Fill_all_fields_properly" />.", "error");
			}
	
}



function addField(btn) {
	var addBtnId = $(btn).attr('id');
	var lastValue = addBtnId.substring(addBtnId.lastIndexOf('_') + 1);
	var productName = $('#select_product_'+lastValue+'').val();
	var costPrice = parseFloat($('#product_cost_price_'+lastValue+'').val());
	var sellingPrice = parseFloat($('#product_selling_price_'+lastValue+'').val());
	var quantities = parseInt($('#product_quantities_'+lastValue+'').val());
	var totalQuantityPrice = parseFloat($('#product_total_price_'+lastValue+'').val());
	var old_num=lastValue;
	var row_num =parseInt(lastValue)+1;
	
	if ($(btn).attr('value') === "remove") {
			$.ajax({
				   url:"${pageContext.request.contextPath}/purchaseOrder/removeProductFromMap",
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
							$("#paymentPanel").hide();
						}else{
							swal("Now Product list is empty","All product remove successfully.", "warning");
							var totalPriceBoxValue = parseFloat($('#product_total_price_'+lastValue+'').val());
							calculateSub(totalPriceBoxValue);
							var rowId = $('#addProduct_row_'+lastValue+'').remove();
							$('#addPurchasePayment').prop('disabled', true);
						}
					},
					error : function() {
						swal("<spring:message code="newPurchaseOrder.Ooops_Failed" />","<spring:message code="newPurchaseOrder.Unable_to_remove_product_Please_try_again" />.", "error");
					}
			});
		
	}
	if ($(btn).attr('value') === "add") {
		 //$('#addProduct_row_'+old_num+'').find(".product_supplier_list").select2('destroy');
		// $('#addProduct_row_'+old_num+'').find(".product_category_list").select2('destroy');
		 $('#addProduct_row_'+old_num+'').find(".product_list").select2('destroy');
		 lastValue++;
		row_num++;
		var $clone = $('#addProduct_row_'+old_num+'').clone().appendTo('#addProductTable');
		$clone.attr("id", "addProduct_row_"+lastValue+"");
		
		$clone.find("#row_num_"+old_num+"").attr("id", "row_num_"+lastValue+"").text(""+row_num);
		$clone.find("#row_num_"+lastValue+"").text(row_num);
		
// 		$clone.find("#select_product_supplier_"+old_num+"").attr("id", "select_product_supplier_"+lastValue+"").prop('disabled', false);
// 		$clone.find("#select_product_supplier_"+lastValue+"").select2({
// 			placeholder:"Select supplier",
// 			width:"auto",
// 			tags: true
// 		});
		
// 		$clone.find("#select_product_category_"+old_num+"").attr("id", "select_product_category_"+lastValue+"").prop('disabled', false);
// 		$clone.find("#select_product_category_"+lastValue+"").select2({
// 			placeholder:"Select category",
// 			width:"auto"
// 		});
		
		$clone.find("#select_product_"+old_num+"").attr("id", "select_product_"+lastValue+"").prop('disabled', false);
		$clone.find("#select_product_"+lastValue+"").select2({
			placeholder:"Select product",
			width:"auto",
			tags: true
		});
		
		$clone.find("#product_cost_price_"+old_num+"").attr("id", "product_cost_price_"+lastValue+"").prop('disabled', false); 
		$clone.find("#product_cost_price_"+lastValue+"").val(0).end(); 
		
		$clone.find("#product_selling_price_"+old_num+"").attr("id", "product_selling_price_"+lastValue+"").prop('disabled', false); 
		$clone.find("#product_selling_price_"+lastValue+"").val(0).end(); 
		
		$clone.find("#product_quantities_"+old_num+"").attr("id", "product_quantities_"+lastValue+"").prop('disabled', false); 
		$clone.find("#product_quantities_"+lastValue+"").val(0).end(); 
		
// 		$clone.find("#product_weight_"+old_num+"").attr("id", "product_weight_"+lastValue+"").prop('disabled', false);
// 		$clone.find("#product_weight_"+lastValue+"").val("").end(); 
		
		$clone.find("#product_total_price_"+old_num+"").attr("id", "product_total_price_"+lastValue+"").prop('disabled', false);
		$clone.find("#product_total_price_"+lastValue+"").val("").end(); 
		
		$clone.find("#saveProduct_"+old_num+"").attr("id", "saveProduct_"+lastValue+"");
		$clone.find("#saveProduct_"+lastValue+"").attr("value", "save");
		$clone.find("#saveProduct_"+lastValue+"").attr("class", "btn green");
		
		$clone.find("#addField_"+old_num+"").attr("id", "addField_"+lastValue+"");
		$clone.find("#addField_"+lastValue+"").prop('disabled', true);
		
		$(btn).attr('class', 'btn red');
		$(btn).attr('value', 'remove');
		
		$("#paymentPanel").hide();
		
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

function addPurchasePayment(btn){
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
		   url:"${pageContext.request.contextPath}/purchaseOrder/getTotalProductsInMap",
			method : "get",
			dataType : "json",
			success : function(data) {
				$("#totalProducts").text(data);
			},
			error : function() {
				swal("<spring:message code="newPurchaseOrder.Failed_to_get_Total_Products" />","", "error");
			}
		});
}

function getTotalQuantity(){
	$.ajax({
		   url:"${pageContext.request.contextPath}/purchaseOrder/getTotalProductQuantitiesInMap",
			method : "get",
			dataType : "json",
			success : function(data) {
				$("#totalQuantities").text(data);
			},
			error : function() {
				swal("<spring:message code="newPurchaseOrder.Failed_to_get_Total_quantities" />","", "error");
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
function saveWholePurchaseOrder(){
	var totalAmtBeforeDiscount = $("#tp").text();
	var discountAmt = $("#discountAmt").val();
	var totalAmtAfterDiscount = $("#ta").text();
	var paymentAmt =  $("#paymentAmt").val();
	var balanceAmt =  $("#ba").text();
	var paidMethod = $("#payingMethod").val();
	$.ajax({
		   url:"${pageContext.request.contextPath}/purchaseOrder/saveComplatePurchaseOrder/${supplier.getSupplier_id()}",
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
						  title: "purchase order saved succefully",
						  text: "",
						  type: "success",
						  showCancelButton: false,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "Ok",
						  closeOnConfirm: false
						},
						function(){
							window.location.href = "${pageContext.request.contextPath}/supplier/profile/${supplier.getSupplier_id()}";
						});
				}else{
					swal("<spring:message code="newPurchaseOrder.Uable_to_save_Purchase_Order" /> .","", "error");	
				}
			},
			error : function() {
				swal("<spring:message code="newPurchaseOrder.Failed_to_save_Purchase_Order" />","", "error");
			}
		});
}
</script>
</body>
</html>