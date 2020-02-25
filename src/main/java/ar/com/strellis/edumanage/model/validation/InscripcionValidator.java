package ar.com.strellis.edumanage.model.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ar.com.strellis.edumanage.model.Inscripcion;

public abstract class InscripcionValidator implements Validator {

	@Override
	public boolean supports(Class<?> claseAValidar) 
	{
		return Inscripcion.class.isAssignableFrom(claseAValidar);
	}

	/**
	 * En el objeto errors devuelve los errores de la inscripcion!!!
	 */
	@Override
	public abstract void validate(Object inscripcion, Errors errores) ;
}
