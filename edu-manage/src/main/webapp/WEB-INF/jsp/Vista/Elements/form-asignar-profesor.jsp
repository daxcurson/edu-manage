<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/jsp/Vista/Cursos/control-calendario-cursos.js" %>

<style>
#calendario {
font-size: 10px;
overflow:hidden;
}
 .fc-agenda-slots td div
    {
         height: 1px !important;
    }
</style>

<p>
Hacer click en el horario donde se desea asignar una clase. Se mostrar&aacute; un
formulario donde se podr&aacute; completar el resto de los datos de la asignaci&oacute;n.
</p>

<div id="calendario">

</div>
<form:form modelAttribute="curso" method="POST">
<input type="submit" value="Asignar Profesor"/>
</form:form>



<div id="DialogoCrearClase" title="Creaci&oacute;n de Clase">
<script type="text/javascript">
$(document).ready(
function()
{
	buscar_precio("CrearClase");
}
);
</script>
<table>
<form:form modelAttribute="horario_curso">
<form:input type="hidden" path="calendar_id" id="CrearClaseId"/>
<form:input type="hidden" path="fecha" id="CrearClaseFecha"/>
<tr><td>Dia de Semana:</td><td>
<form:input path="dia_semana" type="text" id="CrearClaseDiaSemana"/></td></tr>
<tr><td>Desde:</td><td>
<form:input path="hora_inicio" type="time" id="CrearClaseHoraDesde"/>
</td></tr>
<tr><td>Hasta:</td><td>
<form:input path="hora_fin" type="time" id="CrearClaseHoraHasta"/>
</td></tr>
<tr><td colspan="2">Repetir los d&iacute;as:</td></tr>
<tr id="FilaMonday" class="diaSemana"><td></td><td>Lunes</td></tr>
<tr id="FilaTuesday" class="diaSemana"><td></td><td>Martes</td></tr>
<tr id="FilaWednesday" class="diaSemana"><td></td><td>Mi&eacute;rcoles</td></tr>
<tr id="FilaThursday" class="diaSemana"><td></td><td>Jueves</td></tr>
<tr id="FilaFriday" class="diaSemana"><td></td><td>Viernes</td></tr>
<tr id="FilaSaturday" class="diaSemana"><td></td><td>S&aacute;bado</td></tr>
<tr><td>Sucursal</td><td>
<form:select path="sucursal" id="CrearClaseSucursal">
<form:options items="${sucursales}" itemValue="id" itemLabel="nombre"/>
</form:select></td></tr>
<tr><td>Profesor</td><td><form:select path="profesor" id="CrearClaseProfesor">
<form:options items="${profesores}" itemValue="id" itemLabel="nombre"/>
</form:select></td></tr>
<tr><td>Honorario</td><td><form:select path="honorario" id="CrearClaseHonorario">
</form:select></td></tr>
<tr><td>Precio por hora</td><td><form:input path="precio_por_hora" id="CrearClasePrecioHoraProfesor"/></td></tr>
<tr><td>Moneda</td><td><form:select path="moneda" id="CrearClaseMoneda">
<form:options items="${monedas}" itemValue="id" itemLabel="descripcion"/>
</form:select></td></tr>
</form:form>
</table>
</div>
<div id="DialogoEditarClase" title="Edici&oacute;n de horas de clase">
<script type="text/javascript">
$(document).ready(
function()
{
	buscar_precio("EditarClase");
}
);
</script>
<table>
<form:form modelAttribute="horario_curso">
<input type="hidden" name="editar_clase_fecha" id="EditarClaseFecha"/>
<input type="hidden" name="editar_clase_id" id="EditarClaseId"/>
<tr><td>Dia de Semana:</td><td colspan="2"><input name="editar_clase_dia_semana" type="text" id="EditarClaseDiaSemana"></td></tr>
<tr><td>Desde:</td><td nowrap>:</td><td><input name="editar_clase_hora_desde" type="time" id="EditarClaseHoraDesde"></td></tr>
<tr><td>Hasta:</td><td nowrap>:</td><td><input name="editar_clase_hora_hasta" type="time" id="EditarClaseHoraHasta"></td></tr>
<tr><td colspan="2">Sucursal</td><td><form:select path="sucursal" id="CrearClaseSucursal">
<form:options items="${sucursales}" itemValue="id" itemLabel="nombre"/>
</form:select></td></tr>
<tr><td>Profesor</td><td><form:select path="profesor" id="CrearClaseProfesor">
<form:options items="${profesores}" itemValue="id" itemLabel="nombre"/>
</form:select></td></tr>
<tr><td>Honorario</td><td><form:select path="honorario" id="CrearClaseHonorario">
</form:select></td></tr>
<tr><td>Precio por hora</td><td><form:input path="precio_por_hora" id="CrearClasePrecioHoraProfesor"/></td></tr>
<tr><td>Moneda</td><td><form:select path="moneda" id="CrearClaseMoneda">
<form:options items="${monedas}" itemValue="id" itemLabel="descripcion"/>
</form:select></td></tr>
</form:form>
</table>
</div>