<?php
if(isset($id_persona))
{
	echo $this->Form->hidden('Persona.id',array('value'=>$id_persona));
}
if(isset($id_inscripcion))
{
	echo $this->Form->hidden('Inscripcion.id',array('value'=>$id_inscripcion));
}
echo $this->Form->input('Persona.nombre',array('label'=>__('Nombre')));
echo $this->Form->input('Persona.apellido',array('label'=>__('Apellido')));
echo $this->Form->input('Persona.direccion',array('label'=>__('Direccion')));
// Pregunto si quiere recibir novedades (#118).
echo "<table>";
echo "<tr><td>".$this->Form->checkbox('Persona.novedades',array('checked'=>true))."</td><td>".__('Deseo recibir novedades y anuncios de LV-Studio')."</td></tr>";
echo "</table>";
// #281 - Cartel en inscripcion.
echo "<p>".__('Por favor, revisa que tu e-mail est&eacute; correcto')."</p>\n";
echo $this->Form->input('Persona.email');
echo $this->Form->input('Persona.telefono',array('label'=>__('Telefono')));

// Pregunto por fecha en que va a comenzar a cursar (#147)
echo $this->Form->label('Inscripcion.fecha_comienzo',__('Fecha en que comenzar&aacute; a cursar'),array('id'=>'LabelInscripcionFechaComienzo'));
echo $this->Form->input('Inscripcion.fecha_comienzo',array('label'=>false));

// Pregunto por fecha en que va a terminar de cursar (#482)
echo $this->Form->label('Inscripcion.fecha_finalizacion',__('Fecha en que terminar&aacute; de cursar'),array('id'=>'LabelInscripcionFechaComienzo'));
echo $this->Form->input('Inscripcion.fecha_finalizacion',array('label'=>false));

// Pregunto por si quiere curso individual o grupal.
echo $this->Form->label('Curso.tipo_curso',__('Tipo de curso'),array('id'=>'LabelTipoCurso'));
echo $this->Form->select('Curso.tipo_curso',array('options'=>$tipo_curso));

echo $this->Form->label('Persona.idioma_estudiar_id',__('&iquest;Qu&eacute; idioma desea aprender?'),array('id'=>'LabelPersonaIdiomaEstudiarId'));
echo $this->Form->select('Persona.idioma_estudiar_id',$idiomas);
echo $this->Form->error('Persona.idioma_estudiar_id',__('El idioma a estudiar es obligatorio'),array());

echo $this->Form->label('Persona.nivel_id',__('Nivel del grupo en el que se quiere inscribir'),array('id'=>'LabelPersonaNivelId'));
echo $this->Form->select('Persona.nivel_id',array('options'=>$nivel));
echo $this->Form->error('Persona.nivel_id',__('El nivel del estudiante es obligatorio'),array());
?>
<div id="LinkTestNivelIngles">
<p>Para tomar el test de nivel de ingl&eacute;s, haga click <a href="http://www.lvstudioweb.com/test-de-nivel-de-ingles/" target="_blank">aqu&iacute;</a>.</p>
</div>
<div id="LinkTestNivelEspanol">
<p>To take the Spanish level test, click <a href="http://www.lvstudioweb.com/spanish-level-test" target="_blank">here</a>.</p>
</div>
<?php
echo $this->Form->label('curso_id',__('Cursos ofrecidos:'));
if ($this->Form->isFieldError('curso_id'))
{
	echo $this->Form->error('curso_id');
}
?>
<div id="ListaCursos">

</div>
<div id="ListaEspera">
<?php echo $this->Form->checkbox('InscripcionIndividual.lista_espera'); ?><?php echo __('El curso que requiero no existe, quiero anotarme en lista de espera'); ?>
</div>