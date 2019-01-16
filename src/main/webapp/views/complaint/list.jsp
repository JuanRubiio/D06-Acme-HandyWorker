<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="complaints" requestURI="${requestURI}" id="row">
	
	<!-- Attributes -->
	
	<spring:message code="complaint.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}" sortable="false" />
	
	<display:column>
	<security:authorize access="hasRole('CUSTOMER')">
		<a href="complaint/customer/show.do?complaintId=${row.id}">
			<spring:message code="complaint.show"/>
		</a>
	</security:authorize>
	<security:authorize access="hasRole('REFEREE')">
				
		<a href="complaint/referee/show.do?complaintId=${row.id}"/>
			<spring:message code="complaint.show"/>
		</a>
	</security:authorize>
	
	</display:column>
	
	
	
</display:table>

<!-- Action links -->

<security:authorize access="hasRole('CUSTOMER')">
	<div>
		<input type="button" name="create"
		value="<spring:message code="complaint.create" />"
		onclick="javascript: relativeRedir('complaint/customer/create.do');" />
	</div>
</security:authorize>