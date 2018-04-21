<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1>Cursos</h1>
	</div>
	<div class="panel-body">
		<div>
			<a href="${pageContext.request.contextPath}/cursos/add">Agregar curso</a>		
		</div>
		<div>
		<!-- Paginador con lista de cursos -->
		</div>
	</div>
</div>