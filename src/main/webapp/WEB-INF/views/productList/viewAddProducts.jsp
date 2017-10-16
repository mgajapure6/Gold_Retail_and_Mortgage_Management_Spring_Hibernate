<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="viewAddProducts.View_or_Add_products" /> </title>
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
                    <h1 class="page-title"> <spring:message code="viewAddProducts.View_or_Add_products" />
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <spring:message code="viewAddProducts.View_or_Add_products" />
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   
                 <div class="portlet box red ">
			         <div class="portlet-title">
			             <div class="caption">
                           <i class="icon-cursor-move"></i>
                           <span class="caption-subject bold uppercase"><spring:message code="viewAddProducts.Add_products" /></span>
                       	</div>
			        </div>
		          	<div class="portlet-body" id="panelBody"> 
		          	
		          	 	<div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
	                                <label class="control-label col-md-5"><spring:message code="viewAddProducts.Product_Name" />:</label>
	                                <div class="col-md-7">
	                                      <input type="text" id="Product_Name" class="form-control input-sm wm" >
	                                </div>
                            	</div>
                      		 </div>
                       		 <div class="col-md-6">
                            	<div class="form-group">
                                    <label class="control-label col-md-5"><spring:message code="viewAddProducts.Metal_Type" />:</label>
                                    <div class="col-md-7">
                                      	<select id="Metal_Type" class="form-control input-sm wm">
                                      		<option></option>
                                      		<option value="<spring:message code="viewAddProducts.Gold" />"><spring:message code="viewAddProducts.Gold" /></option>
                                      		<option value="<spring:message code="viewAddProducts.Silver" />"><spring:message code="viewAddProducts.Silver" /></option>
                                      		<option value="<spring:message code="viewAddProducts.Platinum" />"><spring:message code="viewAddProducts.Platinum" /></option>
                                      		<option value="<spring:message code="viewAddProducts.stone_silver" />"><spring:message code="viewAddProducts.stone_silver" /></option>
                                      		<option value="<spring:message code="viewAddProducts.bentex" />"><spring:message code="viewAddProducts.bentex" /></option>
                                      	</select>
                                 	</div>
                            	</div>
                        	</div>
                   		</div>
	                   	<br>
	                   	
                   	<div class="row">
                        <div class="col-md-6">
                        	  <div class="form-group">
                                    <label class="control-label col-md-5"></label>
                                    <div class="col-md-7">
                                      	<a class="btn green btn-sm" onclick="saveProduct()"> <spring:message code="viewAddProducts.save_product" /></a>
                                 </div>
                            </div>
                        </div>
                   	</div>
		    	</div>
		    	<div class="portlet-footer">
		     	</div>
            </div>
            
            <div class="portlet box blue">
			         <div class="portlet-title">
			             <div class="caption">
                           <i class="icon-book-open"></i>
                           <span class="caption-subject bold uppercase"><spring:message code="viewAddProducts.View_products" /></span>
                       	</div>
			        </div>
		          	<div class="portlet-body" id="panelBody"> 
		          	<table class="table table-striped table-bordered table-hover" id="productListTable">
                                            <thead>
                                                <tr>
                                                    <th> # </th>
                                                    <th> <spring:message code="viewAddProducts.Product_Name" /> </th>
                                                    <th><spring:message code="viewAddProducts.Product_metal_Type" />  </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:set var="sn" value="0"></c:set>
                                            	<c:forEach var="products" items="${allProductsList }">
                                            		<c:set var="sn" value="${sn+1 }"></c:set>
                                            		<tr>
                                            			<td>${sn}</td>
                                            			<td>${products.getProduct_name()}</td>
                                            			<td>${products.getProduct_metal_type()}</td>
                                            		</tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
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
           
<script type="text/javascript">

</script>
<script type="text/javascript">
$('#productListTable').dataTable({});

function saveProduct(){
	var pname = $("#Product_Name").val();
	var mtype = $("#Metal_Type").val();
	if(pname!=null && mtype!=null){
		$.ajax({
			url:"${pageContext.request.contextPath}/viewAddProducts/addProductToList",
			method:"post",
			dataType:"json",
			data:{
				"pname" : pname,
				"mtype" : mtype
			},
			success: function(data){
				if(data==="success"){
					swal({
						  title: "<spring:message code="viewAddProducts.Success" />",
						  text: "<spring:message code="viewAddProducts.Product_Added_successfully" />",
						  type: "success",
						  showCancelButton: false,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "Ok",
						  closeOnConfirm: false
						});
				}else{
					swal("<spring:message code="viewAddProducts.Product_Available" />","", "error");
				}
			},
			error:function(){
				swal("<spring:message code="viewAddProducts.Server_Error" />","", "error");
			}
		});
	}else{
		swal("<spring:message code="viewAddProducts.Please_check_inputs" />","", "error");
	}
	
}
</script>
</body>
</html>