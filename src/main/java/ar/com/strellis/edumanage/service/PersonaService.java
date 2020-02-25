package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.PersonaEstadoInexistenteException;
import ar.com.strellis.edumanage.exceptions.PersonaInexistenteException;
import ar.com.strellis.edumanage.model.Persona;

public interface PersonaService 
{
	public List<Persona> listPersona();
	public void removePersona(Long id);
	public void save(Persona persona) throws PersonaEstadoInexistenteException;
	public Persona getById(Long id) throws PersonaInexistenteException;
}
