<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<fieldset>
	<legend><c:out value="${titulo}" /></legend>
	<form:label path="descripcion">Descripci&oacute;n</form:label>
	<form:input path="descripcion" />
	<form:label path="precio_por_hora">Precio por hora</form:label>
	<form:input path="precio_por_hora"/>
	<form:label path="moneda">Moneda</form:label>
	<form:select path="moneda">
	<form:options items="${monedas}" itemValue="id" itemLabel="descripcion" />
	</form:select>
	<form:label path="idioma_estudiar">Idioma al que se asigna</form:label>
	<form:select path="idioma_estudiar">
	<form:options items="${idiomas}" itemValue="id" itemLabel="descripcion" />
	</form:select>
</fieldset>