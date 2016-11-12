<h1>Ver cambios al honorario</h1>

<div class="honorarioProfesoresHistorico index">
	<h2><?php echo __('Historico de Honorarios a profesores'); ?></h2>
	<table>
	<tr>
			<th>Honorario Profesor</th>
			<th>Fecha Desde</th>
			<th>Precio por hora</th>
			<th>Moneda</th>
	</tr>
	<tr><td colspan="4">Honorario actual</td></tr>
	<tr><?php
	echo "<td>".$honorario_actual['HonorarioProfesor']['descripcion']."</td>";
	echo "<td>".$honorario_actual['HonorarioProfesor']['fecha_desde']."</td>";
	echo "<td>".$honorario_actual['HonorarioProfesor']['precio_por_hora']."</td>";
	echo "<td>".$this->Html->link($honorario_actual['Moneda']['descripcion'], array('controller' => 'monedas', 'action' => 'view', $honorario_actual['Moneda']['id']))."</td>";
	?></tr>
	<tr><td colspan="4">Honorarios anteriores</td></tr>
	<?php foreach ($honorarios as $h): ?>
	<tr>
		<td><?php echo $h['HonorarioProfesor']['descripcion']; ?></td>
		<td><?php echo h($h['HonorarioProfesorHistorico']['fecha_desde']); ?></td>
		<td><?php echo h($h['HonorarioProfesorHistorico']['precio_por_hora']); ?></td>
		<td>
			<?php echo $this->Html->link($h['Moneda']['descripcion'], array('controller' => 'monedas', 'action' => 'view', $h['Moneda']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
</div>