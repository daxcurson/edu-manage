package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@DiscriminatorValue("3")
public class PersonaEstadoEstudiante extends PersonaEstado 
{
	public static final int ESTUDIANTE=3;
}
