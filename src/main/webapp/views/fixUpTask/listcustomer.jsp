<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<display:table name="fixUpTask" requestURI="fixUpTask/customer/listcustomer.do"
	class="displaytag">
	<display:column>
		<security:authorize access="hasRole('CUSTOMER')">
			<a href="fixUpTask/customer/show.do?fixUpTaskId=${fixUpTask.id}">show</a>
		</security:authorize>
	</display:column>
	<display:column>
			<security:authorize access="hasRole('CUSTOMER')">
				<a href="fixUpTask/customer/edit.do?fixUpTaskId=${fixUpTask.id}">edit</a>
			</security:authorize>
	</display:column>
	<display:column>
			<security:authorize access="hasRole('CUSTOMER')">
				<a href="fixUpTask/customer/edit.do[POST:delete]">delete</a>
			</security:authorize>
	</display:column>
	<display:column>
		<a href="fixUpTask/customer/show.do?fixUpTaskId=${fixUpTask.id}">show</a>
	</display:column>
	<display:column>
		<a href="fixUpTask/customer/edit.do?fixUpTaskId=${fixUpTask.id}">edit</a>
	</display:column>
	<display:column property="id" titleKey="fixUpTask.id" />
	<display:column property="ticker" titleKey="fixUpTask.ticker" />
	<display:column property="moment" titleKey="fixUpTask.moment" />
</display:table>
<br />
<a href="fixUpTask/customer/create.do">Create new Fix-up Task</a>
