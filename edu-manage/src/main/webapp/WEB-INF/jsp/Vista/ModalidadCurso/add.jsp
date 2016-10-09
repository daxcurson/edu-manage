<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="modalidadCursos form">
<form:form method="post" action="${pageContext.request.contextPath}/modalidad_curso/add" commandName="modalidad_curso">
	<tiles:insertAttribute name="form_modalidad_curso"/>
	<input type="submit" name="agregar_modalidad" value="Agregar Modalidad">
</form:form>
</div>
<div class="actions">
	<h3>Acciones</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/modalidad_curso/index">Listar modalidades de curso</a></li>
		<li><a href="${pageContext.request.contextPath}/carga_horaria/index">Listar Cargas Horarias</a></li>
		<li><a href="${pageContext.request.contextPath}/carga_horaria/add">Nueva carga horaria</a></li>
		<li><a href="${pageContext.request.contextPath}/modalidad_pago/index">Listar modalidades de pago</a></li>
		<li><a href="${pageContext.request.contextPath}/modalidad_pago/add">Agregar modalidad de pago</a></li>
		<li><a href="${pageContext.request.contextPath}/duracion_modo/index">Listar modos de duraci&oacute;n</a></li>
		<li><a href="${pageContext.request.contextPath}/idioma_estudiar/index">Listar idiomas a estudiar</a></li>
		<li><a href="${pageContext.request.contextPath}/idioma_estudiar/add">Nuevo idioma a estudiar</a></li>
	</ul>
</div>
