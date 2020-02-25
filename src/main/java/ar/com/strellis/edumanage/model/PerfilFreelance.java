package ar.com.strellis.edumanage.model;

import javax.persistence.DiscriminatorValue;

@DiscriminatorValue("1")
public class PerfilFreelance extends PerfilProfesor 
{
	public static final int FREELANCE=1;
}
