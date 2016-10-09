package edumanage.model.validacion;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.spi.group.DefaultGroupSequenceProvider;

import edumanage.model.Inscripcion;
import edumanage.model.InscripcionGrupal;
import edumanage.model.InscripcionIndividual;
import edumanage.model.ModeloFormInscripcion;

/**
 * Provee la secuencia de chequeos a realizar sobre un formulario de inscripcion.
 * Valida los campos basicos, y despues decide si agrega los chequeos sobre
 * inscripcion individual o grupal dependiendo del tipo de inscripcion.
 * @author daxcurson
 *
 */
public class ModeloFormInscripcionSequenceProvider implements DefaultGroupSequenceProvider<ModeloFormInscripcion>
{
	public List<Class<?>> getValidationGroups(ModeloFormInscripcion car) 
	{
		List<Class<?>> defaultGroupSequence = new ArrayList<Class<?>>();
		defaultGroupSequence.add(ModeloFormInscripcion.class);
		defaultGroupSequence.add(InscripcionChecks.class );

		if(car!=null)
		{
			Inscripcion i=car.getInscripcion();
			if(i.getClass().isAssignableFrom(InscripcionGrupal.class))
				defaultGroupSequence.add(InscripcionGrupalChecks.class);
			if(i.getClass().isAssignableFrom(InscripcionIndividual.class))
				defaultGroupSequence.add(InscripcionIndividualChecks.class);
		}
		return defaultGroupSequence;
	}

}
