package edumanage.model.validacion;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.spi.group.DefaultGroupSequenceProvider;

import edumanage.model.Curso;

public class CursoSequenceProvider implements DefaultGroupSequenceProvider<Curso>
{

	@Override
	public List<Class<?>> getValidationGroups(Curso curso) 
	{
		List<Class<?>> defaultGroupSequence = new ArrayList<Class<?>>();
		defaultGroupSequence.add(Curso.class);
		defaultGroupSequence.add(CursoChecks.class);
		// Si el curso no tiene clases, y tiene una lista de horarios
		// de curso, quiere decir que estoy asignando los horarios por primera vez.
		// Realizar validaciones de los horarios, si se superponen cosas, etc.
		if(curso!=null &&
				curso.getHorario()!=null &&
				(curso.getClases()==null || curso.getClases().isEmpty() ) 
				&& !curso.getHorario().isEmpty())
		{
			defaultGroupSequence.add(HorarioCursoChecks.class);
		}
		return defaultGroupSequence;
	}
}
