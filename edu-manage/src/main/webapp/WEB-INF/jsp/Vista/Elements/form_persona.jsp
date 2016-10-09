<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form:label path="persona.nombre"><spring:message code="label.nombre"/></form:label>
<form:input path="persona.nombre" />
<form:errors path="persona.nombre" cssClass="error" element="div" />
<form:label path="persona.apellido"><spring:message code="label.apellido"/></form:label>
<form:input path="persona.apellido" />
<form:errors path="persona.apellido" cssClass="error" element="div" />
<form:label path="persona.direccion"><spring:message code="label.direccion"/></form:label>
<form:input path="persona.direccion" />

<% // Pregunto si quiere recibir novedades (#118). %>
<table>
<tr>
<td><form:checkbox path="persona.novedades" value="true" /></td>
<td><form:label path="persona.novedades"><spring:message code="label.deseo_novedades"/></form:label>
</tr>
</table>
<%
// #281 - Cartel en inscripcion.
%>
<p><spring:message code="label.revisar_email" /></p>

<form:label path="persona.email"><spring:message code="label.email"/></form:label>
<form:input path="persona.email" />
<form:label path="persona.telefono"><spring:message code="label.telefono"/></form:label>
<form:input path="persona.telefono" />

<form:label path="persona.fecha_nacimiento"><spring:message code="label.fecha_nacimiento"/></form:label>
<form:input path="persona.fecha_nacimiento" id="PersonaFechaNacimiento" />
<form:errors path="persona.fecha_nacimiento" cssClass="error" element="div" />

<form:label path="persona.nombre_tutor" id="LabelNombreTutor"><spring:message code="label.persona_nombre_tutor"/></form:label>
<form:input path="persona.nombre_tutor" id="PersonaNombreTutor" />
<form:label path="persona.telefono_tutor" id="LabelTelefonoTutor"><spring:message code="label.persona_telefono_tutor"/></form:label>
<form:input path="persona.telefono_tutor" id="PersonaTelefonoTutor" />
<form:label path="persona.vinculo" id="LabelVinculo"><spring:message code="label.persona_relacion_estudiante"/></form:label>
<form:input path="persona.vinculo" id="PersonaVinculo" />

<form:label path="persona.nacionalidad"><spring:message code="label.nacionalidad"/></form:label>
<form:select path="persona.nacionalidad" id="PersonaNacionalidadId">
<form:options items="${nacionalidades}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:label path="persona.idioma_nativo"><spring:message code="label.idioma_nativo"/></form:label>
<form:select path="persona.idioma_nativo" id="PersonaIdiomaNativoId">
<form:options items="${idiomasNativos}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:label path="persona.pasaporte"><spring:message code="label.pasaporte"/></form:label>
<form:input path="persona.pasaporte"/>
<form:errors path="persona.pasaporte" cssClass="error" element="div" />
<form:label path="persona.ocupacion"><spring:message code="label.ocupacion"/></form:label>
<form:input path="persona.ocupacion"/>
<form:label path="persona.skype"><spring:message code="label.skype"/></form:label>
<form:input path="persona.skype"/>

<% // #88 - Agregar solicitud de facebook %>

<p><spring:message code="label.agreganos_facebook"/></p>

<form:label path="persona.facebook"><spring:message code="label.facebook"/></form:label>
<form:input path="persona.facebook"/>

<form:label path="persona.como_supo" id="LabelComoSupoId"><spring:message code="label.como_supo"/></form:label>
<form:select path="persona.como_supo" id="PersonaComoSupoId">
<form:options items="${comoSupos}" itemValue="id" itemLabel="descripcion" />
</form:select>

<form:label path="persona.como_supo_otros" id="LabelComoSupoOtros"><spring:message code="label.como_supo_otros"/></form:label>
<form:input path="persona.como_supo_otros" id="PersonaComoSupoOtros"/>

<form:label path="persona.tiempo_clases"><spring:message code="label.cuanto_tiempo_tomara_clases"/></form:label>
<form:select path="persona.tiempo_clases" id="PersonaTiempoClases">
<form:option value="1 dia" name="1 dia" />
<form:option value="1 semana" name="1 semana" />
<form:option value="1 mes" name="1 mes" />
<form:option value="2 meses" name="2 meses" />
<form:option value="4 meses" name="4 meses" />
<form:option value="8 meses" name="8 meses" />
<form:option value="Otro" name="Otro" />
</form:select>

<form:label path="persona.motivo_estudio"><spring:message code="label.motivo_estudio"/></form:label>
<form:input path="persona.motivo_estudio" id="PersonaMotivoEstudio"/>

<form:label path="persona.hizo_test_nivel"><spring:message code="label.hizo_test_nivel"/></form:label>
<form:select path="persona.hizo_test_nivel" id="PersonaHizoTestNivel">
<form:option value="S" label="Si/Yes"/>
<form:option value="N" label="No"/>
</form:select>

<form:label path="persona.nivel_supuesto_estudiante"><spring:message code="label.nivel_supuesto_estudiante"/></form:label>
<form:select path="persona.nivel_supuesto_estudiante" id="PersonaHizoTestNivel">
<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
</form:select>