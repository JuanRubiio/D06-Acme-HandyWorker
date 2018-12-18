<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<display:table name="notes" id="notes" requestURI="notes/list.do" pagesize="5" class="displaytag" >
	<display:column property="moment" titleKey="moment" />
	<display:column property="mandatoryComment" titleKey="mandatory comment" />
	<display:column property="Report" titleKey="report" />
	<display:column  titleKey="View Details" />
</display:table>