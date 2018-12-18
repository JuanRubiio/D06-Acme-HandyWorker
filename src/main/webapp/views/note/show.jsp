<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<tr>
	<th>Moment</th>
	<th><jstl:out value="${note.moment}" /></th>
</tr>
<tr>
	<th>Report</th>
	<th>jstl:out value="${note.report}" /></th>
</tr>
<tr>
	<th>Mandatory comment</th>
	<th>jstl:out value="${note.mandatoryComment}" /></th>
</tr>

<tr>
	<th>Handyworker comments</th>
	<th>jstl:out value="${note.handyworkerComments}" /></th>
</tr>

<tr>
	<th>Customer comments</th>
	<th>jstl:out value="${note.customerComments}" /></th>
</tr>
<tr>
	<th>Referee comments</th>
	<th>jstl:out value="${note.refereeComments}" /></th>
</tr>