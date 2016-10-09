<?php
echo $this->Html->css('jquery-ui');
include('buscar-honorarios-profesores.js');
?>
<h1>Asignaci&oacute;n de honorarios</h1>

<ol>
<li>Seleccionar los honorarios a asignar al profesor. Pueden ser nuevos honorarios, u 
honorarios existentes con nuevos valores.</li>
<li>El sistema obtendr&aacute; la lista de cursos que podr&aacute;n ser afectados por este
cambio. Un curso aparecer&aacute; si tiene el honorario asignado a alguna de sus clases, y
estas clases caen despu&eacute;s de la fecha de vigencia de los nuevos honorarios agregados.</li>
</ol>

<p>
Para m&aacute;s informaci&oacute;n, por favor consulte la p&aacute;gina de ayuda.
</p>

<p>
Profesor: <?php echo $profesor['Profesor']['nombre']; ?>
</p>

<h2>Honorarios actuales</h2>

<p>
Estos son los honorarios que el profesor tiene asignados en este momento.
</p>

<table id="HonorariosExistentes">
<tr><th>Descripci&oacute;n</th><th>Precio</th><th>Moneda</th><th>Idioma</th><th>Fecha Desde</th></tr>
<?php
// Aca vienen los honorarios ya existentes para este profesor.
foreach($honorarios_asignados as $honorario)
{
	echo "<tr>";
	echo "<td>".$honorario['HonorarioProfesor']['descripcion']."</td>";
	echo "<td>".$honorario['HonorarioAsignado']['precio_por_hora']."</td>";
	echo "<td>".$honorario['Moneda']['descripcion']."</td>";
	echo "<td>".$honorario['IdiomaEstudiar']['descripcion']."</td>";
	echo "<td>".$honorario['HonorarioAsignado']['fecha_desde']."</td>";
	echo "</tr>\n";
}
?>
</table>

<h2>Asignar nuevos honorarios</h2>

<p>
Por favor seleccionar el idioma para buscar honorarios a asignar.
</p>

<?php
echo $this->Form->create('Asignacion');
echo $this->Form->input('idioma_estudiar_id',array('label'=>'Idioma que ensena'));
echo $this->Form->input('profesor_id',array('type'=>'hidden','value'=>$profesor['Profesor']['id']));
?>

<p>
Para el idioma seleccionado se muestran los honorarios definidos en el sistema.
</p>
<table id="TablaHonorarios">
<tr><th>Descripci&oacute;n</th><th>Precio</th><th>Moneda</th><th>Idioma</th><th>Acciones</th></tr>
<?php
// Aca van los honorarios definidos, buscarlos por Javascript
?>
</table>
<?php
// Aca agrego el boton para crear honorario especial.
echo $this->Form->button('Agregar Honorario especial', array('type' => 'button','id'=>'BotonAgregarHonorarioEspecial'));
?>
<p>
Aqu&iacute; aparecen los honorarios que se le asignar&aacute;n al profesor. Si quiere cambiarlos,
seleccione el honorario de la lista de arriba.
</p>

<table id="HonorariosAsignados">
<tr><th>Descripci&oacute;n</th><th>Precio</th><th>Moneda</th><th>Idioma</th><th>Acciones</th></tr>
<?php
// Aca van los honorarios ya asignados, van a ser puestos o por javascript, o por variable
// que viene cargada del controller.
?>
</table>

<p>
Introduzca fecha de vigencia de los nuevos honorarios. Por favor tener en cuenta que si este
profesor tiene clases asignadas con este honorario, los honorarios de esas clases se 
modificar&aacute;n a partir de esta fecha.
</p>

<p><?php
echo $this->Form->input('fecha_desde',array('type'=>'text'));
?></p>
<?php
// Aqui tiene que mostrar la lista de clases y cursos que van a ser afectados por el cambio!!!
// Tengo que mostrar sus cursos vigentes. Luego afectar a todas las clases!!!
?>
<p>
A continuaci&oacute;n se listan los cursos y las clases que ser&aacute;n afectadas por el cambio.
Por favor confirmar a qu&eacute; cursos se aplicar&aacute; el cambio de honorarios.
</p>
<div id="CursosAfectados">
<table>
<tr><th>Elegir</th><th>C&oacute;digo Curso</th><th>Descripci&oacute;n Curso</th><th>Fecha Comienzo</th><th>Fecha Fin</th><th>Honorario Asignado</th>
<?php
foreach($cursos_vigentes as $curso)
{
	echo "<tr>";
	echo "<td>".'<input type="checkbox" name="data[Asignacion][Curso]['.$curso['Curso']['id'].']">'."</td>";
	echo "<td>".$curso['Curso']['codigo_curso']."</td>";
	echo "<td>".$curso['Curso']['descripcion_curso']."</td>";
	echo "<td>".$curso['Curso']['fecha_comienzo']."</td>";
	echo "<td>".$curso['Curso']['fecha_fin']."</td>";
	echo "<td>".$curso['HonorarioProfesor']['descripcion']."</td>";
	echo "</tr>\n";
}
?>
</table>
</div>
<?php
echo $this->Form->end('Asignar honorarios');
?>
<div id="DialogoCrearHonorarioEspecial" title="Agregar Honorario especial">
<?php
//<form id="FormHonorarioEspecial">
echo $this->Form->create("HonorarioProfesor");
echo $this->element('form-honorario-agregar');
echo $this->Form->input('fecha_desde',array('type'=>'text'));
// Y como este es un honorario especial, hay que pasar el valor especial en 1 y el 
// id de profesor
echo $this->Form->input('especial',array('type'=>'hidden','value'=>1));
echo $this->Form->input('profesor_id',array('type'=>'hidden','value'=>$profesor['Profesor']['id']));
echo $this->Form->input('honorario_profesor_id',array('type'=>'hidden'));
?>
</form>
</div>