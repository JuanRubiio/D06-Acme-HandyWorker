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

<form:form action="phase/handyWorker/show.do" modelAttribute="phase" method="post">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="startMoment"/>
	
	<form:label path="title">
		<spring:message code="phase.title" />: ${phase.title}
	</form:label>
	<br />
	
	<form:label path="description">
		<spring:message code="phase.description" />: ${phase.description}
	</form:label>
	<br />
		
	<form:label path="endMoment">
		<spring:message code="phase.endMoment" />: ${phase.endMoment}
	</form:label>

	<form:label path="ordered">
		<spring:message code="phase.ordered" />: ${phase.ordered}
	</form:label>
	<br />

	<a href="phase/edit.do?phaseId=${phase.id}">edit</a>	
	<a href="phase/edit.do?[POST:delete]">delete</a>
	<a href="application/handyWorker/show.do?ApplicationId=${application.id}">back</a>
	
</form:form>

</security:authorize>