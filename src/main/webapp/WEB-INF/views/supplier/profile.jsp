<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8" />
<title> ${supplier.getSupplier_name()}</title>
<jsp:include page="../utility/headTag.jsp" />
</head>
<!-- END HEAD -->

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-md ">
	<!-- BEGIN HEADER -->
	<jsp:include page="../utility/header.jsp" />
	<!-- END HEADER -->

	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
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
				<!-- BEGIN THEME PANEL -->

				<!-- END THEME PANEL -->
				<h1 class="page-title">
					${supplier.getSupplier_name()} 
				</h1>
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><i class="icon-home"></i> <a href="${pageContext.request.contextPath}/"><spring:message code="supplierProfile.Dashboard" /></a>
							<i class="fa fa-angle-right"></i></li>
						<li><span>${supplier.getSupplier_name()}</span></li>
					</ul>
				</div>
				<!-- END PAGE HEADER-->
				<div class="profile">
                            <div class="tabbable-line tabbable-full-width">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_1_1" data-toggle="tab"><spring:message code="supplierProfile.Supplier_Overview" /> </a>
                                    </li>
                                    <li>
                                        <a href="#tab_1_3" data-toggle="tab"><spring:message code="supplierProfile.Update_Supplier_Profile" /> </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1_1">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <ul class="list-unstyled profile-nav">
                                                     <li>
														<c:choose>
                                                           	<c:when test="${supplier.getSupplier_image_name() eq null}">
                                                                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
                                                          </c:when>
                                                          <c:otherwise>
                                                               <img src="${pageContext.request.contextPath}/supplierImages/${supplier.getSupplier_image_name()}" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
                                                          </c:otherwise>
                                                      </c:choose>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="row">
                                                   <div class="col-md-7 profile-info">
                                                        <h1 class="font-green sbold uppercase">${supplier.getSupplier_name()}</h1>
                                                        <table  class="table table-advance table-hover">
                                                        <tr><th><spring:message code="supplierProfile.Update_Supplier_Profile" />X</th><td>${supplier.getSupplier_name()}</td></tr>
                                                        <tr><th><spring:message code="supplierProfile.GENDER" /></th><td>${supplier.getSupplier_gender()}</td></tr>
                                                        <tr><th><spring:message code="supplierProfile.MOBILE_NUMBER" /></th><td>${supplier.getSupplier_mobile() }</td></tr>
                                                         <tr><th><spring:message code="supplierProfile.E_MAIL" /></th><td>${supplier.getSupplier_email() }</td></tr>
                                                        <tr><th><spring:message code="supplierProfile.ADDRESS" /></th><td> ${supplier.getSupplier_full_address() }</td></tr>
                                                        <tr><th><spring:message code="supplierProfile.LICENCE_NO" />.</th><td> ${supplier.getSupplier_licence_number() }</td></tr>
                                                        </table>
                                                       
                                                    </div>
                                                    <!--end col-md-8-->
                                                    <div class="col-md-5">
                                                        <div class="portlet sale-summary">
                                                            <div class="portlet-title">
                                                                <div class="caption font-red sbold"><spring:message code="supplierProfile.Summary" /> </div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                     <a href="${pageContext.request.contextPath}/purchaseOrder/newPurchaseOrder/${supplier.getSupplier_name()}/${supplier.getSupplier_id()}" class="btn blue btn-block"><spring:message code="supplierProfile.Create_New_Purchase_Order" /></a> 
                                                                    </li>
                                                                    	<c:set var="balanceAmtTop" value="0"></c:set>
                                                                        <c:set var="paidAmtTop" value="0"></c:set>
                                                                        <c:set var="totalAmtTop" value="0"></c:set>
                                                                        <c:forEach var="purchaseOrder" items="${supplier.getPurchaseOrders()}" >
                                                                         		<c:set var="totalAmtTop" value="${totalAmtTop+purchaseOrder.getPurchaseOrder_total_price_after_discount()}"></c:set>
	                                                                       		<c:set var="balanceAmtTop" value="${balanceAmtTop+purchaseOrder.getPurchaseOrder_balance_amount()}"></c:set>
	                                                                       		<c:set var="paidAmtTop" value="${paidAmtTop+purchaseOrder.getPurchaseOrder_paid_amount()}"></c:set>
                                                                       	</c:forEach>
                                                                     <li>
                                                                        <span class="sale-info"><spring:message code="supplierProfile.Total_Amount" />
                                                                            <i class="fa fa-img-up"></i>
                                                                        </span>
                                                                        <span class="sale-num">Rs: ${totalAmtTop}</span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="sale-info"><spring:message code="supplierProfile.Paid_Amount" /> 
                                                                            <i class="fa fa-img-up"></i>
                                                                        </span>
                                                                        <span class="sale-num">Rs: ${paidAmtTop}</span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="sale-info"><spring:message code="supplierProfile.Pending_Balance" /> 
                                                                            <i class="fa fa-img-up"></i>
                                                                        </span>
                                                                        <span class="sale-num font-red sbold">Rs: ${balanceAmtTop}</span>
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-md-4-->
                                                </div>
                                                </div>
                                                <!--end row-->
                                                <div class="row">
                                                 <div class="col-md-12">
                                                <div class="tabbable-line tabbable-custom-profile">
                                                    <ul class="nav nav-tabs">
                                                        <li class="active">
                                                            <a href="#tab_1_11" data-toggle="tab"><spring:message code="supplierProfile.Purchase_Order_Details" /></a>
                                                        </li>
                                                        
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab_1_11">
                                                            <div class="portlet-body">
                                                                <table class="table table-striped table-bordered table-advance table-hover " id="orderTable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><spring:message code="supplierProfile.Order_No" /> </th>
                                                                            <th><spring:message code="supplierProfile.Date" /> </th>
                                                                            <th><spring:message code="supplierProfile.Products" /> </th>
                                                                            <th><spring:message code="supplierProfile.Total_Amount" /></th>
                                                                            <th><spring:message code="supplierProfile.balance_amount" /></th>
                                                                            <th><spring:message code="supplierProfile.Paid_Amount" /></th>
                                                                            <th><spring:message code="supplierProfile.Add_Payment" /></th>
                                                                            <th><spring:message code="supplierProfile.View_Invoice" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                       <c:forEach var="purchaseOrder" items="${supplier.getPurchaseOrders()}" >
                                                                       		<c:set var="balanceAmtPerOrder" value="0"></c:set>
	                                                                       	<c:set var="paidAmtPerOrder" value="0"></c:set>
	                                                                       	<c:forEach var="payment" items="${purchaseOrder.getPurchasePayments()}">
	                                                                       		<c:set var="balanceAmtPerOrder" value="${payment.getPurchasePayment_balance_amount()}"></c:set>
	                                                                       		<c:set var="paidAmtPerOrder" value="${paidAmtPerOrder+payment.getPurchasePayment_paid_amount()}"></c:set>
	                                                                       	</c:forEach>
                                                                       	<tr>
                                                                       		<td>${purchaseOrder.getPurchaseOrder_number()}</td>
                                                                       		<td>${purchaseOrder.getPurchaseOrder_date()}</td>
                                                                       		<td>
	                                                                       			<c:forEach var="products" items="${purchaseOrder.getPurchaseProducts()}" >
	                                                                       				${products.getPurchaseProduct_name()}&nbsp;&nbsp;${products.getPurchaseProduct_quantity()}<br />
	                                                                       			</c:forEach>
                                                                       		</td>
                                                                       		<td>${purchaseOrder.getPurchaseOrder_total_price_after_discount()}</td>
                                                                       		<td>
                                                                       			<c:choose>
                                                                       				<c:when test="${balanceAmtPerOrder eq 0}">
                                                                       					${balanceAmtPerOrder}&nbsp;&nbsp;<span class="label label-success"><spring:message code="supplierProfile.No_Balance" />  </span>
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					${balanceAmtPerOrder}&nbsp;&nbsp;<span class="label label-danger"><spring:message code="supplierProfile.Pending" />  </span>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       		</td>
                                                                       		<td>${paidAmtPerOrder}</td>
                                                                       		<td>
                                                                       			<c:choose>
                                                                       				<c:when test="${balanceAmtPerOrder eq 0 or balanceAmtPerOrder lt 0}">
                                                                       					<input type="button" disabled="disabled" class="btn dark btn-sm btn-outline sbold uppercase" id="payment_${purchaseOrder.getPurchaseOrder_number()}" value="Add Payment" />
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					<a href="#paymentModel_${purchaseOrder.getPurchaseOrder_number()}" class="btn red btn-sm btn-outline sbold uppercase"  data-toggle="modal" ><spring:message code="supplierProfile.Add_Payment" /> </a>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       			<!--Start  Add Payment Model -->
                                                                       			<div id="paymentModel_${purchaseOrder.getPurchaseOrder_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																					 <div class="modal-header">
											                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											                                            <h4 class="modal-title"><spring:message code="supplierProfile.Dashboard" /><spring:message code="supplierProfile.Add_paying_amount_here" /></h4>
											                                        </div>
																					<div class="modal-body">
																						<table class="table table-hover table-bordered">
																							<tr>
																								<td><spring:message code="supplierProfile.Paying_Amount" /> : &nbsp;</td>
																								<td width="340">
																									<input type="text"  hidden="hidden" id="balAmt_${purchaseOrder.getPurchaseOrder_number()}" value="${balanceAmtPerOrder}" />
																									<input type="text" class="form-control" class="payingAmt" id="payAmt_${purchaseOrder.getPurchaseOrder_number()}" />
																								</td>
																							</tr>
																							<tr>
																								<td><spring:message code="supplierProfile.Paying_Method" /> : &nbsp;</td>
																								<td width="340">
																									 <select name="paidMethod" id="payMethod_${purchaseOrder.getPurchaseOrder_number()}" class="form-control " onchange="">
																							   		 	<option value="<spring:message code="supplierProfile.Cash" />"><spring:message code="supplierProfile.Cash" /></option>
																							   		 	<option value="<spring:message code="supplierProfile.Check" />"><spring:message code="supplierProfile.Check" /></option>
																							   		 	<option value="<spring:message code="supplierProfile.DD" />"><spring:message code="supplierProfile.DD" /></option>
																							   		 	<option value="<spring:message code="supplierProfile.Net_Banking_Transfer" />"><spring:message code="supplierProfile.Net_Banking_Transfer" /></option>
																							   		 	<option value="<spring:message code="supplierProfile.Mobile_App_Transfer" />"><spring:message code="supplierProfile.Mobile_App_Transfer" /></option>
																							         </select>
																								</td>
																							</tr>
																						</table>
																					</div>
																					<div class="modal-footer">
																					
																						<button type="button" data-dismiss="modal" class="btn green" id="savePaymentBtn_${purchaseOrder.getPurchaseOrder_number()}" onclick="updatePurchasePayment(this)"><spring:message code="supplierProfile.Save" /></button>
																						<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="supplierProfile.Cancel" /></button>
																					</div>
																				</div>
																				<!--End  Add Payment Model -->
                                                                       		</td>
                                                                       		<td>
                                                                       			<a href="#invoiceModel_${purchaseOrder.getPurchaseOrder_number()}" class="btn green btn-sm btn-outline sbold uppercase" data-toggle="modal"> <i class="fa fa-file-text"></i><spring:message code="supplierProfile.Invoice" />  </a>
                                                                       			
                                                                       			<!--Start  Invoice Model -->
                                                                       			<div id="invoiceModel_${purchaseOrder.getPurchaseOrder_number()}" class="modal container fade" tabindex="-1" aria-hidden="true" style="display: none; margin-top: 152.5px;">
											                                        <div class="modal-body">
											                                           <div class="invoice">
																	                        <div class="row">
																	                         <div class="col-md-6">
																	                                    <address>
																	                                        <strong><spring:message code="supplierProfile.shop_name" /> .</strong>
																	                                         <spring:message code="supplierProfile.address" />
																	                                        <br>
																	                                        <abbr title="Phone"><spring:message code="supplierProfile.Phone" />:</abbr> (234) 145-1810 
																	                                    </address>
																	                            </div>
																	                             <div class="col-md-6">
																	                                <h5><p class="text-right"> <strong><spring:message code="supplierProfile.Invoice" /> # :${purchaseOrder.getPurchaseOrder_number()} / <spring:message code="supplierProfile.Date" /> : ${purchaseOrder.getPurchaseOrder_date()}</strong></h5>
																	                                </p>
																	                            </div>
																	                        </div>
																	                        <hr>
																	                        <div class="row">
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="supplierProfile.Supplier_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li>${supplier.getSupplier_name()} </li>
																							          <li> ${supplier.getSupplier_mobile() } </li>
																							          <li>${supplier.getSupplier_full_address() }</li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="supplierProfile.Purchase_Order_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li><strong><spring:message code="supplierProfile.Order" /> # : </strong>${purchaseOrder.getPurchaseOrder_number()} </li>
																							           <li><strong><spring:message code="supplierProfile.Order_Date" /> : </strong>${purchaseOrder.getPurchaseOrder_date()}</li>
																							           <li><strong><spring:message code="supplierProfile.Order_Products" /> : </strong>${purchaseOrder.getPurchaseOrder_total_products()} </li>
																							            <li><strong><spring:message code="supplierProfile.Order_Quantities" /> : </strong>${purchaseOrder.getPurchaseOrder_total_quantities()} </li>
																							            <li><strong><spring:message code="supplierProfile.Order_Discount" /> : </strong>${purchaseOrder.getPurchaseOrder_discount()} </li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4 text-right">
																	                                <h3><spring:message code="supplierProfile.Payment_Details" /> :</h3>
																	                                <ul class="list-unstyled ">
																	                                    <li>
																	                                        <strong><spring:message code="supplierProfile.v_a_t_reg" /> # :</strong> 54255478 </li>
																	                                    <li>
																	                                        <strong><spring:message code="supplierProfile.Total_Amount" /> :</strong> ${purchaseOrder.getPurchaseOrder_total_price_after_discount()}</li>
																	                                    <li>
																	                                        <strong><spring:message code="supplierProfile.Paid_Amount" /> :</strong> ${paidAmtPerOrder} </li>
																	                                    <li>
																	                                    	<c:choose>
							                                                                       				<c:when test="${balanceAmtPerOrder eq 0}">
							                                                                       					<strong><spring:message code="supplierProfile.Balance_Amount" /> :</strong><span class="font-green-sharp bold"> ${balanceAmtPerOrder} </span>
							                                                                       				</c:when>
							                                                                       				<c:otherwise>
							                                                                       					<strong><spring:message code="supplierProfile.Balance_Amount" /> :</strong><span class="font-red-sunglo bold">${balanceAmtPerOrder}</span>
							                                                                       				</c:otherwise>
							                                                                       			</c:choose>
