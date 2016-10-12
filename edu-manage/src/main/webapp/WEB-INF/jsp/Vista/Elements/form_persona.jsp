<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<fieldset>
		<div class="form-group">
			<form:label path="persona.nombre"><spring:message code="label.nombre"/></form:label>
			<form:input path="persona.nombre" class="form-control"/>
			<form:errors path="persona.nombre" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="persona.apellido"><spring:message code="label.apellido"/></form:label>
			<form:input path="persona.apellido" class="form-control"/>
			<form:errors path="persona.apellido" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="persona.direccion"><spring:message code="label.direccion"/></form:label>
			<form:input path="persona.direccion" class="form-control"/>
		</div>
		<div class="checkbox">
			<label>
				<form:checkbox path="persona.novedades" value="true" /><spring:message code="label.deseo_novedades"/>
			</label>
		</div>
		<div class="form-group">
			<form:label path="persona.email"><spring:message code="label.email"/></form:label>
			<form:input path="persona.email" class="form-control"/>
		</div>
		<p><spring:message code="label.revisar_email" /></p>
		<div class="form-group">
			<form:label path="persona.telefono"><spring:message code="label.telefono"/></form:label>
			<form:input path="persona.telefono" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.fecha_nacimiento"><spring:message code="label.fecha_nacimiento"/></form:label>
			<form:input path="persona.fecha_nacimiento" id="PersonaFechaNacimiento" class="form-control"/>
			<form:errors path="persona.fecha_nacimiento" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="persona.nombre_tutor" id="LabelNombreTutor"><spring:message code="label.persona_nombre_tutor"/></form:label>
			<form:input path="persona.nombre_tutor" id="PersonaNombreTutor" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="persona.telefono_tutor" id="LabelTelefonoTutor"><spring:message code="label.persona_telefono_tutor"/></form:label>
			<form:input path="persona.telefono_tutor" id="PersonaTelefonoTutor" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="persona.vinculo" id="LabelVinculo"><spring:message code="label.persona_relacion_estudiante"/></form:label>
			<form:input path="persona.vinculo" id="PersonaVinculo" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.nacionalidad"><spring:message code="label.nacionalidad"/></form:label>
			<form:select path="persona.nacionalidad" id="PersonaNacionalidadId" class="form-control">
				<form:options items="${nacionalidades}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.idioma_nativo"><spring:message code="label.idioma_nativo"/></form:label>
			<form:select path="persona.idioma_nativo" id="PersonaIdiomaNativoId" class="form-control">
				<form:options items="${idiomasNativos}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.pasaporte"><spring:message code="label.pasaporte"/></form:label>
			<form:input path="persona.pasaporte" class="form-control"/>
			<form:errors path="persona.pasaporte" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="persona.ocupacion"><spring:message code="label.ocupacion"/></form:label>
			<form:input path="persona.ocupacion" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.skype"><spring:message code="label.skype"/></form:label>
			<form:input path="persona.skype" class="form-control"/>
		</div>
		<p><spring:message code="label.agreganos_facebook"/></p>
		<div class="form-group">
			<form:label path="persona.facebook"><spring:message code="label.facebook"/></form:label>
			<form:input path="persona.facebook" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.como_supo" id="LabelComoSupoId"><spring:message code="label.como_supo"/></form:label>
			<form:select path="persona.como_supo" id="PersonaComoSupoId" class="form-control">
				<form:options items="${comoSupos}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.como_supo_otros" id="LabelComoSupoOtros"><spring:message code="label.como_supo_otros"/></form:label>
			<form:input path="persona.como_supo_otros" id="PersonaComoSupoOtros" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.tiempo_clases"><spring:message code="label.cuanto_tiempo_tomara_clases"/></form:label>
			<form:select path="persona.tiempo_clases" id="PersonaTiempoClases" class="form-control">
				<form:option value="1 dia" name="1 dia" />
				<form:option value="1 semana" name="1 semana" />
				<form:option value="1 mes" name="1 mes" />
				<form:option value="2 meses" name="2 meses" />
				<form:option value="4 meses" name="4 meses" />
				<form:option value="8 meses" name="8 meses" />
				<form:option value="Otro" name="Otro" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.motivo_estudio"><spring:message code="label.motivo_estudio"/></form:label>
			<form:input path="persona.motivo_estudio" id="PersonaMotivoEstudio" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="persona.hizo_test_nivel"><spring:message code="label.hizo_test_nivel"/></form:label>
			<form:select path="persona.hizo_test_nivel" id="PersonaHizoTestNivel" class="form-control">
				<form:option value="S" label="Si/Yes"/>
				<form:option value="N" label="No"/>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="persona.nivel_supuesto_estudiante"><spring:message code="label.nivel_supuesto_estudiante"/></form:label>
			<form:select path="persona.nivel_supuesto_estudiante" id="PersonaHizoTestNivel" class="form-control">
				<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
	</fieldset>
</div>