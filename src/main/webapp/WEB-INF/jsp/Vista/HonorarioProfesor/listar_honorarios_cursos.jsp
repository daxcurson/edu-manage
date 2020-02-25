<div class="honorarioProfesores index">
	<h1>Honorarios asignados a profesores en cursos</h1>
	<p>
	Profesor: <?php echo $profesor['Profesor']['nombre']; ?>
	</p>
	<h2>Cursos vigentes, actualmente asignado</h2>
	<table>
	<tr>
			<th>Id</th>
			<th>C&oacute;digo Curso</th>
			<th>Nombre Honorario</th>
			<th>Precio por hora</th>
			<th>Moneda</th>
			<th>Fecha Desde</th>
			<?php
			/*
			Decidi que no va a haber columna acciones
			<th class="actions"><?php echo __('Actions'); ?></th>
			*/
			?>
	</tr>
	<?php 
	foreach ($cursos_vigentes_clases_futuras as $curso)
	{
		// El tema es asi: para cada curso va a haber (posiblemente) varios honorarios.
		// Asi que por cada curso, hay un 2do for con los honorarios de el, para listar
		// despues una asignacion de honorario por curso por fila.
		foreach($curso['honorarios'] as $honorario)
		{
	?>
	<tr>
		<td><?php echo h($honorario['CursoProfesor']['id']); ?>&nbsp;</td>
		<td><?php echo h($curso['Curso']['codigo_curso']); ?>&nbsp;</td>
		<td><?php echo h($honorario['HonorarioProfesor']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['precio_por_hora']); ?>&nbsp;</td>
		<td><?php echo h($honorario['Moneda']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['fecha_desde']); ?>&nbsp;</td>
		<?php
		/*
		Decidi que por ahora no va a haber columna acciones, porque asi como esta ahora,
		es lio permitir que se hagan cosas en esta pantalla.
		<td class="actions">
			<?php echo $this->Html->link(__('View'), array('action' => 'view_honorario', $honorario['CursoProfesor']['id'])); ?>
			<?php echo $this->Html->link(__('Edit'), array('action' => 'edit_honorario', $honorario['CursoProfesor']['id'])); ?>
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete_honorario', $honorario['CursoProfesor']['id']), null, __('Are you sure you want to delete # %s?', $honorario['CursoProfesor']['id'])); ?>
		</td>
		*/
		?>
	</tr>
<?php
		}
	}
?>
	</table>

	<h2>Cursos vigentes, ya no asignado</h2>
	<table>
	<tr>
			<th>Id</th>
			<th>C&oacute;digo Curso</th>
			<th>Nombre Honorario</th>
			<th>Precio por hora</th>
			<th>Moneda</th>
			<th>Fecha Desde</th>
	</tr>
	<?php 
	foreach ($cursos_vigentes_clases_pasadas as $curso)
	{
		// El tema es asi: para cada curso va a haber (posiblemente) varios honorarios.
		// Asi que por cada curso, hay un 2do for con los honorarios de el, para listar
		// despues una asignacion de honorario por curso por fila.
		foreach($curso['honorarios'] as $honorario)
		{
	?>
	<tr>
		<td><?php echo h($honorario['CursoProfesor']['id']); ?>&nbsp;</td>
		<td><?php echo h($curso['Curso']['codigo_curso']); ?>&nbsp;</td>
		<td><?php echo h($honorario['HonorarioProfesor']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['precio_por_hora']); ?>&nbsp;</td>
		<td><?php echo h($honorario['Moneda']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['fecha_desde']); ?>&nbsp;</td>
	</tr>
<?php
		}
	}
?>
	</table>

	<h2>Cursos no vigentes</h2>
	<table>
	<tr>
			<th>Id</th>
			<th>C&oacute;digo Curso</th>
			<th>Nombre Honorario</th>
			<th>Precio por hora</th>
			<th>Moneda</th>
			<th>Fecha Desde</th>
	</tr>
	<?php 
	foreach ($cursos_no_vigentes as $curso)
	{
		// El tema es asi: para cada curso va a haber (posiblemente) varios honorarios.
		// Asi que por cada curso, hay un 2do for con los honorarios de el, para listar
		// despues una asignacion de honorario por curso por fila.
		foreach($curso['honorarios'] as $honorario)
		{
	?>
	<tr>
		<td><?php echo h($honorario['CursoProfesor']['id']); ?>&nbsp;</td>
		<td><?php echo h($curso['Curso']['codigo_curso']); ?>&nbsp;</td>
		<td><?php echo h($honorario['HonorarioProfesor']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['precio_por_hora']); ?>&nbsp;</td>
		<td><?php echo h($honorario['Moneda']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($honorario['CursoProfesor']['fecha_desde']); ?>&nbsp;</td>
	</tr>
<?php
		}
	}
?>
	</table>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Asignar honorario al Curso'), array('action' => 'add_honorario_profesor',$profesor['Profesor']['id'])); ?></li>
	</ul>
</div>