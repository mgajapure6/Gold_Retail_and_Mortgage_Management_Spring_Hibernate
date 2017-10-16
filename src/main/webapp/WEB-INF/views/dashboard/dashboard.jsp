<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="en">
 <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8" />
        <title><spring:message code="dashboard.Shopname_Dashboard" /></title>
        <jsp:include page="../utility/headTag.jsp" />
        <style type="text/css">
			.amcharts-chart-div a {
				display:none !important;
			}
			#c_chartdiv {
				width: 100%;
				height: 300px;
			}	
			#so_chartdiv {
				width: 100%;
				height: 300px;
			}	
			#ag_chartdiv {
				width: 100%;
				height: 300px;
			}	
			#dg_chartdiv {
				width: 100%;
				height: 300px;
			}	
		</style>
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
                    <!-- BEGIN THEME PANEL -->
                    
                    <!-- END THEME PANEL -->
                    <h1 class="page-title"> <spring:message code="dashboard.Shopname_admin_Dashboard" />
                        <small><spring:message code="dashboard.Business_intelligent" /></small>
                    </h1>
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN DASHBOARD STATS 1-->
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-v2 blue" href="#">
                                <div class="visual">
                                    <i class="fa fa-comments"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <span data-counter="counterup" data-value="${totalCustomers}">0</span>
                                    </div>
                                    <div class="desc"> <spring:message code="dashboard.Total_Customer" /></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-v2 red" href="#">
                                <div class="visual">
                                    <i class="fa fa-bar-chart-o"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <span data-counter="counterup" data-value=" ${totalSalesOrders}">0</span> </div>
                                    <div class="desc"> <spring:message code="dashboard.Total_Sales_Order" /> </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-v2 green" href="#">
                                <div class="visual">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <span data-counter="counterup" data-value="${totalActiveGahan}">0</span>
                                    </div>
                                    <div class="desc"><spring:message code="dashboard.Total_Active_Gahan" />  </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                                <div class="visual">
                                    <i class="fa fa-globe"></i>
                                </div>
                                <div class="details">
                                    <div class="number"> 
                                        <span data-counter="counterup" data-value="${totalPurchaseOrders}"></span></div>
                                    <div class="desc"> <spring:message code="dashboard.Total_Purchase_Orders" /></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!-- END DASHBOARD STATS 1-->
                    <div class="row">
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                            <!-- BEGIN PORTLET-->
                            
                            <!-- END PORTLET-->
                        </div>
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                            <!-- BEGIN PORTLET-->
                            
                            <!-- END PORTLET-->
                        </div>
                    </div>
                    
                   
                    
                    <div class="row">
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                           
                        </div>
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <i class="font-dark hide"></i>
                                        <span class="caption-subject font-dark bold uppercase"> <spring:message code="dashboard.Monthly_Customers" /></span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="c_chartdiv"></div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                             <!-- BEGIN PORTLET-->
                            <div class="portlet light">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <i class="font-dark hide"></i>
                                        <span class="caption-subject font-dark bold uppercase"> <spring:message code="dashboard.Monthly_Sales_Orders" /></span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="so_chartdiv"></div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                </div>
                <div class="row">
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <i class="font-dark hide"></i>
                                        <span class="caption-subject font-dark bold uppercase"> <spring:message code="dashboard.Monthly_Active_Gahan" /></span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="ag_chartdiv"></div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <div class="col-lg-6 col-xs-12 col-sm-12">
                             <!-- BEGIN PORTLET-->
                            <div class="portlet light">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <i class="font-dark hide"></i>
                                        <span class="caption-subject font-dark bold uppercase"> <spring:message code="dashboard.Monthly_Deactivated_Gahan" /></span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="dg_chartdiv"></div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <a href="javascript:;" class="page-quick-sidebar-toggler">
                <i class="icon-login"></i>
            </a>
           
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
            <jsp:include page="../utility/footer.jsp" />
        <!-- END FOOTER -->
            <!-- BEGIN QUICK NAV -->
            <!-- END QUICK NAV -->
           </div>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
			url: "${pageContext.request.contextPath}/report/monthlyCustomerReport",
			method: "get",
			dataType: "json",
			success: function(data){
				
				AmCharts.addInitHandler(function(chart) {
					  // check if there are graphs with autoColor: true set
					  for(var i = 0; i < chart.graphs.length; i++) {
					    var graph = chart.graphs[i];
					    if (graph.autoColor !== true)
					      continue;
					    var colorKey = "autoColor-"+i;
					    graph.lineColorField = colorKey;
					    graph.fillColorsField = colorKey;
					    for(var x = 0; x < chart.dataProvider.length; x++) {
					      var color = chart.colors[x]
					      chart.dataProvider[x][colorKey] = color;
					    }
					  }
					  
					}, ["serial"]);
				
				
				var priceChart = AmCharts.makeChart("c_chartdiv",
				{
					"type": "serial",
					"theme": "light",
					"categoryField": "monthYear",
					"dataDateFormat": "MM-YYYY",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						"parseDates": false
					},
					"chartCursor": {
						"enabled": true
					},
					"chartScrollbar": {
						"enabled": true
					},
					"graphs": [
						{
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "customerCount",
							"autoColor": true
						}
					],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": " <spring:message code="dashboard.Total_Customers" />"
						}
					],
					"titles": [
						{
							"id": "Title-1",
							"size": 25,
							"text": " <spring:message code="dashboard.Monthly_customers_report" />"
						}
					],
					"dataProvider": data
				});
				
		
			},
			error: function(){
				swal(" <spring:message code="dashboard.failed_to_load_chart" />","","error");
			}
		});
  
} );
</script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
			url: "${pageContext.request.contextPath}/report/monthlySalesOrderReport",
			method: "get",
			dataType: "json",
			success: function(data){
				
				AmCharts.addInitHandler(function(chart) {
					  // check if there are graphs with autoColor: true set
					  for(var i = 0; i < chart.graphs.length; i++) {
					    var graph = chart.graphs[i];
					    if (graph.autoColor !== true)
					      continue;
					    var colorKey = "autoColor-"+i;
					    graph.lineColorField = colorKey;
					    graph.fillColorsField = colorKey;
					    for(var x = 0; x < chart.dataProvider.length; x++) {
					      var color = chart.colors[x]
					      chart.dataProvider[x][colorKey] = color;
					    }
					  }
					  
					}, ["serial"]);
				
				
				var priceChart = AmCharts.makeChart("so_chartdiv",
				{
					"type": "serial",
					"theme": "light",
					"categoryField": "monthYear",
					"dataDateFormat": "MM-YYYY",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						"parseDates": false
					},
					"chartCursor": {
						"enabled": true
					},
					"chartScrollbar": {
						"enabled": true
					},
					"graphs": [
						{
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "salesOrderCount",
							"autoColor": true
						}
					],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": " <spring:message code="dashboard.Total_Sales_Orders" />"
						}
					],
					"titles": [
						{
							"id": "Title-1",
							"size": 25,
							"text": " <spring:message code="dashboard.Monthly_Sales_Orders_Report" />"
						}
					],
					"dataProvider": data
				});
				
		
			},
			error: function(){
				swal(" <spring:message code="dashboard.failed_to_load_chart" />","","error");
			}
		});
  
} );
</script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
			url: "${pageContext.request.contextPath}/report/monthlyActiveGahanReport",
			method: "get",
			dataType: "json",
			success: function(data){
				
				AmCharts.addInitHandler(function(chart) {
					  // check if there are graphs with autoColor: true set
					  for(var i = 0; i < chart.graphs.length; i++) {
					    var graph = chart.graphs[i];
					    if (graph.autoColor !== true)
					      continue;
					    var colorKey = "autoColor-"+i;
					    graph.lineColorField = colorKey;
					    graph.fillColorsField = colorKey;
					    for(var x = 0; x < chart.dataProvider.length; x++) {
					      var color = chart.colors[x]
					      chart.dataProvider[x][colorKey] = color;
					    }
					  }
					  
					}, ["serial"]);
				
				
				var priceChart = AmCharts.makeChart("ag_chartdiv",
				{
					"type": "serial",
					"theme": "light",
					"categoryField": "monthYear",
					"dataDateFormat": "MM-YYYY",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						"parseDates": false
					},
					"chartCursor": {
						"enabled": true
					},
					"chartScrollbar": {
						"enabled": true
					},
					"graphs": [
						{
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "activeGahanCount",
							"autoColor": true
						}
					],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": " <spring:message code="dashboard.Total_Active_Gahan" />"
						}
					],
					"titles": [
						{
							"id": "Title-1",
							"size": 25,
							"text": " <spring:message code="dashboard.Monthly_Active_Gahan_Report" />"
						}
					],
					"dataProvider": data
				});
				
		
			},
			error: function(){
				swal(" <spring:message code="dashboard.failed_to_load_chart" />","","error");
			}
		});
  
} );
</script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
			url: "${pageContext.request.contextPath}/report/monthlyDeactivatedGahanReport",
			method: "get",
			dataType: "json",
			success: function(data){
				
				AmCharts.addInitHandler(function(chart) {
					  // check if there are graphs with autoColor: true set
					  for(var i = 0; i < chart.graphs.length; i++) {
					    var graph = chart.graphs[i];
					    if (graph.autoColor !== true)
					      continue;
					    var colorKey = "autoColor-"+i;
					    graph.lineColorField = colorKey;
					    graph.fillColorsField = colorKey;
					    for(var x = 0; x < chart.dataProvider.length; x++) {
					      var color = chart.colors[x]
					      chart.dataProvider[x][colorKey] = color;
					    }
					  }
					  
					}, ["serial"]);
				
				
				var priceChart = AmCharts.makeChart("dg_chartdiv",
				{
					"type": "serial",
					"theme": "light",
					"categoryField": "monthYear",
					"dataDateFormat": "MM-YYYY",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						"parseDates": false
					},
					"chartCursor": {
						"enabled": true
					},
					"chartScrollbar": {
						"enabled": true
					},
					"graphs": [
						{
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "deactivatedGahanCount",
							"autoColor": true
						}
					],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": " <spring:message code="dashboard.Total_Deactivated_Gahan" />"
						}
					],
					"titles": [
						{
							"id": "Title-1",
							"size": 25,
							"text": " <spring:message code="dashboard.Monthly_Deactivated_Gahan_report" />"
						}
					],
					"dataProvider": data
				});
				
		
			},
			error: function(){
				swal("failed to load chart","","error");
			}
		});
  
} );
</script>
</body>
</html>