<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="warranty/administrator/create.do" modelAttribute="warranty"
	method="post">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="warranty.title" />:
	</form:label>
	<form:input path="description" placeholder="description"/>
	<form:errors cssClass="error" path="description" />
	<br />
	
	<form:label path="terms">
		<spring:message code="warranty.terms" />:
	</form:label>
	<form:input path="terms" placeholder="terms"/>
	<form:errors cssClass="error" path="terms" />
	<br />
	
	<form:label path="laws">
		<spring:message code="warranty.laws" />:
	</form:label>
	<form:input path="laws" placeholder="laws"/>
	<form:errors cssClass="error" path="laws" />
	<br />
	
	
	<form:checkbox path="draft" />
	<br>

	<input type="submit" name="save"
		value="<spring:message code="warranty.save"/>" />

	<input type="button" name="cancel"
		value="<spring:message code="warranty.cancel" />"
		onclick="javascript: relativeRedir('warranty/administrator/list.do');" />


</form:form>