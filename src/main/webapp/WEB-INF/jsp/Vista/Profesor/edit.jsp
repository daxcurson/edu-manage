<?php
echo $this->Html->css('fullcalendar.css',false);
echo $this->Html->css('jquery-ui',false);
echo $this->Html->script('jquery.js',false);
echo $this->Html->script('jquery-ui.js',false);
echo $this->Html->script('jquery.qtip-1.0.0-rc3.min.js',false);
echo $this->Html->script('moment.js',false);
echo $this->Html->script('fullcalendar.js',false);
include('mostrar_campos_sueldo.js');
include('comentarios.js');
?>
<div class="profesores form">
<?php echo $this->Form->create('Profesor',array('type' => 'file'));?>
	<fieldset>
		<legend><?php echo 'Editar Profesor'; ?></legend>
	<?php
		echo $this->element('form-datos-profesor');
		// Aclaracion: que sea dado de baja aqui solamente cambia el que este disponible o no
		// para asignarlo a cursos. Para realmente dar de baja un profesor hay que ir a la opcion
		// de menu dar de baja.
		echo $this->Form->checkbox('deshabilitado');
		echo "Dado de baja";
	?>
	</fieldset>
<?php echo $this->Form->end('Guardar');?>
</div>
<div class="actions">
	<h3><?php echo 'Acciones'; ?></h3>
	<ul>

		<li><?php echo $this->Html->link('Listar Profesores', array('action' => 'index'));?></li>
	</ul>
</div>