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


<display:table name="warranty"
	requestURI="warranty/administrator/list.do" class="displaytag">
	<display:column>
		<security:authorize access="hasRole('ADMIN')">
			<a href="warranty/administrator/show.do?warrantyId=${warranty.id}">show</a>
		</security:authorize>
	</display:column>
	<display:column>
		<jstl:if test="${warranty.draft }">
			<security:authorize access="hasRole('ADMIN')">
				<a href="warranty/administrator/edit.do?warrantyId=${warranty.id}">edit</a>
			</security:authorize>
		</jstl:if>
	</display:column>
	<display:column>
		<jstl:if test="${warranty.draft }">
			<security:authorize access="hasRole('ADMIN')">
				<a href="warranty/administrator/edit.do?[POST:delete]">delete</a>
			</security:authorize>
		</jstl:if>
	</display:column>
	<display:column property="title" titleKey="warranty.title" />
	<display:column property="terms" titleKey="warranty.terms" />
	<display:column property="laws" titleKey="warranty.laws" />
	<display:column property="draft" titleKey="warranty.draft" />
</display:table>
<br />
<security:authorize access="hasRole('ADMIN')">
	<a href="warranty/administrator/create.do">Create new warranty</a>
</security:authorize>
<br />