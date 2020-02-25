package ar.com.strellis.edumanage.model;

import javax.persistence.DiscriminatorValue;

@DiscriminatorValue("2")
public class PerfilEmpleado extends PerfilProfesor
{
	public static final int EMPLEADO=2;
}
