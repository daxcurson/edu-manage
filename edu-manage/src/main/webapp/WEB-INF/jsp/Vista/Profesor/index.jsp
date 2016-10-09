<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h1>Profesores</h1>

<tiles:insertAttribute name="form_buscar_profesor"/>
<sec:authorize access="hasRole('ROLE_PROFESORES_ADMINISTRAR')">
<a href="${pageContext.request.contextPath}/profesores/administrar">Administrar Profesores</a>
</sec:authorize>
<br>
<sec:authorize access="hasRole('ROLE_PROFESORES_MOSTRAR_CALENDARIO')">
<a href="${pageContext.request.contextPath}/profesores/mostrar_calendario">Mostrar calendario</a>
</sec:authorize>
<br>
<sec:authorize access="hasRole('ROLE_PROFESORES_INFORME_SUELDOS')">
<a href="${pageContext.request.contextPath}/profesores/informe_sueldos">Informe de sueldos de profesores</a>
</sec:authorize>
<br>
<sec:authorize access="hasRole('ROLE_PROFESORES_LISTAR_ACTIVOS')">
<a href="${pageContext.request.contextPath}/profesores/listar_profesores_activos">Listar profesores activos con clases recientes (4 semanas)</a>
</sec:authorize>
<br>