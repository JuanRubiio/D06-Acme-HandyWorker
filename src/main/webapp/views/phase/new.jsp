<%--
 * new.jsp
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

<form:form action="phase/handyWorker/new.do" modelAttribute="phase" method="post">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="startMoment"/>
	
	<form:label path="title">
		<spring:message code="phase.title" />
	</form:label>
	<form:input path="title" placeholder="Insert title"/>
	<form:errors ccClass="error" path="title"/>
	<br />
	
	<form:label path="description">
		<spring:message code="phase.description" />
	</form:label>
	<form:input path="description" placeholder="Insert description"/>
	<form:errors ccClass="error" path="description"/>
	<br />
		
	<form:label path="endMoment">
		<spring:message code="phase.endMoment" />
	</form:label>
	<form:input path="endMoment" placeholder="dd/MM/yyy HH:mm"/>
	<form:errors ccClass="error" path="endMoment"/>
	<br />

	<form:label path="ordered">
		<spring:message code="phase.ordered" />
	</form:label>
	<form:input path="ordered" placeholder="Insert number"/>
	<form:errors ccClass="error" path="ordered"/>
	<br />

	<input type="submit" name="save" value="<spring:message code="phase.save"/>"/>
	<input type="button" name="cancel" value="<spring:message code="phase.cancel"/>"
			onclick="javascript: relativeRedir('application/handyWorker/show.do');"/>
	
</form:form>

</security:authorize>