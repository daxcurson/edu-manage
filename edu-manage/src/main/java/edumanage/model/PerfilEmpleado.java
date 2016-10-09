package edumanage.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("2")
public class PerfilEmpleado extends PerfilProfesor
{
	public static final int EMPLEADO=2;
}
