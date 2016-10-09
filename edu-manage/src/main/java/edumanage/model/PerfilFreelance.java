package edumanage.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("1")
public class PerfilFreelance extends PerfilProfesor 
{
	public static final int FREELANCE=1;
}
