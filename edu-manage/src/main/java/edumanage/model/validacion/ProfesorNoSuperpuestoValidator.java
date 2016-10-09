package edumanage.model.validacion;

import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import edumanage.dao.ClaseDAO;
import edumanage.model.Clase;
import edumanage.model.HorarioCurso;

public class ProfesorNoSuperpuestoValidator implements ConstraintValidator<ProfesorNoSuperpuesto,List<HorarioCurso>>
{
	@Autowired
	private ClaseDAO claseDAO;
	@Override
	public void initialize(ProfesorNoSuperpuesto arg0) 
	{
	}

	@Override
	public boolean isValid(List<HorarioCurso> horario, ConstraintValidatorContext arg1) 
	{
		// Aqui hay que averiguar que el profesor tenga disponible el horario
		// que se pidio en el curso.
		boolean resultado=true;
		// Lo grandioso de esto es que tenemos la lista de horarios del curso
		// para validar. Eso es genial!
		// Ahora me tengo que fijar si la lista de clases superpuestas para cada
		// uno de los horarios es vacia.
		for(HorarioCurso h:horario)
		{
			List<Clase> clasesSuperpuestas=claseDAO.getClasesSuperpuestas(h);
			if(!clasesSuperpuestas.isEmpty())
				resultado=false;
		}
		return resultado;
	}

}
