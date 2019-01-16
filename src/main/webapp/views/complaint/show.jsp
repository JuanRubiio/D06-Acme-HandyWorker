<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<h1><jstl:out value="${complaint.ticker }"></jstl:out></h1>

<div>

	<p><spring:message code="complaint.description"/>: <jstl:out value="${complaint.description }"></jstl:out></p>
	<p><spring:message code="complaint.attachements"/>: <jstl:out value="${complaint.attachements }"></jstl:out></p>
</div>
<br/>
<security:authorize access="hasRole('REFEREE')">
<input type="button" name="createReport"
		value="<spring:message code="complaint.assign" />"
		onclick="javascript: relativeRedir('report/referee/create.do?complaintId=${complaint.id}');" />
<br/>
</security:authorize>
<input type="button" name="cancel"
		value="<spring:message code="complaint.cancel" />"
		onclick="javascript: relativeRedir('complaint/customer/list.do');" />
<br/>