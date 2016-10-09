package edumanage.model;

import javax.persistence.*;

@Entity
@DiscriminatorValue("3")
public class PersonaEstadoEstudiante extends PersonaEstado 
{
	public static final int ESTUDIANTE=3;
}