<%-- 																	                                        <strong>Balance Amount :</strong> ${balanceAmtPerOrder}  --%>
																	                                    </li>
																	                                </ul>
																	                            </div>
																	                        </div>
																	                         <hr>
																	                        <div class="row">
																	                            <div class="col-md-6">
																	                            <h4><spring:message code="supplierProfile.Product_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered">
																	                                    <thead>
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="supplierProfile.Item" /> </th>
																	                                            <th class=""> <spring:message code="supplierProfile.Quantity" /> </th>
																	                                            <th class=""> <spring:message code="supplierProfile.Unit_Cost_price" /> </th>
																	                                            <th> <spring:message code="supplierProfile.Total" /> </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    <c:set var="sn" value="0"></c:set>
																		                                    	<c:forEach var="products" items="${purchaseOrder.getPurchaseProducts()}" >
																		                                    	<c:set var="sn" value="${sn+1 }"></c:set>
								                                                                       				<tr>
								                                                                       					<td>${sn }</td>
								                                                                       					<td>${products.getPurchaseProduct_name()}</td>
								                                                                       					<td>${products.getPurchaseProduct_quantity()}</td>
								                                                                       					<td>${products.getPurchaseProduct_cost_price()}</td>
								                                                                       					<td>${products.getPurchaseProduct_quantity_price()}</td>
								                                                                       				</tr>
								                                                                       			</c:forEach>
																	                                    </tbody>
																	                                </table>
																	                            </div>
																	                            <div class="col-md-6">
																	                            <h4><spring:message code="supplierProfile.Payment_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered ">
																	                                    <thead>
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="supplierProfile.Total" /></th>
																	                                            <th class=""> <spring:message code="supplierProfile.Paid" /></th>
																	                                            <th class=""> <spring:message code="supplierProfile.Paid_Date" /> </th>
																	                                            <th><spring:message code="supplierProfile.Method" /></th>
																	                                             <th> <spring:message code="supplierProfile.Balance" /> </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    <c:set var="sn" value="0"></c:set>
																		                                    	<c:forEach var="paymentDetail" items="${purchaseOrder.getPurchasePayments()}" >
																		                                    	<c:set var="sn" value="${sn+1 }"></c:set>
								                                                                       				<tr>
								                                                                       					<td>${sn }</td>
								                                                                       					<td>${paymentDetail.getPurchasePayment_total_amount()}</td>
								                                                                       					<td>${paymentDetail.getPurchasePayment_paid_amount()}</td>
								                                                                       					<td>${paymentDetail.getPurchasePayment_paid_amount_date()}</td>
								                                                                       					<td>${paymentDetail.getPurchasePayment_paid_method()}</td>
								                                                                       					<td>${paymentDetail.getPurchasePayment_balance_amount()}</td>
								                                                                       				</tr>
								                                                                       			</c:forEach>
																	                                    </tbody>
																	                                </table>
																	                            </div>
																	                        </div>
																	                       <hr>
																	                    </div>
											                                        </div>
											                                        <div class="modal-footer">
											                                            <button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="supplierProfile.Close" /></button>
											                                            <button type="button" class="btn green"><spring:message code="supplierProfile.Save_changes" /></button>
											                                        </div>
											                                    </div>
											                                    <!--End  Invoice Model -->
                                                                       		</td>
                                                                       	</tr>
                                                                       </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <!--tab-pane-->
                                                        
                                                        <!--tab-pane-->
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--tab_1_2-->
                                    <div class="tab-pane" id="tab_1_3">
                                        <div class="row profile-account">
                                            <div class="col-md-3">
                                                <ul class="ver-inline-menu tabbable margin-bottom-10">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#tab_1-1">
                                                            <i class="fa fa-cog"></i> <spring:message code="supplierProfile.Personal_info" /> </a>
                                                        <span class="after"> </span>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#tab_2-2">
                                                            <i class="fa fa-picture-o"></i> <spring:message code="supplierProfile.Change_Avatar" /> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="tab-content">
                                                    <div id="tab_1-1" class="tab-pane active">
                                                        <form role="form" action="${pageContext.request.contextPath}/supplier/updateSupplier" id="updateSupplierForm" method="post" enctype="multipart/form-data">
                                                        	<input type="text" hidden="hidden" name="supplier_id" value="${supplier.getSupplier_id()}"/> 
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Full_Name" /></label>
                                                                <input type="text"  class="form-control" name="supplier_name" placeholder="${supplier.getSupplier_name()}" value="${supplier.getSupplier_name()}"/> </div>
                                                             <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Gender" /></label>
                                                                <input type="text"  class="form-control" name="supplier_gender"  placeholder="${supplier.getSupplier_gender()}" value="${supplier.getSupplier_gender()}"/> </div>
                                                            <div class="form-group">
                                                             <label class="control-label"><spring:message code="supplierProfile.E-mail" /></label>
                                                                <input type="text" class="form-control" name="supplier_email" placeholder="${supplier.getSupplier_email()}" value="${supplier.getSupplier_email()}"/> </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Mobile_Number" /></label>
                                                                <input type="text"  class="form-control" name="supplier_mobile" placeholder="${supplier.getSupplier_mobile()}"  value="${supplier.getSupplier_mobile()}"/> </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Company_store_name" /></label>
                                                                <input type="text"  class="form-control" name="supplier_company_name" placeholder="${supplier.getSupplier_company_name()}" value="${supplier.getSupplier_company_name()}"/> </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Address" /></label>
                                                                <input type="text" class="form-control" name="supplier_full_address" placeholder="${supplier.getSupplier_full_address()}"  value="${supplier.getSupplier_full_address()}"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Licence_number" /></label>
                                                                <input type="text" class="form-control" name="supplier_licence_number" placeholder="${supplier.getSupplier_licence_number()}"  value="${supplier.getSupplier_licence_number()}"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="supplierProfile.Status" /></label>
                                                                <input type="text"  class="form-control" name="supplier_status"  placeholder="${supplier.getSupplier_status()}" value="${supplier.getSupplier_status()}"/> </div>
                                                                
