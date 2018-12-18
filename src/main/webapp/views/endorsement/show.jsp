<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="endorsement/endorser/show.do" modelAttribute="endorsement" method="show">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="comments">
		<spring:message code="endorsement.comments" />: ${endorsement.comments}
	</form:label>

	<form:label path="moment">
		<spring:message code="endorsement.moment" />: ${endorsement.moment}
	</form:label>
	
	<form:label path="write for">
		<spring:message code="endorsement.writeFor" />: ${endorsement.writeFor}
	</form:label>
	
	<form:label path="write from">
		<spring:message code="endorsement.writeFrom" />: ${endorsement.writeFrom}
	</form:label>
	
	

	<input type="submit" name="Cancel"
		value="<spring:message code="endorsement.cancel" />"
		onclick="javascript: relativeRedir('endorsement/endorser/list.do');" />


</form:form>