delete from comentario_cuotas where fecha_hora is null;
delete from cursos where fecha_comienzo is null;
update cuotas set fecha_desde=fecha_vencimiento,fecha_hasta=fecha_vencimiento where fecha_desde is null;
update cuotas set fecha_desde=fecha_vencimiento,fecha_hasta=fecha_vencimiento where fecha_hasta is null;
update curso_profesores,cursos set curso_profesores.fecha_desde=cursos.fecha_comienzo where curso_profesores.fecha_desde is null and curso_profesores.curso_id=cursos.id;
delete from honorario_profesores_historico where fecha_desde is null;
delete from inscripciones_individuales where fecha_estimada_comienzo='0000-00-00';
update horario_profesores set fecha_fin=fecha_comienzo where fecha_fin is null;
update inscripciones set fecha_baja=fecha_finalizacion where fecha_baja='0000-00-00';
delete from persona_bajas where fecha_retorno is null;
update personas set fecha_baja=fecha_retorno where fecha_baja='0000-00-00';
update profesores set fecha_nacimiento=null where fecha_nacimiento='0000-00-00';
update cursos set fecha_baja=fecha_fin where fecha_baja='0000-00-00';
delete from cuotas where fecha_vencimiento='0000-00-00';
delete from curso_profesores where fecha_desde='0000-00-00';
delete from inscripciones_individuales where fecha_estimada_comienzo='0000-00-00';
delete from extension_cursadas where fecha_desde='0000-00-00';
delete from persona_bajas where fecha_baja='0000-00-00';
update inscripciones set fecha_inscripcion=created where fecha_inscripcion='0000-00-00';
update profesores set fecha_baja=null where fecha_baja='0000-00-00';
update personas set fecha_nacimiento=created where fecha_nacimiento='0000-00-00';
update inscripciones set fecha_finalizacion=null where fecha_finalizacion='0000-00-00';
