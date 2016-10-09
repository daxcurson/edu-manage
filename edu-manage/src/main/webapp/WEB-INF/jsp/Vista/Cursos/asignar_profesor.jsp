<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@include file="/WEB-INF/jsp/Vista/Cursos/asignar_profesor.js" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.qtip-1.0.0-rc3.min.js"></script>

<h1>Asignar Profesor a Curso</h1>

<tiles:insertAttribute name="form-asignar-profesor"/>