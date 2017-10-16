<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="customerList.Customer_List" /></title>
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
                    <h1 class="page-title"><spring:message code="customerList.Customer_List" />
                        <small><spring:message code="customerList.Customer_List" /></small>
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span><spring:message code="customerList.Customer_List" /></span>
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
                                        <span class="caption-subject bold uppercase"><spring:message code="customerList.Customer_List" /></span>
                                    </div>
                                    <div class="actions">
                                        <a class="btn btn-circle btn-icon-only red" href="javascript:;">
                                            <i class="icon-trash"></i>
                                        </a>
                                        <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover" id="customerListTable">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> <spring:message code="customerList.Customer_Name" /> </th>
                                                    <th><spring:message code="customerList.Mobile_No" />  </th>
                                                    <th><spring:message code="customerList.Total_Orders" /></th>
                                                    <th> <spring:message code="customerList.Total_Gahans" /> </th>
                                                    <th><spring:message code="customerList.salesOrder_Balance_Amount" />   </th>
                                                    <th> <spring:message code="customerList.gahan_Balance_Amount" />  </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	
                                                <c:forEach var="customerList" items="${allCustomerList}" varStatus="i">
	                                                <c:set  var="totalSalesOrders" value="0"></c:set>
	                                            	<c:set  var="totalGahan" value="0"></c:set>
	                                            	<c:set  var="totalSalesOrderBalance" value="0"></c:set>
	                                            	<c:set  var="totalGahanBalance" value="0"></c:set>
                                                	 <c:forEach var="salesOrder" items="${customerList.getSalesOrders()}" varStatus="i">
                                                	 	<c:set  var="totalSalesOrders" value="${totalSalesOrders+1}"></c:set>
                                                	 	
                                                	 	<c:forEach var="salesPayment" items="${salesOrder.getSalesPayments()}" varStatus="i">
                                                			<c:set  var="totalSalesOrderBalance" value="${totalSalesOrderBalance+salesPayment.getSalesPayment_balance_amount()}"></c:set>
                                                			
                                                	 	</c:forEach>
                                                	 </c:forEach>
                                                	 <c:forEach var="gahans" items="${customerList.getGahans()}">
                                                	 	<c:set  var="totalGahan" value="${totalGahan+1}"></c:set>
                                                	 	<c:forEach var="gahanPayment" items="${gahans.getGahanPayments()}" varStatus="i">
                                                			<c:set  var="totalGahanBalance" value="${totalGahanBalance+gahanPayment.getGp_total_pending_amount()}"></c:set>
                                                			
                                                	 	</c:forEach>
                                                	 </c:forEach>
                                                	<tr>
                                                		<td>${customerList.getCustomer_id()}</td>
                                                		<td><a href="${pageContext.request.contextPath}/customer/profile/${customerList.getCustomer_id()}">${customerList.getCustomer_name()}</a></td>
                                                		<td>${customerList.getCustomer_mobile()}</td>
                                                		<td>${totalSalesOrders }</td>
                                                		<td>${totalGahan}</td>
                                                		<td>${totalSalesOrderBalance}</td>
                                                		<td>${totalGahanBalance}</td>
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
$('#customerListTable').dataTable({});
</script>
	
</body>
</html>