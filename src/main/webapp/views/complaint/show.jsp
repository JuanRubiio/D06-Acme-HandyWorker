<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>


<tr>
	<th>Ticker</th>
	<th><jstl:out value="${fixuptask.ticker}" /></th>
</tr>

<tr>
	<th>Moment</th>
	<th>jstl:out value="${fixuptask.moment}" /></th>
</tr>

<tr>
	<th>Description</th>
	<th>jstl:out value="${fixuptask.description}" /></th>
</tr>

<tr>
	<th>Attachments</th>
	<th>jstl:out value="${fixuptask.attachments}" /></th>
</tr>