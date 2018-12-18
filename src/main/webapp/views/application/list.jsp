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

<display:table name="application" requestURI="application/customer/list.do" class="displaytag">
	<display:column property="ticker" title="application.fixUpTask.ticker"/>	
	<display:column property="moment" title="application.moment"/>
	<display:column property="status" title="application.status"/>
	<display:column property="price" title="application.price"/>
	
		<security:authorize access="hasRole('CUSTOMER')">
			<display:column property="handyWorker" title="application.handyWorker"/>
			<display:column>
				<a href="application/edit.do?applicationId=${application.id}">edit</a>
			</display:column>
		</security:authorize>
		<security:authorize access="hasRole('HANDYWORKER')">
			<display:column property="handyWorker" title="application.handyWorker"/>
			<display:column>
				<a href="application/show.do?applicationId=${application.id}">show</a>
			</display:column>
		</security:authorize>
	
</display:table>
