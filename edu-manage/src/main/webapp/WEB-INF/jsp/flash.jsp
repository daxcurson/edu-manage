<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
/*
Los tipos de mensaje pueden ser:
	alert-success
	alert-info
	alert-warning
	alert-danger
*/
%>
<c:if test="${not empty message}">
<c:if test="${empty type}">
<c:set var="type" scope="session" value="success"/>
</c:if>
<div class="alert ${type}">
${message}
</div>
</c:if>