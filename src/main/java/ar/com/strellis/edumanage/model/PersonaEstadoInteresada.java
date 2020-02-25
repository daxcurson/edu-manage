package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@DiscriminatorValue("1")
public class PersonaEstadoInteresada extends PersonaEstado
{
	public static final int INTERESADO=1;
}
