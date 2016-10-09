<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/jsp/Vista/Inscripciones/confirmar_inscripcion.js" %> 
<h1>Confirmar inscripci&oacute;n</h1>

<form:form method="post" action="${pageContext.request.contextPath}/inscripciones/confirmar_inscripcion/${inscripcion.id}" commandName="inscripcion">
<table>
<tr><td>Nombre:</td><td><c:out value="${inscripcion.persona.nombre}" /></td></tr>
<tr><td>Apellido:</td><td><c:out value="${inscripcion.persona.apellido}" /></td></tr>
<tr><td colspan="2">Filtro de curso</td></tr>
<tr><td><form:label path="curso.tipo_curso" id="LabelTipoCurso"><spring:message code="label.curso_tipo_curso"/></form:label></td><td>
<form:select path="curso.tipo_curso" id="CursoTipoCurso">
<form:options items="${tipoCursos}" itemValue="id" itemLabel="descripcion" />
</form:select></td></tr>
<tr><td><form:label path="persona.idioma_estudiar" id="LabelPersonaIdiomaEstudiarId"><spring:message code="label.persona_idioma_estudiar"/></form:label></td><td>
<form:select path="persona.idioma_estudiar" id="PersonaIdiomaEstudiarId">
<form:options items="${idiomasEstudiar}" itemValue="id" itemLabel="descripcion" />
</form:select></td></tr>
<tr><td><form:label path="persona.nivel" id="LabelPersonaNivelId"><spring:message code="label.persona_nivel"/></form:label></td><td>
<form:select path="persona.nivel" id="PersonaNivelId">
<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
</form:select></td></tr>
<tr><td>Curso a confirmar:</td><td>
<form:select path="curso.id" id="InscripcionCursoId">
<form:options items="${cursos_posibles}" itemValue="id" itemLabel="codigo_curso" />
</form:select>
</td></tr>
</table>
<form:input path="curso.id" id="CursoId" type="hidden"/>
<form:input path="modalidadCurso.id" id="ModalidadId" type="hidden"/>
<form:input path="fecha_comienzo" id="InscripcionFechaComienzo" type="text"/>
<form:input path="fecha_finalizacion" id="InscripcionFechaFinalizacion" type="text"/>
<input type="submit" name="confirmar_inscripcion" value="Confirmar Inscripcion">
</form:form>
<?php
echo $this->Element('form-precio-matricula',
	array(
		'precio_matricula'=>$precio_matricula,
		'monedas'=>$monedas,
		'moneda_matricula'=>$moneda_matricula
	));
echo $this->element('form-descuento-inscripcion');
// Muestra un cartel de que se van a ingresar cuotas cuando se confirme.
?>
<div id="CartelInscripcion">
</div>