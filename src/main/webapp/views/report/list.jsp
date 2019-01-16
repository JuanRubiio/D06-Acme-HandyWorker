<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<security:authorize access="hasRole('REFEREE')">
	<display:table name="${reports}" id="report" pagesize=5
		requestURI="${requestURI}" class="displaytag">
		<display:column>
			<jstl:if test="${!report.draft }">
				<security:authorize access="hasRole('REFEREE')">
					<input type="submit" name="show"
						value="<spring:message code="warranty.show" />"
						onclick="javascript: relativeRedir('report/referee/show.do?reportId=${report.id}');" />
				</security:authorize>
			</jstl:if>
			<jstl:if test="${report.draft }">
				<security:authorize access="hasRole('REFEREE')">
					<input type="submit" name="show"
						value="<spring:message code="warranty.show" />"
						onclick="javascript: relativeRedir('report/referee/edit.do?reportId=${report.id}');" />
				</security:authorize>
			</jstl:if>
			<input type="submit" name="show"
				value="<spring:message code="warranty.show" />"
				onclick="javascript: relativeRedir('eport/referee/delete.do?reportId=${report.id}');" />
</display:column>
<display:column property="id" titleKey="report.id" />
<display:column property="moment" titleKey="report.moment" />
<display:column property="description" titleKey="report.description" />
<display:column property="draft" titleKey="report.draft" />
</display:table>
<br />
</security:authorize>