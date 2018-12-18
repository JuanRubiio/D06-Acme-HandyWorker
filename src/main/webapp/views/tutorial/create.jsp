<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="tutorial/handyworker/create.do" modelAttribute="tutorial" method="post">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="momentCreate" />
	<form:hidden path="momentUpdate" />
	<form:hidden path="handyWorker" />

	<form:label path="title">
		<spring:message code="tutorial.title" />:
	</form:label>
	<form:input path="title" placeholder="title"/>
	<form:errors cssClass="error" path="title" />
	<br />
	
	<form:label path="summary">
		<spring:message code="tutorial.summary" />:
	</form:label>
	<form:input path="summary" placeholder="summary"/>
	<form:errors cssClass="error" path="summary" />
	<br />

	<form:label path="pictures">
		<spring:message code="tutorial.pictures" />:
	</form:label>
	<form:input path="pictures" placeholder="pictures"/>
	<form:errors cssClass="error" path="pictures" />
	<br />
	
	<input type="button" name="Add Sections" value="<spring:message code="section.create" />"
				onclick="javascript: relativeRedir('section/handyworker/create.do');" />
	<br />

	<input type="submit" name="Create"
		value="<spring:message code="tutorial.create"/>" />

	<input type="submit" name="Cancel"
		value="<spring:message code="tutorial.cancel" />"
		onclick="javascript: relativeRedir('tutorial/handyworker/list.do');" />


</form:form>