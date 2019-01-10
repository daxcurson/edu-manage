<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title"><spring:message code="label.personas"/></h1>
	</div>
	<div class="panel-body">
		<div>
		</div>
		<div id="filtroPersonas">
		</div>
		<!-- Paginador con lista de cursos -->
		<div id="tablaPaginada">
		<ul>
			<li v-for="persona in personas">{{ persona.nombre }}</li>
		</ul>
		<v-paginator :resource_url="resource_url" @update="updateResource"></v-paginator>
		</div>
	</div>
</div>