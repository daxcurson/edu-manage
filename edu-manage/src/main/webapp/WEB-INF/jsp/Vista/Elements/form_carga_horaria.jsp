<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<fieldset>
		<legend>Editar Carga Horaria</legend>
		<form:label path="tipo_curso">Modalidad de Cursada</form:label>
		<form:select path="tipo_curso">
		<form:options items="${tiposcurso}" itemValue="id" itemLabel="descripcion" />
		</form:select>
		<form:label path="descripcion">Descripci&oacute;n</form:label>
		<form:input path="descripcion" />
		<form:label path="horas_semanales">Horas semanales</form:label>
		<form:input path="horas_semanales" />
		<form:label path="dias_semana">D&iacute;as por Semana</form:label>
		<form:input path="dias_semana" />
		<form:label path="horas_clase">Horas por clase</form:label>
		<form:input path="horas_clase" />
	</fieldset>