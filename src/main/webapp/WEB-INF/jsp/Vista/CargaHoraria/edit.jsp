<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="cargaHorarias form">
<form:form method="post" action="edit" commandName="carga_horaria">
	<form:input path="id" />
	<tiles:insertAttribute name="form_carga_horaria"/>
	<input type="submit" name="editar_carga_horaria" value="Editar Carga horaria">
</form:form>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('CargaHoraria.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('CargaHoraria.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Carga Horarias'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Tipo Cursos'), array('controller' => 'tipo_cursos', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Tipo Curso'), array('controller' => 'tipo_cursos', 'action' => 'add')); ?> </li>
	</ul>
</div> 