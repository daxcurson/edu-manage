<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<fieldset>
		<div class="form-group">
			<form:label path="inscripcionIndividual.sucursal" id="LabelSucursalId"><spring:message code="label.inscripcion_sucursal"/></form:label>
			<form:select path="inscripcionIndividual.sucursal" id="InscripcionIndividualSucursalId" class="form-control">
			<form:options items="${sucursales}" itemValue="id" itemLabel="nombre" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.idioma_estudiar" id="LabelIdiomaEstudiar"><spring:message code="label.inscripcion_individual_idioma_estudiar"/></form:label>
			<form:select path="inscripcionIndividual.idioma_estudiar" id="InscripcionIndividualIdiomaEstudiarId" class="form-control">
				<form:options items="${idiomasIndividuales}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.nivel" id="LabelNivelId"><spring:message code="label.inscripcion_individual_nivel"/></form:label>
			<form:select path="inscripcionIndividual.nivel" id="InscripcionIndividualNivelId" class="form-control">
				<form:options items="${niveles}" itemValue="id" itemLabel="descripcion"/>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.materia" id="LabelMateria"><spring:message code="label.inscripcion_individual_materia"/></form:label>
			<form:input path="inscripcionIndividual.materia" id="InscripcionIndividualMateria" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.clases_semanales" id="LabelClasesSemanales"><spring:message code="label.inscripcion_individual_clases_semanales"/></form:label>
			<form:select path="inscripcionIndividual.clases_semanales" id="InscripcionIndividualClasesSemanales" class="form-control">
				<form:option value="1" label="1"/>
				<form:option value="2" label="2"/>
				<form:option value="3" label="3"/>
				<form:option value="4" label="4"/>
				<form:option value="5" label="5"/>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.horas_clase" id="LabelHorasClase"><spring:message code="label.inscripcion_individual_horas_clase"/></form:label>
			<form:select path="inscripcionIndividual.horas_clase" id="InscripcionIndividualHorasClase" class="form-control">
				<form:option value="1 hora"><spring:message code="label.inscripcion_individual_1_hora"/></form:option>
				<form:option value="1 hora y media"><spring:message code="label.inscripcion_individual_1_hora_media"/></form:option>
				<form:option value="2 horas"><spring:message code="label.inscripcion_individual_2_horas"/></form:option>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.fecha_comienzo" id="LabelFechaEstimadaComienzo"><spring:message code="label.inscripcion_individual_fecha_estimada_comienzo"/></form:label>
			<form:input path="inscripcionIndividual.fecha_comienzo" id="InscripcionIndividualFechaEstimadaComienzo" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.dias_preferidos" id="LabelDiasPreferidos"><spring:message code="label.inscripcion_individual_dias_preferidos"/></form:label>
			<form:input path="inscripcionIndividual.dias_preferidos" id="InscripcionIndividualDiasPreferidos" class="form-control"/>
			<form:errors path="inscripcionIndividual.dias_preferidos" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.horario_preferido" id="LabelHorarioPreferido"><spring:message code="label.inscripcion_individual_horario_preferido"/></form:label>
			<form:input path="inscripcionIndividual.horario_preferido" id="InscripcionIndividualHorarioPreferido" class="form-control"/>
			<form:errors path="inscripcionIndividual.horario_preferido" cssClass="error" element="div" />
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.dias_alternativos" id="LabelDiasAlternativos"><spring:message code="label.inscripcion_individual_dias_alternativos"/></form:label>
			<form:input path="inscripcionIndividual.dias_alternativos" id="InscripcionIndividualDiasAlternativos" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.horario_alternativo" id="LabelHorarioAlternativo"><spring:message code="label.inscripcion_individual_horario_alternativo"/></form:label>
			<form:input path="inscripcionIndividual.horario_alternativo" id="InscripcionIndividualHorarioAlternativo" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.sexo_profesor" id="LabelSexoProfesor"><spring:message code="label.inscripcion_individual_sexo_profesor"/></form:label>
			<form:select path="inscripcionIndividual.sexo_profesor" id="InscripcionIndividualSexoProfesor" class="form-control">
				<form:option value="Hombre"><spring:message code="label.inscripcion_individual_hombre"/></form:option>
				<form:option value="Mujer"><spring:message code="label.inscripcion_individual_mujer"/></form:option>
				<form:option value="Indistinto"><spring:message code="label.inscripcion_individual_indistinto"/></form:option>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.preferencia_idioma" id="LabelVariante">&iquest;Qu&eacute; variante prefiere?</form:label>
			<form:select path="inscripcionIndividual.preferencia_idioma" id="InscripcionIndividualPreferenciaIdioma" class="form-control">
				<form:option value="American">American</form:option>
				<form:option value="British">British</form:option>
				<form:option value="Australian">Australian</form:option>
				<form:option value="Indistinto">Indistinto</form:option>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.orientacion" id="LabelOrientacionId"><spring:message code="label.inscripcion_individual_orientacion"/></form:label>
			<form:select path="inscripcionIndividual.orientacion" id="InscripcionIndividualOrientacionId" class="form-control">
				<form:options items="${orientaciones}" itemValue="id" itemLabel="descripcion"/>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.cual_examen" id="LabelExamen"><spring:message code="label.inscripcion_individual_cual_examen"/></form:label>
			<form:input path="inscripcionIndividual.cual_examen" id="InscripcionIndividualCualExamen" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="inscripcionIndividual.otra_orientacion" id="LabelOtraOrientacion"><spring:message code="label.inscripcion_individual_otra_orientacion"/></form:label>
			<form:input path="inscripcionIndividual.otra_orientacion" id="InscripcionIndividualOtraOrientacion" class="form-control"/>
		</div>
	</fieldset>
</div>