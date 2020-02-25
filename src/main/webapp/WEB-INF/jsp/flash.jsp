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
<c:set var="title" scope="session" value="Realizado"/>
</c:if>
<c:if test="${not empty type}">
<c:choose>
	<c:when test="${type=='success'}">
		<c:set var="title" scope="session" value="Realizado"/>
	</c:when>
	<c:when test="${type=='danger'}">
		<c:set var="title" scope="session" value="Error!!!"/>
	</c:when>
</c:choose>
</c:if>
<div class="panel panel-${type}">
	<div class="panel-heading">
		${title}
	</div>
	<div class="panel-body">
		${message}
	</div>
</div>
</c:if>