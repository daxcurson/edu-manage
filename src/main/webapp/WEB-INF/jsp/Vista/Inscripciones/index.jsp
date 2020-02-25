<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Inscripciones</h1>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="row">
				<ul>
					<li><a href="${pageContext.request.contextPath}/inscripciones/inscribir">Inscribir nuevo estudiante</a></li>
					<li><a href="${pageContext.request.contextPath}/inscripciones/listar_inscripciones_confirmar">Listar inscripciones a confirmar</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
