   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <!-- BEGIN HEADER -->
  <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="index-2.html">
                        <img src="${pageContext.request.contextPath}/resources/assets/layouts/layout2/img/logo-default.png" alt="logo" class="logo-default" /> </a>
                    <div class="menu-toggler sidebar-toggler">
                        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
                    </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN PAGE ACTIONS -->
                <!-- DOC: Remove "hide" class to enable the page header actions -->
                <div class="page-actions">
                    
                    
                </div>
                <!-- END PAGE ACTIONS -->
                <!-- BEGIN PAGE TOP -->
                <div class="page-top">
                    <!-- BEGIN HEADER SEARCH BOX -->
                    <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                   <div class="search-form search-form-expanded">
                        <div class="input-group">
                            <input type="text" class="form-control  " placeholder="<spring:message code="header.Search_Customers..." />" name="query" id="square">
                            <span class="input-group-btn ">
                                <a href="javascript:;" class="btn submit">
                                    <i class="icon-magnifier" ></i>
                                </a>
                            </span>
                        </div>
                    </div>
                    <!-- END HEADER SEARCH BOX -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <!-- BEGIN NOTIFICATION DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class below "dropdown-extended" to change the dropdown styte -->
                            <!-- DOC: Apply "dropdown-hoverable" class after below "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
                            <!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->
                            <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar" >
                                <a href="javascript:;" class="dropdown-toggle notiIcon" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" id="notiIcon">
                                    <i class="icon-bell"></i>
                                    <span class="badge badge-danger" id="notiNumber"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="external">
                                        <h3>
                                            <span class="bold" id="pendingNum">0</span><spring:message code="header.pending_notifications" /> </h3>
                                        <a href="#"><spring:message code="header.view_all_previous_notifications" /></a>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 350px;" data-handle-color="#637283" id="notificationUL">
                                            
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                           
                            <!-- END NOTIFICATION DROPDOWN -->
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="" class="img-circle" src="${pageContext.request.contextPath}/adminImage/${sessionScope.image}" />
                                    <span class="username username-hide-on-mobile"> ${sessionScope.name } </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/overview">
                                            <i class="icon-user"></i> <spring:message code="header.My_Profile" /> </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/task">
                                            <i class="icon-rocket"></i><spring:message code="header.My_Tasks" /> 
                                            <span class="badge badge-success"> 7 </span>
                                        </a>
                                    </li>
                                     <li class="divider"> </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/changePassword">
                                            <i class="icon-lock"></i><spring:message code="header.Change_Password" /> </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/lock">
                                            <i class="icon-lock"></i><spring:message code="header.Lock_Screen" />  </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/logout">
                                            <i class="icon-key"></i><spring:message code="header.Log_Out" />  </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                            <li class="dropdown dropdown-language">
                                <a href="${pageContext.request.contextPath}/?locale=mi" >
                                    <spring:message code="header.Marathi" /></span>
                                   
                                </a>
                               
                            </li>
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END PAGE TOP -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        
