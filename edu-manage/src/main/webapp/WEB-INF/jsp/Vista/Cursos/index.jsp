<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
<%@include file="/WEB-INF/jsp/Vista/Cursos/buscar-filtros.js" %>
</script>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1>Cursos</h1>
	</div>
	<div class="panel-body">
		<div>
			<a href="${pageContext.request.contextPath}/cursos/add">Agregar curso</a>		
		</div>
		<div id="filtro">
		</div>
		<!-- Paginador con lista de cursos -->
		<div id="tablaPaginada">
		</div>
	</div>
</div>