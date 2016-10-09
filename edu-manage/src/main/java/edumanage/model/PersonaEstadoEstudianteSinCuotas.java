package edumanage.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("4")
public class PersonaEstadoEstudianteSinCuotas extends PersonaEstado
{
	public static final int ESTUDIANTE_SIN_CUOTAS=4;
}
