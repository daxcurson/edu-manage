package ar.com.strellis.edumanage.model.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ar.com.strellis.edumanage.model.Inscripcion;
import ar.com.strellis.edumanage.model.InscripcionGrupal;
import ar.com.strellis.edumanage.model.InscripcionIndividual;
import ar.com.strellis.edumanage.model.ModeloFormInscripcion;

/**
 * Validador para el modelo de inscripcion. Hace todos los chequeos de inscripcion
 * valida.
 * @author daxcurson
 *
 */
@Component
public class ModeloFormInscripcionValidator implements Validator
{
	private InscripcionGrupalValidator inscripcionGrupalValidator;
	private InscripcionIndividualValidator inscripcionIndividualValidator;
	/**
	 * Construye un validador. Por defecto, las inscripciones son grupales
	 * a menos que al validar eso se cambie.
	 */
	public ModeloFormInscripcionValidator()
	{
		inscripcionGrupalValidator=new InscripcionGrupalValidator();
		inscripcionIndividualValidator=new InscripcionIndividualValidator();
	}
	@Override
	public boolean supports(Class<?> claseAValidar) 
	{
		return ModeloFormInscripcion.class.isAssignableFrom(claseAValidar);
	}

	/**
	 * Validador de un modelo de inscripcion. Hace las validaciones de si es un
	 * curso grupal, etc.etc.etc.
	 */
	@Override
	public void validate(Object modeloInscripcionRecibido, Errors erroresFormulario) 
	{
		// Aca hago algo con la inscripcion.
		Inscripcion modelo=((ModeloFormInscripcion)modeloInscripcionRecibido).getInscripcion();
		if(modelo.getClass().isAssignableFrom(InscripcionGrupal.class))
			inscripcionGrupalValidator.validate(modelo, erroresFormulario);
		if(modelo.getClass().isAssignableFrom(InscripcionIndividual.class))
			inscripcionIndividualValidator.validate(modelo, erroresFormulario);
	}
}
