<%--
 * list.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="application" requestURI="application/handyWorker,customer/list.do" class="displaytag">
	<display:column property="ticker" title="application.fixUpTask.ticker"/>	
	<display:column property="id" title="application.id"/>
	<display:column property="moment" title="application.moment"/>
	<display:column property="status" title="application.status"/>
	<display:column property="price" title="application.price"/>
	
		<security:authorize access="hasRole('CUSTOMER')">
			<display:column property="handyWorker" title="application.handyWorker"/>
			<display:column>
				<spring:url value="application/edit.do?applicationId={app}">
					<i class="fas fa-pencil-alt"></i>
					<spring:param name="app" value="${application.id}"/>
				</spring:url>
			</display:column>
		</security:authorize>
		<security:authorize access="hasRole('HANDYWORKER')">
			<display:column property="customer" title="application.customer"/>
			<display:column>
				<spring:url value="application/show.do?applicationId={app}">
					<i class="far fa-eye"></i>
					<spring:param name="app" value="${application.id}"/>
				</spring:url>
			</display:column>
			<spring:url value="application/edit.do?">
				<i class="fas fa-plus"></i>
			</spring:url>
		</security:authorize>
	
</display:table>
