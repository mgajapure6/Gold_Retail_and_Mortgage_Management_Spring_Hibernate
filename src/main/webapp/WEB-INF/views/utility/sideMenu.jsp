 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
                <!-- END SIDEBAR -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-hover-submenu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                        <li class="nav-item start active open">
                            <a href="${pageContext.request.contextPath}/" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title"><spring:message code="sideMenu.Dashboard" /></span>
                                <span class="selected"></span>
                                <span class="arrow open"></span>
                            </a>
                        </li>
                        
                        <li class="nav-item  ">
                            <a href="${pageContext.request.contextPath}/viewAddProducts/allProductList" class="nav-link nav-toggle">
                                <i class="icon-layers"></i>
                                <span class="title"><spring:message code="sideMenu.Products" /></span>
                                <span class="arrow"></span>
                            </a>
                        </li>
                        <li class="nav-item  ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-users"></i>
                                <span class="title"><spring:message code="sideMenu.Customer_Management" /></span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/customer/addNewCustomer" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.Add_new_customer" /></span>
                                    </a>
                                </li>
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/customer/getAllCustomers" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.Manage_customer" /></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item  ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-user"></i>
                                <span class="title"><spring:message code="sideMenu.Gahan_Management" /></span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/gahan/getAllGahan" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.View_All_Gahans" /></span>
                                    </a>
                                </li>
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/gahan/getAllGahan" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.Expire_Gahans" /></span>
                                    </a>
                                </li>
                                 <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/gahan/getAllGahan" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.Overdue_Gahans" /></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item  ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-basket"></i>
                                <span class="title"><spring:message code="sideMenu.Sales_Management" /></span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/salesOrder/getAllSalesOrders" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.View_sales_orders" /></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
<!--                         <li class="nav-item  "> -->
<!--                             <a href="javascript:;" class="nav-link nav-toggle"> -->
<!--                                 <i class="icon-user"></i> -->
<%--                                 <span class="title"><spring:message code="sideMenu.Supply_Management" /></span> --%>
<!--                                 <span class="arrow"></span> -->
<!--                             </a> -->
<!--                             <ul class="sub-menu"> -->
<!--                                 <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/supplier/addNewSupplier" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.Add_new_supplier" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/supplier/getAllSuppliers" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.View_suppliers" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                         <li class="nav-item  "> -->
<!--                             <a href="javascript:;" class="nav-link nav-toggle"> -->
<!--                                 <i class="icon-basket"></i> -->
<%--                                 <span class="title"><spring:message code="sideMenu.Purchase_Management" /></span> --%>
<!--                                 <span class="arrow"></span> -->
<!--                             </a> -->
<!--                             <ul class="sub-menu"> -->
                            	
<!--                                 <li class="nav-item  "> -->
<!--                                     <a href="#selectSupplierModal" class="nav-link" data-toggle="modal"> -->
<%--                                         <span class="title"><spring:message code="sideMenu.Add_new_purchase_order" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                  <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/purchaseOrder/getAllPurchaseOrders" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.View_purchase_orders" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
                                
<!--                             </ul> -->
<!--                         </li> -->
<!--                         <li class="nav-item  "> -->
<!--                             <a href="javascript:;" class="nav-link nav-toggle"> -->
<!--                                 <i class="icon-bar-chart"></i> -->
<%--                                 <span class="title"><spring:message code="sideMenu.Reports" /></span> --%>
<!--                                 <span class="arrow"></span> -->
<!--                             </a> -->
<!--                             <ul class="sub-menu"> -->
                            	
