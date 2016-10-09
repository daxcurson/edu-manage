package edumanage.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.PersonaEstadoDAO;
import edumanage.dao.PersonaDAO;
import edumanage.model.Persona;
import edumanage.service.PersonaService;

@Service
public class PersonaServiceImpl implements PersonaService 
{
	static Logger log = Logger.getLogger(PersonaServiceImpl.class);
	@Autowired
	private PersonaDAO personaDAO;
	@Autowired
	private PersonaEstadoDAO estadoEstudianteDAO;
	
	@Transactional
	public List<Persona> listPersona() 
	{
		log.trace("Estoy por llamar a personaDAO para listar personas");
		return personaDAO.listPersona();
	}

	@Transactional
	public void removePersona(Integer id) 
	{
		personaDAO.removePersona(id);
	}

	@Override
	public Persona getById(long id) {
		return personaDAO.getById(id);
	}

	@Override
	@Transactional
	public void save(Persona persona) 
	{
		// Hay que garantizar que el estado por defecto de la persona sea el
		// de estudiante pendiente.
		persona.setEstado(estadoEstudianteDAO.getById(4));
		personaDAO.save(persona);
	}
}
