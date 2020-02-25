<?php
/*
Nuevo asignador de profesores. Voy a tener una solapa por cada profesor, y una solapa
donde esten todas las clases del curso. 

Primero viene un tab general con el calendario con horarios propuestos, despues una
tab por cada profesor.

Le voy a mandar, derecho viejo, includes por cada js para control de calendario.
*/
include(APP.'View'.DS.'cursos/control-calendario-cursos.js');

/*
En toda esta fiesta, el campo existen_clases es fundamental. Requiere que este seteado para
que en el controller se diferencie el codigo que programa las clases de aquel que solamente asigna
los profesores.
*/
echo $this->Form->hidden('Asignacion.existen_clases',array('value'=>$existen_clases));
?>
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
<div id="calendario">

</div>
<div id="DialogoCrearClase" title="Creaci&oacute;n de Clase">
<script type="text/javascript">
$(document).ready(
function()
{
	buscar_precio(2);
}
);
</script>
<table>
<tr><td>Fecha:</td><td colspan="2"><input name="crear_clase_dia_semana" type="text" id="CrearClaseDiaSemana"></td></tr>
<input type="hidden" name="crear_clase_fecha" id="CrearClaseFecha">
<input type="hidden" name="crear_clase_id" id="CrearClaseId">
<tr><td>Desde:</td><td nowrap><?php echo $this->Form->hour("hora_desde",true);?>:</td><td><?php echo $this->Form->minute("minuto_desde",array('interval'=>15,'empty'=>false)); ?></td></tr>
<tr><td>Hasta:</td><td nowrap><?php echo $this->Form->hour("hora_hasta",true);?>:</td><td><?php echo $this->Form->minute("minuto_hasta",array('interval'=>15,'empty'=>false)); ?></td></tr>
<tr><td colspan="3">Repetir los d&iacute;as:</td></tr>
<tr id="FilaMonday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Monday"); ?></td><td colspan="2">Lunes</td></tr>
<tr id="FilaTuesday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Tuesday"); ?></td><td colspan="2">Martes</td></tr>
<tr id="FilaWednesday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Wednesday"); ?></td><td colspan="2">Mi&eacute;rcoles</td></tr>
<tr id="FilaThursday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Thursday"); ?></td><td colspan="2">Jueves</td></tr>
<tr id="FilaFriday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Friday"); ?></td><td colspan="2">Viernes</td></tr>
<tr id="FilaSaturday" class="diaSemana"><td><?php echo $this->Form->checkbox("repetir_Saturday"); ?></td><td colspan="2">S&aacute;bado</td></tr>
</table>
<?php
echo $this->Form->input('profesor_id',array('type'=>'select','options'=>$profesores,'id'=>'AsignacionCrearProfesorId'));
echo $this->Form->input('honorario_profesor_id',array('type'=>'select','options'=>$honorarios,'id'=>'Profesor2Honorario','onChange'=>array('buscar_precio(1)')));
echo $this->Form->input('precio_hora_profesor',array('id'=>'Profesor2PrecioHoraProfesor'));
echo $this->Form->input('moneda_id',array('id'=>'Profesor2MonedaId'));
echo $this->Form->input('sucursal_id',array('type'=>'select','options'=>$sucursales));
?>
</div>
<div id="DialogoEditarClase" title="Edici&oacute;n de horas de clase">
<script type="text/javascript">
$(document).ready(
function()
{
	buscar_precio(1);
}
);
</script>
<table>
<tr><td>Fecha:</td><td colspan="2"><input name="editar_clase_dia_semana" type="text" id="EditarClaseDiaSemana"></td></tr>
<input type="hidden" name="editar_clase_fecha" id="EditarClaseFecha">
<input type="hidden" name="editar_clase_id" id="EditarClaseId">
<tr><td>Desde:</td><td nowrap><?php echo $this->Form->hour("edit_hora_desde",true);?>:</td><td><?php echo $this->Form->minute("edit_minuto_desde",array('interval'=>15,'empty'=>false)); ?></td></tr>
<tr><td>Hasta:</td><td nowrap><?php echo $this->Form->hour("edit_hora_hasta",true);?>:</td><td><?php echo $this->Form->minute("edit_minuto_hasta",array('interval'=>15,'empty'=>false)); ?></td></tr>
</table>
<?php
echo $this->Form->input('profesor_id',array('type'=>'select','options'=>$profesores,'id'=>'AsignacionEditProfesorId'));
echo $this->Form->input('honorario_profesor_id',array('type'=>'select','options'=>$honorarios,'id'=>'Profesor1Honorario','onChange'=>array('buscar_precio(1)')));
echo $this->Form->input('precio_hora_profesor',array('id'=>'Profesor1PrecioHoraProfesor'));
echo $this->Form->input('moneda_id',array('id'=>'Profesor1MonedaId'));
echo $this->Form->input('sucursal_id',array('type'=>'select','options'=>$sucursales));
?>
</div>