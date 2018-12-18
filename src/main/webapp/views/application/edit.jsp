<%--
 * edit.jsp
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

<security:authorize access="hasRole('CUSTOMER')">

	<form:form action="application/save.do" modelAttribute="application"  method="post">
		
		<form:hidden path="id"/>
		<form:hidden path="version"/>
		<form:hidden path="moment"/>

		<form:label path="price">
			<spring:message code="application.price" />: ${application.price}
		</form:label>
		<br />
		<form:label path="handyWorkerComments">
			<spring:message code="application.handyWorkerComments" />: ${application.handyWorkerComments}
		</form:label>
		<br />
		
		<form:label path="Comment">
			<spring:message code="application.customerComment" />
		</form:label>
		<form:input path="title" placeholder="${phase.title}"/>
		<form:errors ccClass="error" path="title"/>
		<br />
		
		<form:select path="status">
			<form:options
				items="${status}" 
				itemLabel="status"
				itemValue="status"/>
		</form:select>		
		
		<%-- Form status --%>
		<jstl:if test="${application.status=='ACCEPTED'}">
			<form:label path="creditCard">
				<spring:message code="application.creditCard.holderName" />
			</form:label>
			<form:input path="creditCard" placeholder="${application.creditCard.holderName}"/>
			<form:errors ccClass="error" path="creditCard"/>
			<br />
		</jstl:if>
	
		<input type="submit" name="save" value="<spring:message code="application.save"/>"/>
		<input type="button" name="cancel" value="<spring:message code="application.cancel"/>"
				onclick="javascript: relativeRedir('application/list.do');"/>
	</form:form>

</security:authorize>
