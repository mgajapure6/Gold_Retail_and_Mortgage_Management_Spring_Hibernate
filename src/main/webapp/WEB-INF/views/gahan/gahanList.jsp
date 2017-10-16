<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="gahanList.All_Gahan_List" /></title>
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
                    <h1 class="page-title"><spring:message code="gahanList.All_Gahan_List" />
                        <small><spring:message code="gahanList.Gahan_List" /></small>
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span><spring:message code="gahanList.Gahan_List" /></span>
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
                                        <span class="caption-subject bold uppercase"><spring:message code="gahanList.Gahan_List" /></span>
                                    </div>
                                    <div class="actions">
                                        <a class="btn btn-circle btn-icon-only red" href="javascript:;">
                                            <i class="icon-trash"></i>
                                        </a>
                                        <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
                                    </div>
                                </div>
                                <div class="portlet-title">
										<div class="input-group input-large date-picker input-daterange"  data-date-format="dd-mm-yyyy">
                                             <input type="text" class="form-control" name="from" id="min" value="01-01-2017">
                                              <span class="input-group-addon"> to </span>
                                              <input type="text" class="form-control" name="to" id="max"> 
                                      </div>
								</div>
                                <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover" id="gahanListTable">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> <spring:message code="gahanList.Customer_Name" /> </th>
                                                    <th><spring:message code="gahanList.Gahan_making_date" />  </th>
                                                    <th><spring:message code="gahanList.Gahan_number" />  </th>
                                                    <th><spring:message code="gahanList.Gahan_Product" />  </th>
                                                    <th><spring:message code="gahanList.Gahan_Net_weight" /></th>
                                                    <th><spring:message code="gahanList.Gahan_withdrawal_money" /></th>
                                                    <th><spring:message code="gahanList.Gahan_interest_rate" />   </th>
                                                    <th> <spring:message code="gahanList.Gahan_interest_amount" /> </th>
                                                    <th> <spring:message code="gahanList.Gahan_status" />  </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:set var="sn" value="0"></c:set>
                                                <c:forEach var="customerList" items="${allCustomerList}" varStatus="i">
                                                	 <c:forEach var="gahanList" items="${customerList.getGahans()}" varStatus="j">
                                                	 	<c:forEach var="gahanProduct" items="${gahanList.getGahanProducts()}" varStatus="i">
                                                	 	<c:set var="sn" value="${sn+1 }"></c:set>
                                                	 		<tr>
                                                	 			<td>${sn}</td>
		                                                		<td><a href="${pageContext.request.contextPath}/customer/profile/${customerList.getCustomer_id()}">${customerList.getCustomer_name()}</a></td>
		                                                		<td>${gahanList.getGahan_making_date()}</td>
		                                                		<td>${gahanList.getGahan_number()}</td>
		                                                		<td>${gahanProduct.getGahanProduct_name()}</td>
		                                                		<td>${gahanProduct.getGahanProduct_net_weight()}</td>
		                                                		<td>${gahanList.getGahan_widthdraw_money()}</td>
		                                                		<td>${gahanList.getGahan_interest_rate()}</td>
		                                                		<td>${gahanList.getGahan_interest_amount()}</td>
		                                                		<td>${gahanList.getGahan_status()}</td>
                                                			</tr>
                                                	 	</c:forEach>
                                                	 </c:forEach>
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
var oTable=$('#gahanListTable').dataTable({
	dom: 'Bfrtip',
	lengthMenu: [
	             [ -1, 50, 100, 200 ],
	             [ 'Show all', '50', '100', '200' ]],
    buttons: [
		'pageLength',
        'print',
        'pdfHtml5',
    ],
});

/* Add event listeners to the two date-range filtering inputs */
$('#min').change( function() { oTable.fnDraw();  } );
$('#max').change( function() { oTable.fnDraw(); } );
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.fn.dataTableExt.afnFiltering.push(
		    function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min').value;
		        var iFfin = document.getElementById('max').value;
		        var iStartDateCol = 2;
		        var iEndDateCol = 2;
		 
		        iFini=iFini.substring(6,10) + iFini.substring(3,5)+ iFini.substring(0,2);
		        iFfin=iFfin.substring(6,10) + iFfin.substring(3,5)+ iFfin.substring(0,2);
		 
		        var datofini=aData[iStartDateCol].substring(6,10) + aData[iStartDateCol].substring(3,5)+ aData[iStartDateCol].substring(0,2);
		        var datoffin=aData[iEndDateCol].substring(6,10) + aData[iEndDateCol].substring(3,5)+ aData[iEndDateCol].substring(0,2);
		 
		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		    }
		);
});
</script>
	
</body>
</html>