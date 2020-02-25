package ar.com.strellis.edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.com.strellis.edumanage.dao.PersonaDAO;
import ar.com.strellis.edumanage.exceptions.PersonaInexistenteException;
import ar.com.strellis.edumanage.model.Persona;
import ar.com.strellis.edumanage.service.EstudianteService;

@Service
public class EstudianteServiceImpl implements EstudianteService
{
	@Autowired
	private PersonaDAO personaDAO;

	@Override
	public Persona getEstudianteById(long id) throws PersonaInexistenteException
	{
		return personaDAO.findById(id).orElseThrow(PersonaInexistenteException::new);
	}
}
