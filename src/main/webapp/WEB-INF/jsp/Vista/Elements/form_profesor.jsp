<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<table>
<tr><td align="right">
<% //Aqui va la foto del profesor %>
</td></tr>
</table>
<form:label path="nombre">Nombre del profesor</form:label>
<form:input path="nombre"/>
<form:label path="nacionalidad">Nacionalidad</form:label>
<form:select path="nacionalidad">
<form:options items="${nacionalidades}" itemValue="id" itemLabel="descripcion"/>
</form:select>
<form:label path="idioma_nativo">Idioma Nativo</form:label>
<form:select path="idioma_nativo">
<form:options items="${idiomas_nativos}" itemValue="id" itemLabel="descripcion"/>
</form:select>
<form:label path="perfil_profesor">Perfil del profesor</form:label>
<form:select path="perfil_profesor">
<form:options items="${perfiles}" itemValue="id" itemLabel="descripcion"/>
</form:select>
<form:label path="fecha_comienzo">Fecha de comienzo</form:label>
<input type="date" name="fecha_comienzo"/>
<div id="CamposSueldo" style="display:none;">
<% // Aqui van los campos de sueldo dle profesor. %>
</div>
<form:label path="email">E-mail</form:label>
<form:input path="email" />
<form:label path="email_otro">Otro E-mail</form:label>
<form:input path="email_otro" />
<form:label path="facebook">Facebook</form:label>
<form:input path="facebook" />
<form:label path="celular">Tel&eacute;fono celular</form:label>
<form:input path="celular" />
<form:label path="disponibilidad">Disponibilidad</form:label>
<form:input path="disponibilidad" />
<form:label path="anos_experiencia">A&ntilde;os de experiencia</form:label>
<form:input path="anos_experiencia" />
<h2>Idiomas para este profesor</h2>
<p>Seleccionar los idiomas a asignar a este profesor</p>
<form:checkboxes items="${idiomas}" path="idiomasEnsenados"
itemLabel="descripcion" itemValue="id" delimiter="<br/>"
/>