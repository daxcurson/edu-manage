package edumanage.model.validacion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.stereotype.Component;

import edumanage.model.HorarioCurso;

@Component
public class HorarioCursoValidator implements ConstraintValidator<DesdeAntesDeHasta,HorarioCurso>
{

	@Override
	public void initialize(DesdeAntesDeHasta arg0) 
	{
	}

	@Override
	public boolean isValid(HorarioCurso target, ConstraintValidatorContext errors) {
		boolean valido=true;
		HorarioCurso horario=(HorarioCurso)target;
		//if(horario.isAllDay())
			
		// Validamos que la hora de fin sea mayor que la de inicio.
		if(horario.getHora_fin().isBefore(horario.getHora_inicio()))
		{
			errors
            .buildConstraintViolationWithTemplate( "{desde_antes_de_hasta}" )
            .addPropertyNode("hora_fin").addConstraintViolation();
			valido=false;
		}   
		return valido;
	}
}