<!--                                                     		<div class="form-group"> -->
<!--                                                                 <label class="control-label">Gender</label> -->
<%--                                                                 <select  class="form-control" name="supplier_gender" value="${supplier.getSupplier_gender()}"> --%>
<!--                                                                 <option>Male</option> -->
<!--                                                                 <option>Female</option> -->
<!--                                                             </div> -->
 															<a href="#tab_2-2" data-toggle="tab" class="btn green" > <spring:message code="supplierProfile.Next" /> </a>
                                                    </div>
                                                    <div id="tab_2-2" class="tab-pane">
                                                            <div class="form-group">
                                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                                        <c:choose>
					                                                           	<c:when test="${supplier.getSupplier_image_name() eq null}">
					                                                                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
					                                                          </c:when>
					                                                          <c:otherwise>
					                                                               <img id="profilePicPlace" src="${pageContext.request.contextPath}/supplierImages/${supplier.getSupplier_image_name()}" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
					                                                          </c:otherwise>
					                                                      </c:choose>
                                                                     </div>
                                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                                                    <div>
                                                                        <span class="btn default btn-file">
                                                                            <span class="fileinput-new"> <spring:message code="supplierProfile.Select_image" /> </span>
                                                                            <span class="fileinput-exists"> <spring:message code="supplierProfile.Change" /> </span>
                                                                            <input type="file" name="supplier_image" > </span>
                                                                        <a href="javascript:;" class="btn default fileinput-exists" data-dismiss="fileinput"> <spring:message code="supplierProfile.Remove" /> </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a href="#webcamModal" class="btn red webcamLanchBtn" data-toggle="modal" style="margin-left: 0px; width: 300px"> <spring:message code="supplierProfile.Take_a_Picture" /></a>
				                                           <div class="modal fade container" id="webcamModal" tabindex="-1"role="basic" aria-hidden="true" data-backdrop="static">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
																	<h4 class="modal-title"><spring:message code="supplierProfile.Take_a_Picture" /></h4>
																</div>
																<div class="modal-body">
																	<div id="my_camera"></div>
																</div>
																<div class="modal-footer">
																		<input type="button" class="btn green" data-dismiss="modal"value="Take Snap"  onClick="take_snapshot()"/>
																		<button type="button" class="btn dark btn-outline"data-dismiss="modal" onClick="close_camera()"><spring:message code="supplierProfile.Close" /></button>
																</div>
															</div>
                                                            <div class="margin-top-10">
                                                                <a href="javascript:;" class="btn green" id="updateSupplierBtn"> <spring:message code="supplierProfile.Save_change" /> </a>
                                                                <a href="javascript:;" class="btn default"> <spring:message code="supplierProfile.Cancel" /> </a>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-9-->
                                        </div>
                                    </div>
                                    <!--end tab-pane-->
                                    
                                </div>
                            </div>
                        </div>
			</div>
		</div>
		<!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
            <jsp:include page="../utility/footer.jsp" />
        <!-- END FOOTER -->
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/myScript/webcam.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/myScript/supplierProfile.js" type="text/javascript"></script>

