<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form:label path="inscripcionGrupal.fecha_comienzo" id="LabelInscripcionFechaComienzo"><spring:message code="label.inscripcion_fecha_comienzo"/></form:label>
<form:input path="inscripcionGrupal.fecha_comienzo" id="InscripcionFechaComienzo" />
<form:errors path="inscripcionGrupal.fecha_comienzo" cssClass="error" element="div" />

<form:label path="inscripcionGrupal.fecha_finalizacion" id="LabelInscripcionFechaFinalizacion"><spring:message code="label.inscripcion_fecha_finalizacion"/></form:label>
<form:input path="inscripcionGrupal.fecha_finalizacion" id="InscripcionFechaFinalizacion" />
<form:errors path="inscripcionGrupal.fecha_finalizacion" cssClass="error" element="div" />

<% // Pregunto por si quiere curso individual o grupal. %> 
<form:label path="inscripcionGrupal.curso.tipo_curso" id="LabelTipoCurso"><spring:message code="label.curso_tipo_curso"/></form:label>
<form:select path="inscripcionGrupal.curso.tipo_curso" id="CursoTipoCurso">
<form:options items="${tipoCursos}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:label path="persona.idioma_estudiar" id="LabelPersonaIdiomaEstudiarId"><spring:message code="label.persona_idioma_estudiar"/></form:label>
<form:select path="persona.idioma_estudiar" id="PersonaIdiomaEstudiarId">
<form:options items="${idiomasEstudiar}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:label path="persona.nivel" id="LabelPersonaNivelId"><spring:message code="label.persona_nivel"/></form:label>
<form:select path="persona.nivel" id="PersonaNivelId">
<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:input path="inscripcionGrupal.curso.id" id="CursoId" type="hidden"/>
<form:input path="inscripcionGrupal.modalidadCurso.id" id="ModalidadId" type="hidden"/>

<div id="LinkTestNivelIngles">
<p>Para tomar el test de nivel de ingl&eacute;s, haga click <a href="http://www.lvstudioweb.com/test-de-nivel-de-ingles/" target="_blank">aqu&iacute;</a>.</p>
</div>
<div id="LinkTestNivelEspanol">
<p>To take the Spanish level test, click <a href="http://www.lvstudioweb.com/spanish-level-test" target="_blank">here</a>.</p>
</div>
<p id="LabelCursosOfrecidos"><spring:message code="label.cursos_ofrecidos"/></p>
<div id="ListaCursos">

</div>
<form:errors path="inscripcionGrupal.curso.id" cssClass="error" element="div" />
<div id="ListaEspera">
<form:label path="inscripcionGrupal.lista_espera" id="LabelInscripcionIndividualListaEspera"><spring:message code="label.quiero_lista_espera"/></form:label>
<form:checkbox path="inscripcionGrupal.lista_espera" id="InscripcionIndividualListaEspera" value="1"/>
</div>