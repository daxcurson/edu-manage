<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

	<fieldset>
		<legend><c:out value="${titulo}" /></legend>

		<form:select path="carga_horaria">
		<form:options items="${cargas_horarias}" itemValue="id" itemLabel="descripcion" />
		</form:select>

		<div id="CargaHoraria">
		</div>
		<form:label path="es_extra">Modalidad de Extra</form:label>
		<form:checkbox path="es_extra" />		
		<form:label path="descripcion">Descripci&oacute;n</form:label>
		<form:input path="descripcion" />
		<form:label path="abreviatura">Abreviatura</form:label>
		<form:input path="abreviatura" />
		<form:label path="modalidad_pago">Modalidad de Pago</form:label>
		<form:select path="modalidad_pago">
		<form:options items="${modalidades_pago}" itemValue="id" itemLabel="descripcion" />
		</form:select>
		<form:label path="precio_unidad_modalidad">Precio por unidad de modalidad</form:label>
		<form:input path="precio_unidad_modalidad" />
		<form:label path="moneda">Moneda de pago</form:label>
		<form:select path="moneda">
		<form:options items="${monedas}" itemValue="id" itemLabel="descripcion" />
		</form:select>
		<form:label path="duracion_cantidad">Duraci&oacute;n</form:label>
		<form:input path="duracion_cantidad" />
		<form:label path="duracion_modo">Modo de Duraci&oacute;n</form:label>
		<form:select path="duracion_modo">
		<form:options items="${duraciones}" itemValue="id" itemLabel="descripcion" />
		</form:select>
	</fieldset>
	<h2>Idiomas para esta modalidad</h2>
	<p>Seleccionar los idiomas a asignar a esta modalidad</p>
	<form:checkboxes items="${idiomas_estudiar}" path="idiomas_asignados" itemValue="id" />
	<table>
	</table>
<div id="Cartel">
</div>
