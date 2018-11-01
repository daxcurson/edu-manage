<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
<%@include file="/WEB-INF/jsp/Vista/Inscripciones/confirmar_inscripcion.js" %> 
</script>
<div class="panel panel-info">
	<div class="panel-heading">
		<h1>Confirmar inscripci&oacute;n</h1>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="row">
<form:form method="post" action="${pageContext.request.contextPath}/inscripciones/confirmar_inscripcion/${inscripcion.id}" commandName="inscripcion">
	<fieldset>
		<div class="form-group">
			<table>
				<tr><td>Nombre:</td><td><c:out value="${inscripcion.persona.nombre}" /></td></tr>
				<tr><td>Apellido:</td><td><c:out value="${inscripcion.persona.apellido}" /></td></tr>
			</table>
		</div>
		<div class="form-group">
			<p>Filtro de curso</p>
			<form:label path="curso.tipo_curso" id="LabelTipoCurso"><spring:message code="label.curso_tipo_curso"/></form:label>
			<form:select path="curso.tipo_curso" id="CursoTipoCurso">
				<form:options items="${tipoCursos}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.idioma_estudiar" id="LabelPersonaIdiomaEstudiarId"><spring:message code="label.persona_idioma_estudiar"/></form:label>
			<form:select path="persona.idioma_estudiar" id="PersonaIdiomaEstudiarId">
				<form:options items="${idiomasEstudiar}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.nivel" id="LabelPersonaNivelId"><spring:message code="label.persona_nivel"/></form:label>
			<form:select path="persona.nivel" id="PersonaNivelId">
				<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="curso.id">Curso a confirmar</form:label>
			<form:select path="curso.id" id="InscripcionCursoId">
				<form:options items="${cursos_posibles}" itemValue="id" itemLabel="codigo_curso" />
			</form:select>
<form:input path="curso.id" id="CursoId" type="hidden"/>
<form:input path="modalidadCurso.id" id="ModalidadId" type="hidden"/>
<form:input path="fecha_comienzo" id="InscripcionFechaComienzo" type="text"/>
<form:input path="fecha_finalizacion" id="InscripcionFechaFinalizacion" type="text"/>
<input type="submit" name="confirmar_inscripcion" value="Confirmar Inscripcion">
		</div>
	</fieldset>
</form:form>

<div id="CartelInscripcion">
</div>
			</div>
		</div>
	</div>
</div>