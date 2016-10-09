package edumanage.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("2")
public class PersonaEstadoPendiente extends PersonaEstado
{
	public static final int PENDIENTE=2;
}