<script type="text/javascript">
function updatePurchasePayment( btn){
	var updatePurchasePaymentBtn = $(btn).attr('id');
	var purchaseOrderNumber = updatePurchasePaymentBtn.substring(updatePurchasePaymentBtn.lastIndexOf('_') + 1);
	var paidAmount = parseFloat($('#payAmt_'+purchaseOrderNumber+'').val());
	var paidMethod = $('#payMethod_'+purchaseOrderNumber+'').val();
	var balAmt = parseFloat($('#balAmt_'+purchaseOrderNumber+'').val());
	if(paidAmount > 0 && paidAmount <= balAmt){
	 	$.ajax({
			   url:"${pageContext.request.contextPath}/purchasePayment/addPurchasePayment/"+purchaseOrderNumber+"",
				method : "post",
				dataType : "json",
				data : {
					'paidAmount' : paidAmount,
					'paidMethod' : paidMethod
				},
				success : function(data) {
					if(data==="success"){
						swal({
							  title: "<spring:message code="supplierProfile.purchase_payment_update_successfully" />",
							  text: "",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok",
							  closeOnConfirm: false
							},
							function(){
								window.location.href = window.location.href;
							});
					}else{
						swal("<spring:message code="supplierProfile.Uable_to_update_purchase_payment" />.","", "error");	
					}
				},
				error : function() {
					swal("<spring:message code="supplierProfile.Uable_to_update_purchase_payment" />","", "error");
				}
			});
		
	}else{
		$('#payAmt_'+purchaseOrderNumber+'').val("");
		$('#payMethod_'+purchaseOrderNumber+'').val("Cash");
		swal("<spring:message code="supplierProfile.Check_Paying_Amount" />","<spring:message code="supplierProfile.Paying_amount_cannot_be_greater_than_balance_amount" />", "error");
	}

}

