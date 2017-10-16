<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="supplierList.Supplier_List" /></title>
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
                    <h1 class="page-title"> <spring:message code="supplierList.Supplier_List" />
                        <small><spring:message code="supplierList.Supplier_List" /></small>
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span><spring:message code="supplierList.Supplier_List" /></span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption font-green-haze">
                                        <i class="icon-settings font-green-haze"></i>
                                        <span class="caption-subject bold uppercase"><spring:message code="supplierList.Supplier_List" /></span>
                                    </div>
                                    <div class="actions">
                                        <a class="btn btn-circle btn-icon-only red" href="javascript:;">
                                            <i class="icon-trash"></i>
                                        </a>
                                        <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover" id="supplierListTable">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> <spring:message code="supplierList.Supplier_Name" /> </th>
                                                    <th><spring:message code="supplierList.Mobile_No" /> </th>
                                                    <th><spring:message code="supplierList.Total_Orders" /></th>
                                                    <th><spring:message code="supplierList.Pending_Amount_Orders" /></th>
                                                    <th><spring:message code="supplierList.Total_Payable_Amount" />  </th>
                                                    <th><spring:message code="supplierList.Total_Paid_Amount" />   </th>
                                                    <th><spring:message code="supplierList.Balance_Amount" />   </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	
                                                <c:forEach var="supplierList" items="${allSupplierList}" varStatus="i">
	                                                <c:set  var="totalPurchaseOrders" value="0"></c:set>
	                                                <c:set  var="totalPendingOrders" value="0"></c:set>
	                                            	<c:set  var="totalPayable" value="0"></c:set>
	                                            	<c:set  var="totalPaid" value="0"></c:set>
	                                            	<c:set  var="totalBalance" value="0"></c:set>
                                                	 <c:forEach var="purchaseOrder" items="${supplierList.getPurchaseOrders()}" varStatus="i">
                                                	 	<c:set  var="totalPurchaseOrders" value="${totalPurchaseOrders+1}"></c:set>
                                                	 	
                                                	 	<c:forEach var="purchasePayment" items="${purchaseOrder.getPurchasePayments()}" varStatus="i">
                                                	 		<c:set  var="totalPayable" value="${totalPayable+purchasePayment.getPurchasePayment_total_amount()}"></c:set>
                                                	 		<c:set  var="totalPaid" value="${totalPaid+ purchasePayment.getPurchasePayment_paid_amount()}"></c:set>
                                                			<c:set  var="totalBalance" value="${totalBalance+purchasePayment.getPurchasePayment_balance_amount()}"></c:set>
                                                			<c:if test="${purchasePayment.getPurchasePayment_balance_amount() != 0 }">
                                                	 			<c:set  var="totalPendingOrders" value="${totalPendingOrders+1 }"></c:set>
                                                	 		</c:if>
                                                	 	</c:forEach>
                                                	 </c:forEach>
                                                	<tr>
                                                		<td>${supplierList.getSupplier_id()}</td>
                                                		<td><a href="${pageContext.request.contextPath}/supplier/profile/${supplierList.getSupplier_id()}">${supplierList.getSupplier_name()}</a></td>
                                                		<td>${supplierList.getSupplier_mobile()}</td>
                                                		<td>${totalPurchaseOrders }</td>
                                                		<td>
                                                			<c:choose>
                                                               <c:when test="${totalPendingOrders eq 0}">
                                                                      ${totalPendingOrders}&nbsp;&nbsp;<span class="label label-success"><spring:message code="supplierList.Order_have_pending_amount" /></span>
                                                               </c:when>
                                                               <c:otherwise>
                                                                       ${totalPendingOrders}&nbsp;&nbsp;<span class="label label-danger"><spring:message code="supplierList.Order_have_pending_amount" /> </span>
                                                              </c:otherwise>
                                                          </c:choose>
                                                		</td>
                                                		<td>${totalPayable}</td>
                                                		<td>${totalPaid}</td>
                                                		<td>${totalBalance}</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                </div>
                            </div>
                        </div>
                        <!-- END SAMPLE FORM PORTLET-->
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
<script type="text/javascript">
$('#supplierListTable').DataTable({});
</script>
	
</body>
</html>