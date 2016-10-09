<?php
// Pongo scripts que voy a usar.
echo $this->Html->css('fullcalendar.css',false);
echo $this->Html->script('jquery.js', false);
echo $this->Html->script('jquery-ui.js',false);
echo $this->Html->script('jquery.qtip-1.0.0-rc3.min.js',false);
echo $this->Html->script('moment.js',false);
echo $this->Html->script('fullcalendar.js',false);
echo $this->Html->script('jquery.floatThead.js', false);

include('asignar_profesor.js');

echo $this->Element('form-asignar-profesor',array('operacion'=>'asignar_profesor'));
?>