</script>
<script type="text/javascript">
$(document).ready(function() {

	$("#updateSupplierBtn").click(function(){
		var formdata = new FormData($('#updateSupplierForm')[0])
		$.ajax({
			url: "${pageContext.request.contextPath}/supplier/updateSupplier",
			method: "post",
			dataType: "json",
			data : formdata,
			async : false,
			success: function(data){
				if(data==="success"){
					swal({
						  title: "<spring:message code="supplierProfile.Success" />",
						  text: "<spring:message code="supplierProfile.Supplier_updated_successfully" />.",
						  type: "success",
						  showCancelButton: false,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "Ok, Fine",
						  closeOnConfirm: false
						},
						function(){
							window.location.href = window.location.href;
						});
				}
			},
			cache : false,
			contentType : false,
			processData : false,
			error: function(){
				swal("<spring:message code="supplierProfile.Ooops_Failed_to_update_supplier_data" />","", "error");
			}
		});
	});
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
							  title: "<spring:message code="supplierProfile.Success" />",
							  text: "<spring:message code="supplierProfile.Image_Added_successfully" />.",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok, Fine"
							});
		            	Webcam.reset();
		            }else{
		            	swal({
							  title: "<spring:message code="supplierProfile.Oops_Failed" />",
							  text: "<spring:message code="supplierProfile.Image_Not_Added_Try_again" />.",
							  type: "warning",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "<spring:message code="supplierProfile.Try_Again" />"
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