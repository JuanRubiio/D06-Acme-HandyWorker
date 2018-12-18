<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<h1> Are you sure you want to delete this? </h1>


<form:form action="endorsement/endorser/delete.do" modelAttribute="endorsement" method="delete">

	<input type="submit" name="Delete"
		value="<spring:message code="endorsement.delete"/>" />

	<input type="submit" name="Cancel"
		value="<spring:message code="endorsement.cancel" />"
		onclick="javascript: relativeRedir('endorsement/endorser/list.do');" />


</form:form>