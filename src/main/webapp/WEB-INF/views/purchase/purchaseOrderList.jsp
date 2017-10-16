<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="purchaseOrderList.Purchase_Order_List" /></title>
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
                    <h1 class="page-title"><spring:message code="purchaseOrderList.Purchase_Order_List" /> 
                        <small><spring:message code="purchaseOrderList.Purchase_Order_List" /></small>
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span><spring:message code="purchaseOrderList.Purchase_Order_List" /></span>
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
                                        <span class="caption-subject bold uppercase"><spring:message code="purchaseOrderList.Purchase_Order_List" /></span>
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
                                        <table class="table table-striped table-bordered table-hover" id="purchaseOrderListTable">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> <spring:message code="purchaseOrderList.Order_No" /> </th>
                                                    <th> <spring:message code="purchaseOrderList.Order_Date" /> </th>
                                                    <th><spring:message code="purchaseOrderList.Products" /></th>
                                                    <th><spring:message code="purchaseOrderList.Total_Amount" /></th>
                                                    <th> <spring:message code="purchaseOrderList.Total_Paid_Amount" />  </th>
                                                    <th><spring:message code="purchaseOrderList.Balance_Amount" />   </th>
                                                     <th><spring:message code="purchaseOrderList.Add_Payment" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:set var="sn" value="0"></c:set>
                                            	
                                                <c:forEach var="purchaseOrderList" items="${allPurchaseOrderList}" varStatus="i">
                                                		<c:set var="totalPaid" value="0"></c:set>
                                                		<c:forEach var="paidAmt" items="${purchaseOrderList.getPurchasePayments()}" >
                                                			<c:set var="totalPaid" value="${totalPaid+paidAmt.getPurchasePayment_paid_amount()}"></c:set>
					                                     </c:forEach>
                                                <c:set var="sn" value="${sn+1 }"></c:set>
                                                	<tr>
                                                		<td>${sn}</td>
                                                		<td>${purchaseOrderList.getPurchaseOrder_number()}</td>
                                                		<td>${purchaseOrderList.getPurchaseOrder_date()}</td>
                                                		<td>
                                                			<c:forEach var="productList" items="${purchaseOrderList.getPurchaseProducts()}" >
	                                                               ${productList.getPurchaseProduct_name()}&nbsp;&nbsp;${productList.getPurchaseProduct_quantity()}<br />
	                                                        </c:forEach>
	                                                    </td>
                                                		<td>${purchaseOrderList.getPurchaseOrder_total_price_after_discount()}</td>
                                                		<td>${totalPaid} &nbsp;&nbsp;&nbsp;<a href="#viewPaymentModel_${purchaseOrderList.getPurchaseOrder_number()}" class="btn purple btn-sm btn-outline sbold"  data-toggle="modal" ><spring:message code="purchaseOrderList.View" /> </a>
                                                			
                                                			<!--Start  view Payment Model -->
                                                              <div id="viewPaymentModel_${purchaseOrderList.getPurchaseOrder_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																<div class="modal-body">
																	<table class="table table-hover table-bordered">
																		<tr>
																			<th><spring:message code="purchaseOrderList.Paid_Amount" /></th>
																			<th><spring:message code="purchaseOrderList.Paid_Date" /></th>
																			<th><spring:message code="purchaseOrderList.Paid_Method" /></th>
																		</tr>
																		<c:forEach var="paidDetail" items="${purchaseOrderList.getPurchasePayments()}" >
					                                                         <tr>
					                                                         	<td>${paidDetail.getPurchasePayment_paid_amount()}</td>
					                                                         	<td>${paidDetail.getPurchasePayment_paid_amount_date()}</td>
					                                                         	<td>${paidDetail.getPurchasePayment_paid_method()}</td>
					                                                         </tr>
					                                                     </c:forEach>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="purchaseOrderList.Close" /></button>
																</div>
															</div>
															<!--End  view Payment Model -->
                                                		</td>
                                                		<td>
                                                			<c:set var="balanceAmount" value="0"></c:set>
                                                			<c:forEach var="purchaseOrderPayment" items="${purchaseOrderList.getPurchasePayments()}" >
	                                                              <c:set var="balanceAmount" value="${purchaseOrderPayment.getPurchasePayment_balance_amount()}"></c:set>
	                                                        </c:forEach>
                                                			<c:choose>
                                                               <c:when test="${balanceAmount eq 0}">
                                                                      ${balanceAmount}&nbsp;&nbsp;<span class="label label-success"><spring:message code="purchaseOrderList.No_Balance" /></span>
                                                               </c:when>
                                                               <c:otherwise>
                                                                       ${balanceAmount}&nbsp;&nbsp;<span class="label label-danger"> <spring:message code="purchaseOrderList.Balance" /> </span>
                                                              </c:otherwise>
                                                          </c:choose>
                                                		</td>
                                                		<td>
                                                			<c:choose>
                                                  				<c:when test="${balanceAmount eq 0 or balanceAmount lt 0}">
                                                  					<input type="button" disabled="disabled" class="btn dark btn-sm btn-outline sbold uppercase" id="payment_${purchaseOrderList.getPurchaseOrder_number()}" value="Add Payment" />
                                                  				</c:when>
                                                  				<c:otherwise>
                                                  					<a href="#paymentModel_${purchaseOrderList.getPurchaseOrder_number()}" class="btn red btn-sm btn-outline sbold uppercase"  data-toggle="modal" > <spring:message code="purchaseOrderList.Add_Payment" /></a>
                                                  				</c:otherwise>
                                                  			</c:choose>
                                                  			
	                                                        <!--Start  Add Payment Model -->
                                                              <div id="paymentModel_${purchaseOrderList.getPurchaseOrder_number()}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-attention-animation="false" aria-hidden="true" style="display: none; margin-top: -76.5px;">
																 <div class="modal-header">
						                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
						                                            <h4 class="modal-title"><spring:message code="purchaseOrderList.Add_paying_amount_here" />.</h4>
						                                        </div>
																<div class="modal-body">
																	<table class="table table-hover table-bordered">
																		<tr>
																			<td><spring:message code="purchaseOrderList.Paying_Amount" /> : &nbsp;</td>
																			<td width="340">
																				<input type="text"  hidden="hidden" id="balAmt_${purchaseOrderList.getPurchaseOrder_number()}" value="${balanceAmount}" />
																				<input type="text" class="form-control" class="payingAmt" id="payAmt_${purchaseOrderList.getPurchaseOrder_number()}" />
																			</td>
																		</tr>
																		<tr>
																			<td><spring:message code="purchaseOrderList.Paying_Method" /> : &nbsp;</td>
																			<td width="340">
																				 <select name="paidMethod" id="payMethod_${purchaseOrderList.getPurchaseOrder_number()}" class="form-control " onchange="">
																		   		 	<option value="Cash"><spring:message code="purchaseOrderList.Cash" /></option>
																		   		 	<option value="Check"><spring:message code="purchaseOrderList.Check" /></option>
																		   		 	<option value="DD"><spring:message code="purchaseOrderList.DD" /></option>
																		   		 	<option value="Online Net Banking Transfer"><spring:message code="purchaseOrderList.Net_Banking_Transfer" /></option>
																		   		 	<option value="Mobile App Transfer"><spring:message code="purchaseOrderList.Mobile_App_Transfer" /></option>
																		         </select>
																			</td>
																		</tr>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button" data-dismiss="modal" class="btn green" id="savePaymentBtn_${purchaseOrderList.getPurchaseOrder_number()}" onclick="updatePurchasePayment(this)"><spring:message code="purchaseOrderList.Update" /></button>
																	<button type="button" data-dismiss="modal" class="btn btn-outline dark"><spring:message code="purchaseOrderList.Cancel" /></button>
																</div>
															</div>
															<!--End  Add Payment Model -->
                                                		</td>
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
$('#purchaseOrderListTable').dataTable({
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
$('#min').change( function() { oTable.fnDraw();  });
$('#max').change( function() { oTable.fnDraw(); });
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
<script type="text/javascript">
function updatePurchasePayment( btn){
	var updatePurchasePaymentBtn = $(btn).attr('id');
	var purchaseOrderNumber = updatePurchasePaymentBtn.substring(updatePurchasePaymentBtn.lastIndexOf('_') + 1);
	var paidAmount = parseFloat($('#payAmt_'+purchaseOrderNumber+'').val());
	var paidMethod = $('#payMethod_'+purchaseOrderNumber+'').val();
	var balAmt = parseFloat($('#balAmt_'+purchaseOrderNumber+'').val());
	
 	if(paidAmount > 0 && paidAmount <= balAmt){
 		//alert(totalAmt)
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
							  title: "<spring:message code="purchaseOrderList.purchase_payment_update_succefully" />",
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
						swal("<spring:message code="purchaseOrderList.Uable_to_update_purchase_payment" />.","", "error");	
					}
				},
				error : function() {
					swal("<spring:message code="purchaseOrderList.Uable_to_update_purchase_payment" />","", "error");
				}
			});
		
 	}else{
		$('#payAmt_'+purchaseOrderNumber+'').val("");
		$('#payMethod_'+purchaseOrderNumber+'').val("Cash");
		swal("<spring:message code="purchaseOrderList.Check_Paying_Amount" />","<spring:message code="purchaseOrderList.Paying_amount_cannot_be_greater_than_total_amount" />", "error");
	}

}
</script>
</body>
</html>