<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title"><spring:message code="label.configuracion"/></h1>
	</div>
	<div class="panel-body">
		<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/carga_horaria/index">Configurar cargas horarias</a></li>
			<li><a href="${pageContext.request.contextPath}/modalidad_curso/index">Configurar modalidades de curso</a></li>
			<li><a href="${pageContext.request.contextPath}/monedas/index">Configurar monedas y tasas de cambio</a></li>
			<li><a href="${pageContext.request.contextPath}/permisos/index">Cambiar Permisos</a></li>
		</ul>
		</div>
	</div>
</div>