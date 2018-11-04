<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<legend><c:out value="${titulo}" /></legend>
<div class="col-md-12">
	<fieldset>
		<div class="form-group col-md-12">
			<form:label path="carga_horaria">Carga Horaria</form:label>
			<form:select class="form-control" path="carga_horaria">
			<form:options items="${cargas_horarias}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>

		<div class="form-group col-md-12">
			<div id="CargaHoraria">
			</div>
		</div>
		<div class="form-group col-md-12">
			<form:label path="es_extra">Modalidad de Extra</form:label>
			<form:checkbox class="form-control" path="es_extra" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="descripcion">Descripci&oacute;n</form:label>
			<form:input class="form-control" path="descripcion" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="abreviatura">Abreviatura</form:label>
			<form:input class="form-control" path="abreviatura" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="modalidad_pago">Modalidad de Pago</form:label>
			<form:select class="form-control" path="modalidad_pago">
				<form:options items="${modalidades_pago}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group col-md-12">
			<form:label path="precio_unidad_modalidad">Precio por unidad de modalidad</form:label>
			<form:input class="form-control" path="precio_unidad_modalidad" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="moneda">Moneda de pago</form:label>
			<form:select class="form-control" path="moneda">
				<form:options items="${monedas}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group col-md-12">
			<form:label path="duracion_cantidad">Duraci&oacute;n</form:label>
			<form:input class="form-control" path="duracion_cantidad" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="duracion_modo">Modo de Duraci&oacute;n</form:label>
			<form:select class="form-control" path="duracion_modo">
			<form:options items="${duraciones}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
	</fieldset>
	<h2>Idiomas para esta modalidad</h2>
	<p>Seleccionar los idiomas a asignar a esta modalidad</p>
	<form:checkboxes class="form-control" items="${idiomas_estudiar}" path="idiomas_asignados" itemValue="id" />
	<table>
	</table>
<div id="Cartel">
</div>
