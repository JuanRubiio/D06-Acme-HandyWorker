
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<spring:message code="message.sender" />
:&nbsp;&nbsp;
<jstl:out value="${message.senderUserName}" />
<br />
<br />
<spring:message code="message.receiver" />
:&nbsp;&nbsp;
<jstl:out value="${message.receiverUserName}" />
<br />
<br />
<spring:message code="message.subject" />
:&nbsp;&nbsp;
<jstl:out value="${message.subject }" />
<br />
<spring:message code="message.moment" />
:&nbsp;&nbsp;
<jstl:out value="${message.moment}" />
<br />
<spring:message code="message.priority" />
:&nbsp;&nbsp;
<jstl:out value="${message.priority}" />
<br />
<br />
<spring:message code="message.body" />
:&nbsp;&nbsp;
<jstl:out value="${message.body}" />
<br />

<spring:message code="message.tags" />
:&nbsp;&nbsp;
<jstl:out value="${message.tags}" />
<br />
<jstl:if test="${not empty messageageboxes}">
	<h3>
		<spring:message code="row.movemessage"></spring:message>
	</h3>

	<form:form method="post" action="messageage/authenticate/move.do"
		modelAttribute="messageageMoveForm">
		<form:hidden path="messageage" />
		<table>
			<thead>
				<tr>
					<td><div>
							<form:label path="folder">
								<spring:message code="row.folder" />
							</form:label>
							<form:select path="folder" items="${folders}" itemLabel="name" />
							&nbsp;
							<form:errors path="folder" cssClass="error" />
						</div></td>
					<td><input type="submit" name="save"
						value="<spring:messageage code="row.movemessageage"/>" /></td>
				</tr>
			</thead>
		</table>



	</form:form>
</jstl:if>
<jstl:if test="${empty folders}">

	<h2 style="color: blue">
		<spring:message code="not.folder.propi" />
	</h2>

</jstl:if>

	<acme:cancel url="message/authenticate/list.do"
		code="message.back" />