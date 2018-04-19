<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1>Cursos</h1>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="${pageContext.request.contextPath}/cursos/add">Agregar curso</a></li>
			<li><a href="${pageContext.request.contextPath}/cursos/listar_cursos_vigentes">Listar cursos vigentes</a></li>
			<li><a href="${pageContext.request.contextPath}/cursos/listar_cursos_sin_clases">Listar cursos sin clases</a></li>
		</ul>
	</div>
</div>