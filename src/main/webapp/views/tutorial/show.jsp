<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="tutorial/handyworker/show.do" modelAttribute="tutorial" method="post">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="tutorial.title" />: ${tutorial.title}
	</form:label>

	<form:label path="moment create">
		<spring:message code="tutorial.momentCreate" />: ${tutorial.momentCreate}
	</form:label>
	
	<form:label path="moment update">
		<spring:message code="tutorial.momentUpdate" />: ${tutorial.momentUpdate}
	</form:label>
	
	<form:label path="summary">
		<spring:message code="tutorial.summary" />: ${tutorial.summary}
	</form:label>
	
	<form:label path="pictures">
		<spring:message code="tutorial.pictures" />: ${tutorial.pictures}
	</form:label>

	<form:label path="handy worker">
		<spring:message code="tutorial.handyWorker" />: ${tutorial.handyWorker}
	</form:label>
	

	<input type="submit" name="Cancel"
		value="<spring:message code="tutorial.cancel" />"
		onclick="javascript: relativeRedir('tutorial/handyworker/list.do');" />


</form:form>