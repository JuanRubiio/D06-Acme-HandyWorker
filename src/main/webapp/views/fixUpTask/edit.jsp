<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="fixUpTask/customer/edit.do"
	modelAttribute="fixUpTask" method="post">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="ticker" />
	<form:hidden path="moment" />
	<form:hidden path="customer" />

	<security:authorize access="hasRole('REFEREE')">

		<form:label path="description">
			<spring:message code="fixUpTask.description" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="description" />
		</jstl:if>
		<form:input path="description" value="${fixUpTask.description}" />
		<form:errors cssClass="error" path="description" />
		<br />


		<form:label path="address">
			<spring:message code="fixUpTask.address" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="address" />
		</jstl:if>
		<form:input path="address" value="${fixUpTask.address}" />
		<form:errors cssClass="error" path="address" />
		<br />


		<form:label path="minPrice">
			<spring:message code="fixUpTask.minPrice" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="minPrice" />
		</jstl:if>
		<form:input path="minPrice" placeholder="${fixUpTask.minPrice}" />
		<form:errors cssClass="error" path="minPrice" />
		<br />


		<form:label path="maxPrice">
			<spring:message code="fixUpTask.maxPrice" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="maxPrice" />
		</jstl:if>
		<form:input path="maxPrice" placeholder="${fixUpTask.maxPrice}" />
		<form:errors cssClass="error" path="maxPrice" />
		<br />


		<form:label path="minDate">
			<spring:message code="fixUpTask.minDate" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="minDate" />
		</jstl:if>
		<form:input path="minDate" placeholder="${fixUpTask.minDate}" />
		<form:errors cssClass="error" path="minDate" />
		<br />


		<form:label path="maxDate">
			<spring:message code="fixUpTask.maxDate" />:
		</form:label>
		<jstl:if test="${fixUpTask.version==0 }">
			<form:input path="maxDate" />
		</jstl:if>
		<form:input path="maxDate" placeholder="${fixUpTask.maxDate}" />
		<form:errors cssClass="error" path="maxDate" />
		<br />


		<form:label path="category">
			<spring:message code="fixUpTask.category" />:
		</form:label>
		<form:select id="categories" path="category">
			<form:options items="${categories}" itemLabel="name" itemValue="id" />
			<form:option value="0" label="----" />
		</form:select>
		<br />


		<form:label path="warranty">
			<spring:message code="fixUpTask.warranty" />:
		</form:label>
		<form:select id="warranties" path="warranty">
			<form:options items="${warranties}" itemLabel="title" itemValue="id" />
			<form:option value="0" label="----" />
		</form:select>
		<br />


		<form:label path="applications">
			<spring:message code="fixUpTask.applications" />:
		</form:label>
		<form:select id="applications" path="application">
			<form:options items="${applications}" itemLabel="id" itemValue="id" />
			<form:option value="0" label="----" />
		</form:select>
		<input type="submit" name="addApplication">
		<i class="fas fa-plus"></i>
		</input>
		<!-- boton añadir application -->
		<br />
		<!-- boton guardar -->
		<!-- boton cancelar -->




		<input type="submit" name="save"
			value="<spring:message code="fixUpTask.save"/>" />

		<input type="button" name="cancel"
			value="<spring:message code="fixUpTask.cancel" />"
			onclick="javascript: relativeRedir('fixUpTask/customer/list.do');" />
	</security:authorize>

</form:form>