<!--                                  <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/report/gahanReport" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.gahanReport" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!-- <!--                                 <li class="nav-item  "> --> -->
<%-- <%--                                     <a href="${pageContext.request.contextPath}/report/payableReport" class="nav-link" data-toggle="modal"> --%> --%>
<%-- <%--                                         <span class="title"><spring:message code="sideMenu.PayableReport" /></span> --%> --%>
<!-- <!--                                     </a> --> -->
<!-- <!--                                 </li> --> -->
<!-- <!--                                 <li class="nav-item  "> --> -->
<%-- <%--                                     <a href="${pageContext.request.contextPath}/report/purchaseInvoiceReport" class="nav-link" data-toggle="modal"> --%> --%>
<%-- <%--                                         <span class="title"><spring:message code="sideMenu.purchaseInvoiceReport" /></span> --%> --%>
<!-- <!--                                     </a> --> -->
<!-- <!--                                 </li> --> -->
<!-- <!--                                  <li class="nav-item  "> --> -->
<%-- <%--                                     <a href="${pageContext.request.contextPath}/report/purchaseReport" class="nav-link "> --%> --%>
<%-- <%--                                         <span class="title"><spring:message code="sideMenu.PurchaseReport" /></span> --%> --%>
<!-- <!--                                     </a> --> -->
<!-- <!--                                 </li> --> -->
<!--                                 <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/report/receivableReport" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.ReceivableReport" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/report/salesInvoiceReport" class="nav-link" data-toggle="modal"> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.SalesInvoiceReport" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                  <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/report/salesReport" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.SalesReport" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!-- <!--                                  <li class="nav-item  "> --> -->
<%-- <%--                                     <a href="${pageContext.request.contextPath}/report/supplierReport" class="nav-link "> --%> --%>
<%-- <%--                                         <span class="title"><spring:message code="sideMenu.SupplierReport" /></span> --%> --%>
<!-- <!--                                     </a> --> -->
<!-- <!--                                 </li> --> -->
<!--                                 <li class="nav-item  "> -->
<%--                                     <a href="${pageContext.request.contextPath}/report/udhariReport" class="nav-link "> --%>
<%--                                         <span class="title"><spring:message code="sideMenu.UdhariReport" /></span> --%>
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </li> -->
                        <li class="nav-item  ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-settings"></i>
                                <span class="title"><spring:message code="sideMenu.Backup_Restore" /></span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/backupRestore/backup" class="nav-link" data-toggle="modal">
                                        <span class="title"><spring:message code="sideMenu.Backup" /></span>
                                    </a>
                                </li>
                                 <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/backupRestore/restore" class="nav-link ">
                                        <span class="title"><spring:message code="sideMenu.Restore" /></span>
                                    </a>
                                </li>
                                
                            </ul>
                        </li>

                    </ul>
                    <div id="selectSalesCustomerModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
						 <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        <h4 class="modal-title"><spring:message code="sideMenu.Select_customer" />.</h4>
                                    </div>
						<div class="modal-body">
							<table class="table table-hover table-bordered">
								<tr>
									<td><spring:message code="sideMenu.Customer" /> : &nbsp;</td>
									<td>
<%-- 										<input type="text" class="form-control  " placeholder="<spring:message code="header.Search_Customers..." />" name="query" id="customerSalesOrder"> --%>
										<select  id="sales_customer_side_list" class="select2listCus form-control" onchange="redirectToSalesCustomerOrder(this)">
										   <option></option>
										   <c:forEach var="customerList" items="${allCustomerTopList}" varStatus="i" > 
												<option value="${customerList.getCustomer_name()}_${customerList.getCustomer_id()}">${customerList.getCustomer_name()}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
						
							<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
						</div>
					</div>
					<div id="selectGahanCustomerModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
						 <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        <h4 class="modal-title"><spring:message code="sideMenu.Select_customer" />.</h4>
                                    </div>
						<div class="modal-body">
							<table class="table table-hover table-bordered">
								<tr>
									<td><spring:message code="sideMenu.Supplier" /> : &nbsp;</td>
									<td>
<%-- 										<input type="text" class="form-control  " placeholder="<spring:message code="header.Search_Customers..." />" name="query" id="customerGahanOrder"> --%>
										<select  id="gahan_customer_side_list" class="select2listCus form-control" onchange="redirectToGahanCustomerOrder(this)">
										   <option></option>
										   <c:forEach var="customerList" items="${allCustomerTopList}" varStatus="i" > 
												<option value="${customerList.getCustomer_name()}_${customerList.getCustomer_id()}">${customerList.getCustomer_name()}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
						
							<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
						</div>
					</div>
					<div id="selectSupplierModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
						 <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        <h4 class="modal-title"><spring:message code="sideMenu.Select_supplier" />.</h4>
                                    </div>
						<div class="modal-body">
							<table class="table table-hover table-bordered">
								<tr>
									<td><spring:message code="sideMenu.Supplier" /> : &nbsp;</td>
									<td>
<%-- 										<input type="text" class="form-control  " placeholder="<spring:message code="sideMenu.Search_Supplier" />" name="query" id="supplierPurchaseOrder"> --%>
										<select  id="supplier_side_list" class="select2listSup form-control col-md-4" onchange="redirectToSupplierPurchaseOrder(this)">
										   <option></option>
										   <c:forEach var="supplierList" items="${allSupplierTopList}" varStatus="i" > 
												<option value="${supplierList.getSupplier_name()}_${supplierList.getSupplier_id()}">${supplierList.getSupplier_name()}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
						
							<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="cusomerProfile.Cancel" /></button>
						</div>
					</div>
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
            

