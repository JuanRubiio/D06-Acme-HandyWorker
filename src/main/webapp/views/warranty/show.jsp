<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p>
	<spring:message code="warranty.title" />
	:
	<jstl:out value="${warranty.title }"></jstl:out>
</p>
<!-- <p> -->
<%-- 	<spring:message code="warranty.finalMode" /> --%>
<!-- 	: -->
<%-- 	<jstl:out value="${warranty.finalMode }"></jstl:out> --%>
<!-- </p> -->
<p>
	<spring:message code="warranty.terms" />
	:
	<jstl:out value="${warranty.terms }"></jstl:out>
</p>
<p>
	<spring:message code="warranty.laws" />
	:
	<jstl:out value="${warranty.laws }"></jstl:out>
</p>