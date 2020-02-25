package ar.com.strellis.edumanage.model.validation;

import org.springframework.validation.Errors;

import ar.com.strellis.edumanage.model.InscripcionGrupal;

public class InscripcionGrupalValidator extends InscripcionValidator
{
	@Override
	public void validate(Object inscripcion, Errors errores) 
	{
		// Si el curso no esta seleccionado, rebotar esta inscripcion!!
		// Pero hacerlo solamente si se trata de una inscripcion grupal.
		InscripcionGrupal i=(InscripcionGrupal)inscripcion;
		if(i.getCurso().getId()==0 )
			errores.rejectValue("inscripcionGrupal.curso.id", "label.inscripcion_curso_no_seleccionado");
		// En inscripcion grupal es obligatoria la fecha de finalizacion,
		// pero en individual no. Solamente aqui la controlo.
		if(i.getFechaFinalizacion()==null)
			errores.rejectValue("inscripcionGrupal.fecha_finalizacion", "label.inscripcion_grupal_fecha_finalizacion_vacia");
	}
}
