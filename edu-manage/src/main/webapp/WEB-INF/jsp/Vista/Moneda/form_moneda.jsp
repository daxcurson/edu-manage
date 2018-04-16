<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<fieldset>
	<div class="form-moneda">
		<label for="MonedaDescripcion">Descripci&oacute;n</label>
		<form:input id="MonedaDescripcion" class="form-control" path="descripcion"/>
		<form:errors path="descripcion"/>
	</div>
	<div class="form-moneda">
		<label for="MonedaTasaCambio">Tasa de cambio</label>
		<form:input id="MonedaTasaCambio" class="form-control" path="tasa_cambio"/>
		<form:errors path="tasa_cambio"/>
	</div>
	<div class="form-moneda">
		<label for="MonedaSimbolo">S&iacute;mbolo</label>
		<form:input id="MonedaSimbolo" class="form-control" path="simbolo"/>
		<form:errors path="simbolo"/>
	</div>
</fieldset>
