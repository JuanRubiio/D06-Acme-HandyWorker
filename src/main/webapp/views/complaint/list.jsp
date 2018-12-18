<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize acces="hasRole('CUSTOMER')">
<spring:message code ="listOfComplaintsCustomer" />
<display:table name="complaints" id="complaints" requestURI="complaint/list.do" pagesize="5" class="displaytag" >
	<display:column property="ticker" titleKey="Ticker" />
	<display:column property="moment" titleKey="Moment" />
	<display:column property="fixUpTask" titleKey="Fix-Up Task" />
	<display:column  titleKey="View Details" />
</display:table>
</security:authorize>
<security:authorize acces="hasRole('HANDYWORKER')">
<spring:message code ="listOfComplaintsHandyworker" />
<display:table name="complaints" id="complaints" requestURI="complaint/list.do" pagesize="5" class="displaytag" >
	<display:column property="ticker" titleKey="Ticker" />
	<display:column property="moment" titleKey="Moment" />
	<display:column property="fixUpTask" titleKey="Fix-Up Task" />
	<display:column  titleKey="View Details" />
</display:table>
</security:authorize>
