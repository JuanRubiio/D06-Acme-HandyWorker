<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize acces="hasRole('CUSTOMER')">
<form:form modelAttribute="Complaint" action="complaint/create.do">
<form:label path="fixUpTask">Select a FUT </form:label>
<form:select path="fixUpTask">
	<form:options items="${FixUpTasks }" itemLabel="FixUpTasks" itemValue="FixUpTask" />
		<jstl:forEach var="FixUpTask" begin="0" end="${FixUpTasks.size }">
			<form:option label="nameOfFixUpTask" value="FixUpTask.name" />
			</jstl:forEach>
		<form:option label="----" value="0" />
	</form:select>
	
	<form:label path="description">Give a description</form:label>
	<form:textarea path="description" />
	
	<form:label path="attachment">Select an attachment</form:label>
	<form:input type="file" name="attachment" path="attachment"/>
	
	<input type="submit" name="comment" value="create" />
	
</form:form>
</security:authorize>
