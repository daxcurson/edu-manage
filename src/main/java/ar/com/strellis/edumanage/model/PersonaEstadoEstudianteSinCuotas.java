package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@DiscriminatorValue("4")
public class PersonaEstadoEstudianteSinCuotas extends PersonaEstado
{
	public static final int ESTUDIANTE_SIN_CUOTAS=4;
}
