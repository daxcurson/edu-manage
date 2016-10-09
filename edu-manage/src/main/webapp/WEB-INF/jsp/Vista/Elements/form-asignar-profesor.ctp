<h1>Asignar profesor al curso</h1>

<?php
echo $this->Form->create('Asignacion');
?>
<table>
<tr><td>C&oacute;digo de curso:</td><td><?php echo $curso['Curso']['codigo_curso']; ?></td></tr>
<tr><td>Horario:</td><td><?php echo $curso['Curso']['horario_curso']; ?></td></tr>
<tr><td>Idioma:</td><td><?php echo $curso['IdiomaEstudiar']['descripcion']; ?></td></tr>
<tr><td>Nivel:</td><td><?php echo $this->Form->select('Curso.nivel_id',$niveles,array('value'=>$curso['Curso']['nivel_id'])); ?></td></tr>
</table>

<?php
// En una variable oculta tengo que guardar el estado de la variable existen_clases para que despues
// sea recibida por el metodo que planifica.

// Ahora viene la heavy-wizardry. Primero de todo agrego un boton para agregar profesor.
// Necesito tener guardado el codigo de curso y la operacion como campos ocultos, para saber
// cuando reproducir el valor de la variable de sesion con los horarios. Si no, cuando se empiece
// una asignacion de un curso pero no se termine, y se vaya a la de otro, se van a poner los horarios
// del primer curso en el segundo.
echo $this->Form->input('Curso.id',array('type'=>'hidden','value'=>$curso['Curso']['id']));
echo $this->Form->input('operacion',array('type'=>'hidden','value'=>$operacion));
// Si no hay clases, hay que mostrar un nombre distinto para el boton...
if(isset($conflictos))
{
	?>
	<div class="error">
	<table>
	<?php
	foreach($conflictos as $conflicto)
	{
		echo "<tr><td>".$conflicto."</td></tr>\n";
	}
	?>
	</table>
	</div>
	<?php
}

if($existen_clases==1)
	echo $this->Form->button('Agregar Profesor', array('type' => 'button','id'=>'BotonAgregarProfesor'));

// Si ya existen clases pero se quiere agregar un profesor y clases nuevas, hay que agregar
// otro boton
if(isset($existen_clases) && $existen_clases==1)
	echo $this->Form->button('Agregar Profesor y clases nuevas',array('type'=>'button','id'=>'BotonAgregarProfesorClases'));
// Si ya existen clases, hay que mostrar el form de clases al menos la cantidad de profesores asignados.

// Si el curso tiene estado distinto de S, mostrar las fechas de comienzo y de fin.
// #229 - Si esta pedido alargar la cursada, hay que mostrar si o si las fechas
// de comienzo y fin de curso.
if($curso['Curso']['abierto']!='S' && !isset($alargar_cursada))
{
	echo "<h2>Confirmar fechas de inicio y de fin del Curso</h2>";
	echo $this->Form->input('Curso.fecha_comienzo',array('selected'=>$curso['Curso']['fecha_comienzo']));
	echo $this->Form->input('Curso.fecha_fin',array('selected'=>$curso['Curso']['fecha_fin']));
}
if(isset($alargar_cursada) && $alargar_cursada==1)
{
	// Incluir un form. La parte de alargar cursada se volvio muuuuuucho mas complicada...
	echo $this->Element('form-alargar-cursada');
}
?>
<div id="horarios">
<?php
if(isset($existen_clases) && $existen_clases==1)
{
	echo $this->Element('form_clase_profesor',array('cuadros'=>$cuadros,'profesores_en_curso'=>$profesores_en_curso,'clases'=>$clases,'profesores'=>$profesores));
}
if(isset($existen_clases) && $existen_clases==0)
{
	if(isset($profesores))
	{
		echo $this->Element('form-calendario-profesores',array('cuadros'=>$cuadros,'profesores'=>$profesores,'monedas'=>$monedas));
	}
	else
		echo $this->Element('form-calendario-profesores',array('cuadros'=>$cuadros,'monedas'=>$monedas));
}
?>
</div>
<?php
if($curso['Curso']['abierto']=="E")
{
?>
<h2>Al asignar el profesor, se cargar&aacute;n cuotas a los integrantes de este curso entre las
fechas seleccionadas.</h2>
<?php
}
echo $this->Form->end('Asignar profesores');
?>