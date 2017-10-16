<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="restore.Restore_Backup" /> </title>
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
                    <h1 class="page-title"> <spring:message code="restore.Restore_Backup" />
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index-2.html"><spring:message code="dashboard.dashboard" /></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <spring:message code="restore.Restore_Backup" />
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE HEADER-->
                   
                 <div class="portlet box red ">
			         <div class="portlet-title">
			             <div class="caption">
                           <i class="icon-cursor-move"></i>
                           <span class="caption-subject bold uppercase"><spring:message code="restore.Restore_Backup" /></span>
                       	</div>
			        </div>
		          	<div class="portlet-body" id="panelBody"> 
		          	
		          	 	<div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
	                                <label class="control-label col-md-3"></label>
	                                <div class="col-md-6">
	                                      <input type="button" id="createBackup" onclick="restoreBackup()" class="form-control input-sm green wm" value="<spring:message code="restore.Restore_Backup" />">
	                                </div>
                            	</div>
                      		 </div>
                   		</div>
	                   	<br>
	                 
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
function createBackup(){
	$.ajax({
		url:"${pageContext.request.contextPath}/backupRestore/doRestore",
		method:"get",
		dataType:"json",
		success: function(data){
			if(data==="success"){
				swal({
					  title: "<spring:message code="restore.Success" />",
					  text: "<spring:message code="restore.Restore_has_done_successfully" />",
					  type: "success",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "Ok",
					  closeOnConfirm: false
					});
			}else{
				swal("<spring:message code="restore.Server_error" />","<spring:message code="restore.Unable_to_Restore_Backup" />", "error");
			}
		},
		error:function(){}
	});
}
</script>
</body>
</html>