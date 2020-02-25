package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.*;
import ar.com.strellis.edumanage.exceptions.PersonaEstadoInexistenteException;
import ar.com.strellis.edumanage.exceptions.PersonaInexistenteException;
import ar.com.strellis.edumanage.model.Persona;
import ar.com.strellis.edumanage.service.PersonaService;

@Service
public class PersonaServiceImpl implements PersonaService 
{
	static Logger log = LogManager.getLogger(PersonaServiceImpl.class);
	@Autowired
	private PersonaDAO personaDAO;
	@Autowired
	private PersonaEstadoDAO estadoEstudianteDAO;
	
	@Transactional
	public List<Persona> listPersona() 
	{
		log.trace("Estoy por llamar a personaDAO para listar personas");
		return personaDAO.findAll();
	}

	@Transactional
	public void removePersona(Long id) 
	{
		personaDAO.deleteById(id);
	}

	@Override
	public Persona getById(Long id) throws PersonaInexistenteException 
	{
		return personaDAO.findById(id).orElseThrow(PersonaInexistenteException::new);
	}

	@Override
	@Transactional
	public void save(Persona persona) throws PersonaEstadoInexistenteException 
	{
		// Hay que garantizar que el estado por defecto de la persona sea el
		// de estudiante pendiente.
		persona.setEstado(estadoEstudianteDAO.findById((long) 4).orElseThrow(PersonaEstadoInexistenteException::new));
		personaDAO.save(persona);
	}
}
