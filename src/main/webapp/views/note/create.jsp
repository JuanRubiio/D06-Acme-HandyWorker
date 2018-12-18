<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form modelAttribute="Note" action="note/create.do">
	<form:hidden path="report" value="${report.id}" />
	
	<form:label path="mandatoryComment">Mandatory comment</form:label>
	<form:textarea path="mandatoryComment" />
	
	<input type="submit" name="comment" value="create" />
	
</form:form>