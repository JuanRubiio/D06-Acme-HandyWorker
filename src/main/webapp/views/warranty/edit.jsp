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

<form:form action="warranty/administrator/edit.do"
	modelAttribute="warranty">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="warranty.title" />:
		</form:label>
	<form:input path="title" />
	<form:errors cssClass="error" path="title" />
	<br />
	<br />
	<div>
		<form:label path="terms">
			<spring:message code="warranty.terms" />:
		</form:label>
	</div>
	<form:textarea path="terms" />
	<form:errors cssClass="error" path="terms" />
	<br />
	<br />
	<div>
		<form:label path="laws">
			<spring:message code="warranty.laws" />:
		</form:label>
	</div>
	<form:textarea path="laws" />
	<form:errors cssClass="error" path="laws" />
	<br />
	<br />
	<form:label path="finalMode">
		<spring:message code="warranty.finalMode" />:
		</form:label>
	<form:select id="warranty" path="finalMode" multiple="false">
		<form:option value="${true}">true</form:option>
		<form:option value="${false}">false</form:option>
	</form:select>
	<form:errors cssClass="error" path="finalMode" />
	<br />
	<br />

	<!-- Action Links -->

	<jstl:if test="${warranty.id!=0 }">
		<input type="submit" name="save"
			value="<spring:message code="warranty.update" />" />&nbsp; 
		</jstl:if>

	<jstl:if test="${warranty.id==0 }">
		<input type="submit" name="save"
			value="<spring:message code="warranty.save" />" />&nbsp; 
		</jstl:if>

	<jstl:if test="${warranty.id!=0 }">
		<input type="submit" name="delete"
			value="<spring:message code="warranty.delete" />"
			onclick="return confirm('<spring:message code="warranty.confirm.delete" />')" />&nbsp;
		</jstl:if>

	<input type="button" name="cancel"
		value="<spring:message code="warranty.cancel" />"
		onclick="javascript: window.location.replace('warranty/administrator/list.do');" />

</form:form>