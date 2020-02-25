package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.PersonaEstadoInexistenteException;
import ar.com.strellis.edumanage.model.PersonaEstado;

public interface EstadoEstudianteService 
{
	public PersonaEstado getById(long id) throws PersonaEstadoInexistenteException;
	public List<PersonaEstado> listarEstados();
}
