package edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edumanage.dao.PersonaDAO;
import edumanage.model.Persona;
import edumanage.service.EstudianteService;

@Service
public class EstudianteServiceImpl implements EstudianteService
{
	@Autowired
	private PersonaDAO personaDAO;

	@Override
	public Persona getEstudianteById(long id)
	{
		return personaDAO.getById(id);
	}
}
