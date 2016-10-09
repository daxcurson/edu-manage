package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.PersonaEstadoDAO;
import edumanage.model.PersonaEstado;
import edumanage.service.EstadoEstudianteService;

@Service
public class EstadoEstudianteServiceImpl implements EstadoEstudianteService 
{
	@Autowired
	private PersonaEstadoDAO estadoEstudianteDAO;
	@Override
	@Transactional
	public PersonaEstado getById(long id) 
	{
		return estadoEstudianteDAO.getById(id);
	}

	@Override
	@Transactional
	public List<PersonaEstado> listarEstados() 
	{
		return estadoEstudianteDAO.listarEstados();
	}

}
