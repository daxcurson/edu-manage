<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Conjunto de tarjetas con alguna informacion que tiene que estar a primera vista 
-->

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Men&uacute; principal</h1>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Estudiantes que terminan hoy</h3>
						</div>
						<div class="card-body">
							<tiles:insertAttribute name="inscripcion_estudiantes_terminan_hoy"/>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Cursos que terminan hoy</h3>
						</div>
						<div class="card-body">
							<tiles:insertAttribute name="cursos_terminan_hoy"/>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Clases de hoy</h3>
						</div>
						<div class="card-body">
							<tiles:insertAttribute name="clases_hoy"/>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<h1>Men&uacute; principal</h1>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header"><h3>Estudiantes</h3></div>
						<div class="card-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/inscripciones/inscribir">Inscribir</a></li>
							<li><a href="${pageContext.request.contextPath}/inscripciones/listar_inscripciones_confirmar">Confirmar</a></li>
						</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header"><h3>Cursos</h3></div>
						<div class="card-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/cursos/listar_cursos_vigentes">Listar vigentes</a></li>
							<li><a href="${pageContext.request.contextPath}/cursos/add">Agregar</a></li>
						</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header"><h3>Configuraci&oacute;n</h3></div>
						<div class="card-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/modalidades_curso/index">Modalidades de curso</a></li>
							<li><a href="${pageContext.request.contextPath}/configuracion/feriados">Feriados</a></li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>