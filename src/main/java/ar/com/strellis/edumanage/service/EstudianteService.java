package ar.com.strellis.edumanage.service;

import ar.com.strellis.edumanage.exceptions.PersonaInexistenteException;
import ar.com.strellis.edumanage.model.Persona;

public interface EstudianteService
{
	public Persona getEstudianteById(long id) throws PersonaInexistenteException;
}
