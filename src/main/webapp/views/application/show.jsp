<%--
 * show.jsp
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

<security:authorize access="hasRole('HANDYWORKER')">

	<form:form action="application/save.do" modelAttribute="application"  method="post">
		
		<form:hidden path="id"/>
		<form:hidden path="version"/>


		<form:label path="moment">
			<spring:message code="application.moment" />: ${application.moment}
		</form:label>
		<br />
		<form:label path="price">
			<spring:message code="application.price" />: ${application.price}
		</form:label>
		<br />

		<%-- IF status.Accepted --%>
		<jstl:if test="${application.status=='ACCEPTED'}">
			<form:label path="status">
				<spring:message code="application.status" />: ${application.status}
			</form:label>
			<br />
			<form:label path="creditCard">
				<spring:message code="application.creditCard" />: ${application.creditCard}
			</form:label>
			<br />
		
		<%-- workplan --%>
		<form:select path="phase">
			<form:options
				items="${phase}" 
				itemLabel="phase"
				itemValue="phase"/>
		</form:select>	
		<%-- FIN --%>
		<br />
		<a href="phase/show.do?phaseId=${phase.id}">show</a>	
		<br />
		<a href="phase/new.do">Create new phase</a>
		</jstl:if>
		<%-- ENDIF --%>
	
		<form:label path="handyWorkerComments">
			<spring:message code="application.handyWorkerComments" />: ${application.handyWorkerComments}
		</form:label>
		<form:label path="CustomerComments">
			<spring:message code="application.CustomerComments" />: ${application.CustomerComments}
		</form:label>
		<br />
		
		<a href="application/list.do">Back</a>
		
	</form:form>

</security:authorize>