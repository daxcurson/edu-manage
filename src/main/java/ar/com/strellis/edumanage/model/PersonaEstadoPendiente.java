package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@DiscriminatorValue("2")
public class PersonaEstadoPendiente extends PersonaEstado
{
	public static final int PENDIENTE=2;
}
