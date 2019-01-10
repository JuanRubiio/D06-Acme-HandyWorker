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

<!-- Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="warranty" requestURI="${requestURI}" id="row">

	<!-- Attributes -->
	<spring:message code="warranty.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="warranty.finalMode" var="finalModeHeader" />
	<display:column property="finalMode" title="${finalModeHeader}"
		sortable="true" />

	<display:column>
		<a href="warranty/administrator/show.do?warrantyId=${row.id}">
			<spring:message code="warranty.show" />
		</a>
	</display:column>

	<display:column>
		<jstl:if test="${row.finalMode == false}">
			<a href="warranty/administrator/edit.do?warrantyId=${row.id}"> <spring:message
					code="warranty.edit" />
			</a>
		</jstl:if>
	</display:column>
</display:table>

<!-- Action Links -->

<input type="button" name="create"
	value="<spring:message code="warranty.create" />"
	onclick="javascript: window.location.replace('warranty/administrator/create.do');" />

<%-- <input type="button" name="cancel"
		value="<spring:message code="warranty.cancel" />"
		onclick="javascript: window.location.replace('masterpage/administrator.do');" /> --%>