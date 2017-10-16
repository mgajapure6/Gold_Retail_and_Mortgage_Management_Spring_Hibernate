<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="www.retail.gahan.utility.*" %>
<!DOCTYPE html>

<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8" />
<title> ${customer.getCustomer_name()}</title>
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
					${customer.getCustomer_name()} 
				</h1>
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><i class="icon-home"></i> <a href="${pageContext.request.contextPath}/"><spring:message code="dashboard.dashboard" /></a>
							<i class="fa fa-angle-right"></i></li>
						<li><span>${customer.getCustomer_name()}</span></li>
					</ul>
				</div>
				<!-- END PAGE HEADER-->
				<div class="profile">
                            <div class="tabbable-line tabbable-full-width">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_1_1" data-toggle="tab"><spring:message code="cusomerProfile.Customer_Overview" /> </a>
                                    </li>
                                    <li>
                                        <a href="#tab_1_3" data-toggle="tab"><spring:message code="cusomerProfile.Update_Customer_Profile" /> </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1_1">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <ul class="list-unstyled profile-nav">
                                                     <li>
														<c:choose>
                                                           	<c:when test="${customer.getCustomer_image_name() eq null}">
                                                                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
                                                          </c:when>
                                                          <c:otherwise>
                                                               <img src="${pageContext.request.contextPath}/customerImages/${customer.getCustomer_image_name()}" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
                                                          </c:otherwise>
                                                      </c:choose>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="row">
                                                   <div class="col-md-7 profile-info">
                                                        <h1 class="font-green sbold uppercase">${customer.getCustomer_name()}</h1>
                                                        <table  class="table table-advance table-hover">
                                                        <tr><th><spring:message code="cusomerProfile.FULL_NAME" /></th><td>${customer.getCustomer_name()}</td></tr>
                                                        <tr><th><spring:message code="cusomerProfile.GENDER" /></th><td>${customer.getCustomer_gender()}</td></tr>
                                                        <tr><th><spring:message code="cusomerProfile.MOBILE_NUMBER" /></th><td>${customer.getCustomer_mobile() }</td></tr>
                                                         <tr><th><spring:message code="cusomerProfile.E-MAIL" /></th><td>${customer.getCustomer_email() }</td></tr>
                                                        <tr><th><spring:message code="cusomerProfile.ADDRESS" /></th><td> ${customer.getCustomer_full_address() }</td></tr>
                                                        </table>
                                                       
                                                    </div>
                                                    <!--end col-md-8-->
                                                    <div class="col-md-5">
                                                        <div class="portlet sale-summary">
                                                            <div class="portlet-title">
                                                                <div class="caption font-red sbold"><spring:message code="cusomerProfile.Actions" /> </div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                     <a href="${pageContext.request.contextPath}/salesOrder/newSalesOrder/${customer.getCustomer_name()}/${customer.getCustomer_id()}" class="btn blue btn-block"><spring:message code="cusomerProfile.Add_New_Sales_Order" /></a> 
                                                                    </li>
                                                                    <li>
                                                                     <a href="${pageContext.request.contextPath}/gahan/newGahan/${customer.getCustomer_name()}/${customer.getCustomer_id()}" class="btn red btn-block"><spring:message code="cusomerProfile.Add_New_Gahan" /></a> 
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
                                                            <a href="#tab_1_11" data-toggle="tab"><spring:message code="cusomerProfile.Sales_Order_Details" /></a>
                                                        </li>
                                                        <li>
                                                            <a href="#tab_1_22" data-toggle="tab"><spring:message code="cusomerProfile.Gahan_Detail" />  </a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab_1_11">
                                                            <div class="portlet-body">
                                                            	<c:set var="balanceAmtTop" value="0"></c:set>
                                                                <c:set var="paidAmtTop" value="0"></c:set>
                                                                <c:set var="totalAmtTop" value="0"></c:set>
                                                                <c:forEach var="salesOrder" items="${customer.getSalesOrders()}" >
                                                                 		<c:set var="totalAmtTop" value="${totalAmtTop+salesOrder.getSalesOrder_total_price_after_discount()}"></c:set>
                                                                		<c:set var="balanceAmtTop" value="${balanceAmtTop+salesOrder.getSalesOrder_balance_amount()}"></c:set>
                                                                		<c:set var="paidAmtTop" value="${paidAmtTop+salesOrder.getSalesOrder_paid_amount()}"></c:set>
                                                               	</c:forEach>
                                                            
                                                            	<div class="row">
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-comments"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number">
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${totalAmtTop}">0</span>
											                                    </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Total_Amount" /></div>
											                                </div>
											                            </a>
											                        </div>
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 green" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-bar-chart-o"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number">
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${paidAmtTop}">0</span> </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Paid_Amount" /> </div>
											                                </div>
											                            </a>
											                        </div>
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 red" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-globe"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number"> +
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${balanceAmtTop}"></span> </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Pending_Balance" /></div>
											                                </div>
											                            </a>
											                        </div>
											                    </div>
                                                                <table class="table table-striped table-bordered table-advance table-hover " id="orderTable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><spring:message code="cusomerProfile.Order_No" />. </th>
                                                                            <th><spring:message code="cusomerProfile.Date" /> </th>
                                                                            <th><spring:message code="cusomerProfile.Products" /> </th>
                                                                            <th><spring:message code="cusomerProfile.Total_Amount" /></th>
                                                                            <th><spring:message code="cusomerProfile.Balance_Amount" /></th>
                                                                            <th><spring:message code="cusomerProfile.Paid_Amount" /></th>
                                                                            <th><spring:message code="cusomerProfile.Add_Payment" /></th>
                                                                            <th><spring:message code="cusomerProfile.View_Invoice" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                       <c:forEach var="salesOrder" items="${customer.getSalesOrders()}" >
                                                                       		<c:set var="balanceAmtPerOrder" value="0"></c:set>
	                                                                       	<c:set var="paidAmtPerOrder" value="0"></c:set>
	                                                                       	<c:forEach var="payment" items="${salesOrder.getSalesPayments()}">
	                                                                       		<c:set var="balanceAmtPerOrder" value="${payment.getSalesPayment_balance_amount()}"></c:set>
	                                                                       		<c:set var="paidAmtPerOrder" value="${paidAmtPerOrder+payment.getSalesPayment_paid_amount()}"></c:set>
	                                                                       	</c:forEach>
                                                                       	<tr>
                                                                       		<td>${salesOrder.getSalesOrder_number()}</td>
                                                                       		<td>${salesOrder.getSalesOrder_date()}</td>
                                                                       		<td>
	                                                                       			<c:forEach var="products" items="${salesOrder.getSalesProducts()}" >
	                                                                       				${products.getSales_product_name()}&nbsp;&nbsp;${products.getSales_product_quantity()} &nbsp;&nbsp; <a href="#viewOrderProductModel_${salesOrder.getSalesOrder_number()}_${products.getSales_product_name()}_${products.getSales_product_quantity()}" data-toggle="modal"><spring:message code="cusomerProfile.View" /></a><br />
	                                                                       				<div id="viewOrderProductModel_${salesOrder.getSalesOrder_number()}_${products.getSales_product_name()}_${products.getSales_product_quantity()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																							 <div class="modal-header">
													                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
													                                            <h4 class="modal-title"><spring:message code="cusomerProfile.OrderProductImage" />.</h4>
													                                        </div>
																							<div class="modal-body">
																								<table class="table table-hover table-bordered">
																									<tr>
																										<th><spring:message code="cusomerProfile.OrderProductImage" /></th>
																										<th><spring:message code="cusomerProfile.OrderProductName" /></th>
																										<th><spring:message code="cusomerProfile.OrderProductQuantity" /></th>
																									</tr>
																									<tr>
																										<td>
																											<c:choose>
																														<c:when test="${products.getSales_product_image_name() eq null}">
																															<img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-circle" alt=""  style="width: 100px; height: 100px"id="gproduct_image_1" /></td>
																														</c:when>
																														<c:otherwise>
																															<img src="${pageContext.request.contextPath}/salesProductImages/${products.getSales_product_image_name()}" class="img-circle" alt=""  style="width: 100px; height: 100px"id="gproduct_image" /></td>
																														</c:otherwise>
																													</c:choose>
																										</td>
																										<td>${products.getSales_product_name()}</td>
																										<td>${products.getSales_product_quantity()}</td>
																									</tr>
																								</table>
																							</div>
																							<div class="modal-footer">
																								<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
																							</div>
																						</div>
	                                                                       			</c:forEach>
                                                                       		</td>
                                                                       		<td>${salesOrder.getSalesOrder_total_price_after_discount()}</td>
                                                                       		<td>
                                                                       			<c:choose>
                                                                       				<c:when test="${balanceAmtPerOrder eq 0}">
                                                                       					${balanceAmtPerOrder}&nbsp;&nbsp;<span class="label label-success"><spring:message code="cusomerProfile.No_Balance" />  </span>
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					${balanceAmtPerOrder}&nbsp;&nbsp;<span class="label label-danger"><spring:message code="cusomerProfile.Pending" />  </span>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       		</td>
                                                                       		<td>${paidAmtPerOrder}</td>
                                                                       		<td>
                                                                       			<c:choose>
                                                                       				<c:when test="${balanceAmtPerOrder eq 0 or balanceAmtPerOrder lt 0}">
                                                                       					<input type="button" disabled="disabled" class="btn dark btn-sm btn-outline sbold uppercase" id="payment_${salesOrder.getSalesOrder_number()}" value="Add Payment" />
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					<a href="#paymentModel_${salesOrder.getSalesOrder_number()}" class="btn red btn-sm btn-outline sbold uppercase"  data-toggle="modal" > <spring:message code="cusomerProfile.Add_Payment" /></a>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       			<!--Start  Add Payment Model -->
                                                                       			<div id="paymentModel_${salesOrder.getSalesOrder_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																					 <div class="modal-header">
											                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											                                            <h4 class="modal-title"><spring:message code="cusomerProfile.Add_paying_amount_here" />.</h4>
											                                        </div>
																					<div class="modal-body">
																						<table class="table table-hover table-bordered">
																							<tr>
																								<td><spring:message code="cusomerProfile.Paying_Amount" /> : &nbsp;</td>
																								<td width="340">
																									<input type="text"  hidden="hidden" id="balAmt_${salesOrder.getSalesOrder_number()}" value="${balanceAmtPerOrder}" />
																									<input type="text" class="form-control" class="payingAmt" id="payAmt_${salesOrder.getSalesOrder_number()}" />
																								</td>
																							</tr>
																							<tr>
																								<td><spring:message code="cusomerProfile.Paying_Method" /> : &nbsp;</td>
																								<td width="340">
																									 <select name="paidMethod" id="payMethod_${salesOrder.getSalesOrder_number()}" class="form-control " onchange="">
																							   		 	<option value="Cash"><spring:message code="cusomerProfile.Cash" /></option>
																							   		 	<option value="Check"><spring:message code="cusomerProfile.Check" /></option>
																							   		 	<option value="DD"><spring:message code="cusomerProfile.DD" /></option>
																							   		 	<option value="Online Net Banking Transfer"><spring:message code="cusomerProfile.Net_Banking_Transfer" /></option>
																							   		 	<option value="Mobile App Transfer"><spring:message code="cusomerProfile.Mobile_App_Transfer" /></option>
																							         </select>
																								</td>
																							</tr>
																						</table>
																					</div>
																					<div class="modal-footer">
																					
																						<button type="button" data-dismiss="modal" class="btn green" id="savePaymentBtn_${salesOrder.getSalesOrder_number()}" onclick="updateSalesPayment(this)"><spring:message code="cusomerProfile.Save" /></button>
																						<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
																					</div>
																				</div>
																				<!--End  Add Payment Model -->
                                                                       		</td>
                                                                       		<td>
                                                                       			<a href="#invoiceModel_${salesOrder.getSalesOrder_number()}" class="btn green btn-sm btn-outline sbold uppercase" data-toggle="modal"> <i class="fa fa-file-text"></i><spring:message code="cusomerProfile.Invoice" /> </a>
                                                                       			
                                                                       			<!--Start  Invoice Model -->
                                                                       			<div id="invoiceModel_${salesOrder.getSalesOrder_number()}" class="modal container fade printBill" tabindex="-1" aria-hidden="true" style="display: none; margin-top: 152.5px;">
											                                        <div class="modal-body">
											                                           <div class="invoice">
																	                        <div class="row">
																	                         <div class="col-md-6">
																	                                    <address>
																	                                        <strong>Ashish Jewellers .</strong>
																	                                         Lakhandur, Dist: Bhandara, MH.
																	                                        <br>
																	                                        <abbr title="Phone"><spring:message code="cusomerProfile.Phone" />:</abbr> (234) 145-1810 
																	                                    </address>
																	                            </div>
																	                             <div class="col-md-6">
																	                                <h5><p class="text-right"> <strong><spring:message code="cusomerProfile.Invoice" /> # :${salesOrder.getSalesOrder_number()} / <spring:message code="cusomerProfile.Date" /> : ${salesOrder.getSalesOrder_date()}</strong></h5>
																	                                </p>
																	                            </div>
																	                        </div>
																	                        <hr>
																	                        <div class="row">
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="cusomerProfile.Customer_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li>${customer.getCustomer_name()} </li>
																							          <li> ${customer.getCustomer_mobile() } </li>
																							          <li>${customer.getCustomer_full_address() }</li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="cusomerProfile.Sales_Order_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li><strong><spring:message code="cusomerProfile.Order" /> # : </strong>${salesOrder.getSalesOrder_number()} </li>
																							           <li><strong><spring:message code="cusomerProfile.Order_Date" /> : </strong>${salesOrder.getSalesOrder_date()}</li>
																							           <li><strong><spring:message code="cusomerProfile.Order_Products" /> : </strong>${salesOrder.getSalesOrder_total_products()} </li>
																							            <li><strong><spring:message code="cusomerProfile.Order_Quantities" /> : </strong>${salesOrder.getSalesOrder_total_quantities()} </li>
																							            <li><strong><spring:message code="cusomerProfile.Order_Discount" /> : </strong>${salesOrder.getSalesOrder_discount()} </li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4 text-right">
																	                                <h3><spring:message code="cusomerProfile.Payment_Details" /> :</h3>
																	                                <ul class="list-unstyled ">
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.v.a.t._reg" /> # :</strong> 54255478 </li>
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.Total_Amount" /> :</strong> ${salesOrder.getSalesOrder_total_price_after_discount()}</li>
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.Paid_Amount" /> :</strong> ${paidAmtPerOrder} </li>
																	                                    <li>
																	                                    	<c:choose>
							                                                                       				<c:when test="${balanceAmtPerOrder eq 0}">
							                                                                       					<strong><spring:message code="cusomerProfile.Balance_Amount" /> :</strong><span class="font-green-sharp bold"> ${balanceAmtPerOrder} </span>
							                                                                       				</c:when>
							                                                                       				<c:otherwise>
							                                                                       					<strong><spring:message code="cusomerProfile.Balance_Amount" /> :</strong><span class="font-red-sunglo bold">${balanceAmtPerOrder}</span>
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
																	                            <h4><spring:message code="cusomerProfile.Product_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered">
																	                                    <thead>
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="cusomerProfile.Item" /> </th>
																	                                            <th class=""><spring:message code="cusomerProfile.Quantity" />  </th>
																	                                            <th class=""> <spring:message code="cusomerProfile.Unit_Cost_price" /> </th>
																	                                            <th> <spring:message code="cusomerProfile.Total" /> </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    <c:set var="sn" value="0"></c:set>
																		                                    	<c:forEach var="products" items="${salesOrder.getSalesProducts()}" >
																		                                    	<c:set var="sn" value="${sn+1 }"></c:set>
								                                                                       				<tr>
								                                                                       					<td>${sn }</td>
								                                                                       					<td>${products.getSales_product_name()}</td>
								                                                                       					<td>${products.getSales_product_quantity()}</td>
								                                                                       					<td>${products.getSales_product_price()}</td>
								                                                                       					<td>${products.getSales_product_quantity_price()}</td>
								                                                                       				</tr>
								                                                                       			</c:forEach>
																	                                    </tbody>
																	                                </table>
																	                            </div>
																	                            <div class="col-md-6">
																	                            	<h4><spring:message code="cusomerProfile.Payment_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered">
																	                                    <thead>
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="cusomerProfile.Paid_Amount" /> </th>
																	                                            <th class=""><spring:message code="cusomerProfile.Paid_Date" />  </th>
																	                                            <th class=""> <spring:message code="cusomerProfile.Paid_Method" /> </th>
																	                                            <th> <spring:message code="cusomerProfile.Balance_Amount" /> </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    <c:set var="sn" value="0"></c:set>
																		                                    	<c:forEach var="payment" items="${salesOrder.getSalesPayments()}" >
																		                                    	<c:set var="sn" value="${sn+1 }"></c:set>
								                                                                       				<tr>
								                                                                       					<td>${sn }</td>
								                                                                       					<td>${payment.getSalesPayment_paid_amount()}</td>
								                                                                       					<td>${payment.getSalesPayment_paid_amount_date()}</td>
								                                                                       					<td>${payment.getSalesPayment_paid_method()}</td>
								                                                                       					<td>${payment.getSalesPayment_balance_amount()}</td>
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
											                                            <button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Close" /></button>
											                                            <button class="btn green btn-outline sbold right printBtn">Print</button>
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
                                                        <div class="tab-pane" id="tab_1_22">
                                                            <div class="tab-pane active" id="tab_1_1_1">
                                                            <c:set var="totalWithdrawalAmtGahan" value="0"></c:set>
                                                            <c:set var="totalPaidGahan" value="0"></c:set>
                                                            <c:set var="totalPendingGahan" ></c:set>
                                                            <c:forEach var="gahanData" items="${customer.getGahans()}">
                                                            <c:forEach var="paymentGahan" items="${gahanData.getGahanPayments() }">
                                                            	<c:set var="totalWithdrawalAmtGahan" value="${gahanData.getGahan_widthdraw_money()}"></c:set>
                                                            	<c:set var="totalPaidGahan" value="${totalPaidGahan+paymentGahan.getGp_paid_amount() }"></c:set>
                                                            	<c:set var="totalPendingGahan" value="${paymentGahan.getGp_total_pending_amount() }"></c:set>
                                                            </c:forEach>
                                                            </c:forEach>
                                                            <div class="row">
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-comments"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number">
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${totalWithdrawalAmtGahan }">0</span>
											                                    </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Total_Withdrawal_Amount" /></div>
											                                </div>
											                            </a>
											                        </div>
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 green" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-bar-chart-o"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number">
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${totalPaidGahan}">0</span> </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Paid_Amount" /> </div>
											                                </div>
											                            </a>
											                        </div>
											                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											                            <a class="dashboard-stat dashboard-stat-v2 red" href="#">
											                                <div class="visual">
											                                    <i class="fa fa-globe"></i>
											                                </div>
											                                <div class="details">
											                                    <div class="number"> +
											                                        <spring:message code="cusomerProfile.Rs" /> <span data-counter="counterup" data-value="${totalPendingGahan}"></span> </div>
											                                    <div class="desc"> <spring:message code="cusomerProfile.Pending_Balance" /></div>
											                                </div>
											                            </a>
											                        </div>
											                    </div>
                                                               <table class="table table-striped table-bordered table-hover dt-responsive dataTable no-footer dtr-column collapsed " id="gahanTable">
                                                               	 <thead>
                                                                        <tr>
                                                                            <th class="all"><spring:message code="cusomerProfile.Gahan_No" />. </th>
                                                                            <th class="all"><spring:message code="cusomerProfile.Gahan_Date" /> </th>
                                                                            <th class="all"><spring:message code="cusomerProfile.Gahan_Products" /> </th>
                                                                            <th class="all"><spring:message code="cusomerProfile.Gahan_net_weight" /></th>
                                                                            <th class="none"><spring:message code="cusomerProfile.Gahan_Last_date" /></th>
                                                                            <th class="all"><spring:message code="cusomerProfile.Gahan_withdrawal_money" /></th>
                                                                             <th class="all"><spring:message code="cusomerProfile.Interest_amount" /></th>
                                                                             <th class="all"><spring:message code="cusomerProfile.Total_Balance_with_Interest" /></th>
                                                                             <th class="all"><spring:message code="cusomerProfile.Add_Payment" /></th>
                                                                            <th class="all"><spring:message code="cusomerProfile.View_Invoice" /></th>
                                                                            <th class="all"><spring:message code="cusomerProfile.Active_Inactive" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    	<c:set var="interestAmount" value="${gahanData.getGahan_making_date() }"></c:set>
                                                                    	<c:forEach var="gahanData" items="${customer.getGahans()}">
                                                                    		<tr>
                                                                    			<td class="all">${gahanData.getGahan_number() }</td>
                                                                    			<td class="all">${gahanData.getGahan_making_date() }</td>
                                                                    			<td>${gahanData.getGahan_total_products() }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#viewGahanProductModel_${gahanData.getGahan_number()}" class="" data-toggle="modal"> <spring:message code="cusomerProfile.View" /></</a>
		                                                                    			<!--Start  Add Payment Model -->
		                                                                       			<div id="viewGahanProductModel_${gahanData.getGahan_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																							 <div class="modal-header">
													                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
													                                            <h4 class="modal-title"><spring:message code="cusomerProfile.Gahan_Products" /></h4>
													                                        </div>
																							<div class="modal-body">
																								<table class="table table-hover table-bordered">
																									<thead>
																										<tr>
																											<th>#</th>
																											<th><spring:message code="cusomerProfile.Gahan_Products_image" /></th>
																											<th><spring:message code="cusomerProfile.Gahan_Products_name" /></th>
																											<th><spring:message code="cusomerProfile.Gahan_Products_net_weight" /></th>
																										</tr>
																									</thead>
																									<tbody>
																										<c:set var="sn" value="0"></c:set>
																										<c:forEach var="gproducts" items="${gahanData.getGahanProducts()}">
																										<c:set var="sn" value="${sn+1}"></c:set>
																											<tr>
																												<td>${sn }</td>
																												<td>
																													<c:choose>
																														<c:when test="${gproducts.getGp_image_name() eq null}">
																															<img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-circle" alt=""  style="width: 100px; height: 100px"id="gproduct_image_1" /></td>
																														</c:when>
																														<c:otherwise>
																															<img src="${pageContext.request.contextPath}/gahanProductImages/${gproducts.getGp_image_name()}" class="img-circle" alt=""  style="width: 100px; height: 100px"id="gproduct_image" /></td>
																														</c:otherwise>
																													</c:choose>
																												
																												<td>${gproducts.getGahanProduct_name()}</td>
																												<td>${gproducts.getGahanProduct_net_weight()}</td>
																											</tr>
																										</c:forEach>
																									</tbody>
																								</table>
																							</div>
																							<div class="modal-footer">
																								<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
																							</div>
																						</div>
                                                                    			</td>
                                                                    			<td>${gahanData.getGahanProducts_total_net_weight() }</td>
                                                                    			<td>${gahanData.getGahan_money_deposit_last_date() }</td>
                                                                    			<td class="all">${gahanData.getGahan_widthdraw_money() }</td>
                                                                    			<td class="all">
                                                                    						<c:set var="amount" value="${gahanData.getGahan_widthdraw_money() }"></c:set>
                                                                    						<c:set var="ir" value="${gahanData.getGahan_interest_rate() }"></c:set>
                                                                    						<c:set var="pa" value="0"></c:set>
                                                                    						<c:set var="previousBalance" value="0"></c:set>
                                                                    						<c:set var="balanceAmt" value="0"></c:set>
                                                                    						<c:forEach var="payment" items="${gahanData.getGahanPayments() }">
                                                                    							<c:set var="pa" value="${pa+payment.getGp_paid_amount() }"></c:set>
                                                                    							<c:set var="previousBalance" value="${payment.getPreBalance_of_ia()}"></c:set>
                                                                    							<c:set var="lastPaidDate" value="${payment.getGp_paid_amount_date() }"></c:set>
                                                                    							<c:set var="pendBalance" value="${payment.getGp_total_pending_amount() }"></c:set>
                                                                    							<c:set var="balanceAmt" value="${payment.getGp_total_pending_amount() }"></c:set>
                                                                    						</c:forEach>
                                                                    						
                                                                    						<%
	                                                                    							Double amount = (Double)pageContext.getAttribute("amount");
	                                                                    							Double ir = (Double)pageContext.getAttribute("ir");
	                                                                    							String lastPaidDate = (String)pageContext.getAttribute("lastPaidDate");
	                                                                    							String  todaysDate = DateFormate.dateToString(new Date());
	                                                                    							Integer days=DateFormate.numberOfDaysBetweenTwoDates(lastPaidDate, todaysDate);
	                                                                    							Double pa = (Double)pageContext.getAttribute("pa");
	                                                                    							Double previousBalance = (Double)pageContext.getAttribute("previousBalance");
	                                                                    							Double perDayInterest = ir/30;
	                                                                    							Double balanceAmt = (Double)pageContext.getAttribute("pendBalance");
	                                                                    							if(balanceAmt <= 0){
	                                                                    								out.print(0.0);
		                                                                    							pageContext.setAttribute("interestAmount", 0.0);
	                                                                    							}else{
	                                                                    								Double countInterest = ((days*perDayInterest)/100*amount)+previousBalance;
		                                                                    							out.print(Math.floor((countInterest*100)/100 ));
		                                                                    							pageContext.setAttribute("interestAmount", Math.floor((countInterest*100)/100));
	                                                                    							}
                                                                    						%>
                                                                    			</td>
                                                                    			<td class="all">${gahanData.getGahan_widthdraw_money()+ interestAmount}</td>
                                                                    			<td class="all">
                                                                       			<c:choose>
                                                                       				<c:when test="${pendBalance eq 0 or pendBalance lt 0}">
                                                                       					<input type="button" disabled="disabled" class="btn dark btn-sm btn-outline sbold uppercase" id="gpayment_${gahanData.getGahan_number()}" value="<spring:message code="cusomerProfile.Add_Payment" />" />
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					<a href="#gpaymentModel_${gahanData.getGahan_number()}" class="btn red btn-sm btn-outline sbold uppercase"  data-toggle="modal" > <spring:message code="cusomerProfile.Add_Payment" /></a>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       			<!--Start  Add Payment Model -->
                                                                       			<div id="gpaymentModel_${gahanData.getGahan_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																					 <div class="modal-header">
											                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											                                            <h4 class="modal-title"><spring:message code="cusomerProfile.Add_paying_amount_here" /> for ${gahanData.getGahan_number()}.</h4>
											                                        </div>
																					<div class="modal-body">
																						<table class="table table-hover table-bordered">
																							<tr>
																								<td><spring:message code="cusomerProfile.Paying_Amount" /> : &nbsp;</td>
																								<td width="340">
																									<input type="text" hidden="hidden" id="withdrawalAmt_${gahanData.getGahan_number()}" value="${gahanData.getGahan_widthdraw_money() }"/>
																									<input type="text" hidden="hidden" id="interestAmt_${gahanData.getGahan_number()}" value="${interestAmount}"/>
																									<input type="text" class="form-control" class="payingAmt" id="gpayAmt_${gahanData.getGahan_number()}" />
																								</td>
																							</tr>
																							<tr>
																								<td><spring:message code="cusomerProfile.Paying_Method" /> : &nbsp;</td>
																								<td width="340">
																									 <select name="paidMethod" id="gpayMethod_${gahanData.getGahan_number()}" class="form-control " onchange="">
																							   		 	<option value="Cash"><spring:message code="cusomerProfile.Cash" /></option>
																							   		 	<option value="Check"><spring:message code="cusomerProfile.Check" /></option>
																							   		 	<option value="DD"><spring:message code="cusomerProfile.DD" /></option>
																							   		 	<option value="Online Net Banking Transfer"><spring:message code="cusomerProfile.Net_Banking_Transfer" /></option>
																							   		 	<option value="Mobile App Transfer"><spring:message code="cusomerProfile.Mobile_App_Transfer" /></option>
																							         </select>
																								</td>
																							</tr>
																						</table>
																					</div>
																					<div class="modal-footer">
																					
																						<button type="button" data-dismiss="modal" class="btn green" id="saveGPaymentBtn_${gahanData.getGahan_number()}" onclick="updateGahanPayment(this)"><spring:message code="cusomerProfile.Save" /></button>
																						<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
																					</div>
																				</div>
																				<!--End  Add Payment Model -->
                                                                       		</td>
                                                                       		<td class="all">
                                                                       			<a href="#ginvoiceModel_${gahanData.getGahan_number()}" class="btn green btn-sm btn-outline sbold uppercase" data-toggle="modal"> <i class="fa fa-file-text"></i><spring:message code="cusomerProfile.Invoice" /> </a>
                                                                       			
                                                                       			<!--Start  Invoice Model -->
                                                                       			<div id="ginvoiceModel_${gahanData.getGahan_number()}" class="modal container fade printBill" tabindex="-1" data-backdrop="static" aria-hidden="true" style="display: none; margin-top: 152.5px;">
											                                        <div class="modal-body">
											                                           <div class="invoice">
																	                        <div class="row">
																	                         <div class="col-md-6">
																	                                    
																	                            </div>
																	                             <div class="col-md-6">
																	                                <h5><p class="text-right"> <strong><spring:message code="cusomerProfile.Invoice" /> # :${gahanData.getGahan_number()} / <spring:message code="cusomerProfile.Date" /> : ${gahanData.getGahan_making_date()}</strong></h5>
																	                                </p>
																	                            </div>
																	                        </div>
																	                        <hr>
																	                        <div class="row">
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="cusomerProfile.Customer_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li>${customer.getCustomer_name()} </li>
																							          <li> ${customer.getCustomer_mobile() } </li>
																							          <li>${customer.getCustomer_full_address() }</li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4">
																	                                <h3><spring:message code="cusomerProfile.Gahan_Info" /> :</h3>
																	                                <ul class="list-unstyled">
																	                                  <li><strong><spring:message code="cusomerProfile.Gahan_num" />  : </strong>${gahanData.getGahan_number()} </li>
																							           <li><strong><spring:message code="cusomerProfile.Gahan_Date" /> : </strong>${gahanData.getGahan_making_date() }</li>
																							           <li><strong><spring:message code="cusomerProfile.Gahan_total_products" /> : </strong>${gahanData.getGahan_total_products() }</li>
																							            <li><strong><spring:message code="cusomerProfile.Gahan_net_weight" /> : </strong>${gahanData.getGahanProducts_total_net_weight() }</li>
																	                                </ul>
																	                            </div>
																	                            <div class="col-md-4 text-right">
																	                                <h3><spring:message code="cusomerProfile.Payment_Details" /> :</h3>
																	                                <ul class="list-unstyled ">
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.Gahan_withdrawal_money" /> :</strong> ${gahanData.getGahan_widthdraw_money() } </li>
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.Interest_rate" /> :</strong> ${gahanData.getGahan_interest_rate() }</li>
																	                                    <li>
																	                                        <strong><spring:message code="cusomerProfile.Total_paid_Amount" /> :</strong> 
																	                                        	<c:set var="totalPaidAmount" value="0"></c:set>
																	                                        	<c:forEach var="payment" items="${gahanData.getGahanPayments()}">
																	                                        		<c:set var="totalPaidAmount" value="${ totalPaidAmount+payment.getGp_paid_amount()}"></c:set>
																	                                        	</c:forEach>
																	                                        	${totalPaidAmount }
																	                                    </li>
																	                                </ul>
																	                            </div>
																	                        </div>
																	                         <hr>
																	                        <div class="row">
																	                            <div class="col-md-6">
																	                            <h4><spring:message code="cusomerProfile.Product_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered">
																	                                    <thead>
																	                                    	
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="cusomerProfile.ProductName" /> </th>
																	                                            <th><spring:message code="cusomerProfile.ProductWeight" /></th>
																	                                           <th><spring:message code="cusomerProfile.ProductNetWeight" />  </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    	<c:set var="sn" value="0"></c:set>
																	                                    	<c:forEach var="product" items="${gahanData.getGahanProducts()}">
																	                                    	<c:set var="sn" value="${sn+1}"></c:set>
																	                                        	<tr>
																	                                        		<th>${sn}</th>
																	                                        		<th>${product.getGahanProduct_name()}</th>
																	                                        		
																	                                        		<th>${product.getGahanProduct_weight()}</th>
																	                                        		<th>${product.getGahanProduct_net_weight()}</th>
																	                                        	</tr>
																	                                        </c:forEach>
																	                                        
																	                                    </tbody>
																	                                </table>
																	                            </div>
																	                            
																	                            <div class="col-md-6">
																	                            <h4><spring:message code="cusomerProfile.Payment_History" /></h4>
																	                                <table class="table table-striped table-hover table-bordered">
																	                                    <thead>
																	                                    	
																	                                        <tr>
																	                                            <th> # </th>
																	                                            <th> <spring:message code="cusomerProfile.Interest_amount" /> </th>
																	                                            <th><spring:message code="cusomerProfile.Total_Balance_with_Interest" /></th>
																	                                           <th><spring:message code="cusomerProfile.Paid_amount" />  </th>
																	                                            <th> <spring:message code="cusomerProfile.Paid_date" /> </th>
																	                                             <th> <spring:message code="cusomerProfile.Pending_balance" /> </th>
																	                                        </tr>
																	                                    </thead>
																	                                    <tbody>
																	                                    	<c:set var="sn" value="0"></c:set>
																	                                    	<c:forEach var="payment" items="${gahanData.getGahanPayments()}">
																	                                    	<c:set var="sn" value="${sn+1}"></c:set>
																	                                        	<tr>
																	                                        		<th>${sn}</th>
																	                                        		<th>${payment.getGp_i_amt_from_last_paid_date()}</th>
																	                                        		<th>
																	                                        			<c:choose>
																	                                        				<c:when test="${payment.getGp_i_amt_from_last_paid_date() eq 0}">
																	                                        					${gahanData.getGahan_widthdraw_money()}
																	                                        				</c:when>
																	                                        				<c:otherwise>
																	                                        					${gahanData.getGahan_widthdraw_money()+payment.getGp_i_amt_from_last_paid_date() }
																	                                        				</c:otherwise>
																	                                        			</c:choose> 
																	                                        		</th>
																	                                        		<th>${payment.getGp_paid_amount()}</th>
																	                                        		<th>${payment.getGp_paid_amount_date()}</th>
																	                                        		<th>${payment.getGp_total_pending_amount()}</th>
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
											                                            <button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Close" /></button>
											                                            <button class="btn green btn-outline sbold right printBtn">Print</button>
											                                        </div>
											                                    </div>
											                                    <!--End  Invoice Model -->
                                                                       		</td>
                                                                       		<td>
                                                                       			<c:choose>
                                                                       				<c:when test="${balanceAmt eq 0}">
                                                                       					<button type="button" d class="btn black btn-sm" id="inactive_${gahanData.getGahan_number()}" onclick="makeInactive(this)"><spring:message code="cusomerProfile.Inactive" /></button>
                                                                       				</c:when>
                                                                       				<c:otherwise>
                                                                       					<input type="button" class="btn red btn-sm" value="<spring:message code="cusomerProfile.Active" />" disabled="disabled"></button>
                                                                       				</c:otherwise>
                                                                       			</c:choose>
                                                                       		</td>
                                                                    		</tr>
                                                                    	</c:forEach>
                                                                    </tbody>
                                                               </table>
                                                            </div>
                                                        </div>
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
                                                            <i class="fa fa-cog"></i> <spring:message code="cusomerProfile.Personal_info" /> </a>
                                                        <span class="after"> </span>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#tab_2-2">
                                                            <i class="fa fa-picture-o"></i> <spring:message code="cusomerProfile.Change_Avatar" /> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="tab-content">
                                                    <div id="tab_1-1" class="tab-pane active">
                                                        <form role="form" action="${pageContext.request.contextPath}/customer/updateCustomer" id="updateCustomerForm" method="post" enctype="multipart/form-data">
                                                        	<input type="text" hidden="hidden" name="customer_id" value="${customer.getCustomer_id()}"/> 
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="cusomerProfile.Full_Name" /></label>
                                                                <input type="text"  class="form-control" name="customer_name" placeholder="${customer.getCustomer_name()}" value="${customer.getCustomer_name()}"/> </div>
                                                             <div class="form-group">
                                                                <label class="control-label"><spring:message code="cusomerProfile.Gender" /></label>
                                                                <input type="text"  class="form-control" name="customer_gender"  placeholder="${customer.getCustomer_gender()}" value="${customer.getCustomer_gender()}"/> </div>
                                                            <div class="form-group">
                                                             <label class="control-label"><spring:message code="cusomerProfile.E-mail" /></label>
                                                                <input type="text" class="form-control" name="customer_email" placeholder="${customer.getCustomer_email()}" value="${customer.getCustomer_email()}"/> </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="cusomerProfile.Mobile_Number" /></label>
                                                                <input type="text"  class="form-control" name="customer_mobile" placeholder="${customer.getCustomer_mobile()}"  value="${customer.getCustomer_mobile()}"/> </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="cusomerProfile.Address" /></label>
                                                                <input type="text" class="form-control" name="customer_full_address" placeholder="${customer.getCustomer_full_address()}"  value="${customer.getCustomer_full_address()}"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label"><spring:message code="cusomerProfile.Status" /></label>
                                                                <input type="text"  class="form-control" name="customer_status"  placeholder="${customer.getCustomer_status()}" value="${customer.getCustomer_status()}"/> </div>
                                                                
 															<a href="#tab_2-2" data-toggle="tab" class="btn green" > <spring:message code="cusomerProfile.Next" /> </a>
                                                    </div>
                                                    <div id="tab_2-2" class="tab-pane">
                                                            <div class="form-group">
                                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                                        <c:choose>
					                                                           	<c:when test="${customer.getCustomer_image_name() eq null}">
					                                                                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/avatars/default.png" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
					                                                          </c:when>
					                                                          <c:otherwise>
					                                                               <img id="profilePicPlace" src="${pageContext.request.contextPath}/customerImages/${customer.getCustomer_image_name()}" class="img-responsive pic-bordered" alt=""  width="200" height="200"/>
					                                                          </c:otherwise>
					                                                      </c:choose>
                                                                     </div>
                                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                                                    <div>
                                                                        <span class="btn default btn-file">
                                                                            <span class="fileinput-new"> <spring:message code="cusomerProfile.Select_image" /> </span>
                                                                            <span class="fileinput-exists"> <spring:message code="cusomerProfile.Change" /> </span>
                                                                            <input type="file" name="customer_image" > </span>
                                                                        <a href="javascript:;" class="btn default fileinput-exists" data-dismiss="fileinput"> <spring:message code="cusomerProfile.Remove" /> </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a href="#webcamModal" class="btn red webcamLanchBtn" data-toggle="modal" style="margin-left: 0px; width: 300px"> <spring:message code="cusomerProfile.Take_a_Picture" /></a>
				                                           <div class="modal fade container" id="webcamModal" tabindex="-1"role="basic" aria-hidden="true" data-backdrop="static">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
																	<h4 class="modal-title"><spring:message code="cusomerProfile.Take_a_Picture" /></h4>
																</div>
																<div class="modal-body">
																	<div id="my_camera"></div>
																</div>
																<div class="modal-footer">
																		<input type="button" class="btn green" data-dismiss="modal"value="Take Snap"  onClick="take_snapshot()"/>
																		<button type="button" class="btn dark btn-outline"data-dismiss="modal" onClick="close_camera()"><spring:message code="cusomerProfile.Close" /></button>
																</div>
															</div>
                                                            <div class="margin-top-10">
                                                                <a href="javascript:;" class="btn green" id="updateCustomerBtn"> <spring:message code="cusomerProfile.Save_changes" /> </a>
                                                                <a href="javascript:;" class="btn default"> <spring:message code="cusomerProfile.Cancel" /> </a>
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
<script src="${pageContext.request.contextPath}/resources/assets/myScript/customerProfile.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/myScript/printThis.js" type="text/javascript"></script>
<script type="text/javascript">
function updateSalesPayment( btn){
	var updateSalesPaymentBtn = $(btn).attr('id');
	var salesOrderNumber = updateSalesPaymentBtn.substring(updateSalesPaymentBtn.lastIndexOf('_') + 1);
	var paidAmount = parseFloat($('#payAmt_'+salesOrderNumber+'').val());
	var paidMethod = $('#payMethod_'+salesOrderNumber+'').val();
	var balAmt = parseFloat($('#balAmt_'+salesOrderNumber+'').val());
	if(paidAmount > 0 && paidAmount <= balAmt){
	 	$.ajax({
			   url:"${pageContext.request.contextPath}/salesPayment/addSalesPayment/"+salesOrderNumber+"",
				method : "post",
				dataType : "json",
				data : {
					'paidAmount' : paidAmount,
					'paidMethod' : paidMethod
				},
				success : function(data) {
					if(data==="success"){
						swal({
							  title: "<spring:message code="cusomerProfile.Sales_Order_payment_update_successfully" />",
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
						swal("<spring:message code="cusomerProfile.Uable_to_update_Sales_Order_payment" />.","", "error");	
					}
				},
				error : function() {
					swal("<spring:message code="cusomerProfile.Uable_to_update_Sales_Order_payment" />","", "error");
				}
			});
		
	}else{
		$('#payAmt_'+salesOrderNumber+'').val("");
		$('#payMethod_'+salesOrderNumber+'').val("Cash");
		swal("<spring:message code="cusomerProfile.Check_Paying_Amount" />","<spring:message code="cusomerProfile.Paying_amount_cannot_be_greater_than_balance_amount" />", "error");
	}

}

function updateGahanPayment( btn){
	var updateGPaymentBtn = $(btn).attr('id');
	var gahanNumber = updateGPaymentBtn.substring(updateGPaymentBtn.lastIndexOf('_') + 1);
	var withdrawalAmt = parseFloat($('#withdrawalAmt_'+gahanNumber+'').val());
	var paidAmount = parseFloat($('#gpayAmt_'+gahanNumber+'').val());
	var paidMethod = $('#gpayMethod_'+gahanNumber+'').val();
	var interestAmt = parseFloat($('#interestAmt_'+gahanNumber+'').val());
	if(paidAmount > 0 && paidAmount <= withdrawalAmt+interestAmt){
	 	$.ajax({
			   url:"${pageContext.request.contextPath}/gahan/addGahanPayment/"+gahanNumber+"",
				method : "post",
				dataType : "json",
				data : {
					'withdrawalAmt' : withdrawalAmt,
					'interestAmt' : interestAmt,
					'paidAmount' : paidAmount,
					'paidMethod' : paidMethod
				},
				success : function(data) {
					if(data==="success"){
						swal({
							  title: "<spring:message code="cusomerProfile.Gahan_payment_update_successfully" />",
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
						swal("<spring:message code="cusomerProfile.Uable_to_update_Gahan_payment" />.","", "error");	
					}
				},
				error : function() {
					swal("<spring:message code="cusomerProfile.Uable_to_update_Gahan_payment" />","", "error");
				}
			});
		
	}else{
		$('#gpayAmt_'+salesOrderNumber+'').val("");
		$('#gpayMethod_'+salesOrderNumber+'').val("Cash");
		swal("<spring:message code="cusomerProfile.Check_Paying_Amount" />","<spring:message code="cusomerProfile.Paying_amount_cannot_be_greater_than_balance_amount" />", "error");
	}

}

</script>
<script type="text/javascript">
$(document).ready(function() {

	$("#updateCustomerBtn").click(function(){
		var formdata = new FormData($('#updateCustomerForm')[0])
		$.ajax({
			url: "${pageContext.request.contextPath}/customer/updateCustomer",
			method: "post",
			dataType: "json",
			data : formdata,
			async : false,
			success: function(data){
				if(data==="success"){
					swal({
						  title: "<spring:message code="cusomerProfile.Success" />",
						  text: "<spring:message code="cusomerProfile.Customer_updated_successfully" />.",
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
				swal("<spring:message code="cusomerProfile.Ooops_Failed_to_update_customer_data" />","", "error");
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
	
				
				Webcam.upload( data_uri, '${pageContext.request.contextPath}/customer/webcamImageData', function(code, text) {
		            if(code===200){
		            	swal({
							  title: "<spring:message code="cusomerProfile.Success" />",
							  text: "<spring:message code="cusomerProfile.Image_Added_successfully" />.",
							  type: "success",
							  showCancelButton: false,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Ok, Fine"
							});
		            	Webcam.reset();
		            }else{
		            	swal({
							  title: "<spring:message code="cusomerProfile.Oops_Failed" />",
							  text: "<spring:message code="cusomerProfile.Image_Not_Added_Try_again" />.",
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
		
</script>
<script language="JavaScript">
		function close_camera() {
			Webcam.reset();
		}
		
		$('#orderTable').DataTable();

		$('#gahanTable').DataTable();
		
		function makeInactive(data){
			var btnId = $(data).attr("id");
			var gnum = btnId.substring(btnId.lastIndexOf('_') + 1);
			$.ajax({
				   url:"${pageContext.request.contextPath}/gahan/deactivated/"+gnum+"",
					method : "post",
					dataType : "json",
					success : function(data) {
						if(data==="success"){
							swal({
								  title: "<spring:message code="cusomerProfile.Gahan_deactivated_successfully" />",
								  text: "",
								  type: "success",
								  showCancelButton: false,
								  confirmButtonColor: "#DD6B55",
								  confirmButtonText: "Ok",
								  closeOnConfirm: false
								});
							$("#btnId").attr("disabled","disabled");
						}else{
							swal("<spring:message code="cusomerProfile.Uable_to_deactivate_Gahan" />.","", "error");	
						}
					},
					error : function() {
						swal("<spring:message code="cusomerProfile.Uable_to_deactivate_Gahan" />","", "error");
					}
				});
		}
</script>
<script type="text/javascript">
$(document).ready(function(){
	// print customer bill modal button
	$('.printBtn').click(function(){
		//$('.modal-footer').css('visibility',hidden);
		$('.modal-footer').hide("fast",function(){
		    $(".modal-footer").show(8000);
		    });
		$('.printBill').printThis({
			 debug: false,              // * show the iframe for debugging
		        importCSS: true,         //   * import page CSS
		        importStyle: false,         //* import style tags
		        printContainer: true,      // * grab outer container as well as the contents of the selector
		       // loadCSS: "path/to/my.css", // * path to additional css file - us an array [] for multiple
		        removeInline: false,      //  * remove all inline styles from print elements
		        printDelay: 333,            //* variable print delay; depending on complexity a higher value may be necessary
		        header: null,              // * prefix to html
		        base: false,               //  * preserve the BASE tag, or accept a string for the URL
		        formValues: true        //    * preserve input/form values
		});
	});
});
</script>
</body>
</html>