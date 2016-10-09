package edumanage.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("1")
public class PersonaEstadoInteresada extends PersonaEstado
{
	public static final int INTERESADO=1;
}
