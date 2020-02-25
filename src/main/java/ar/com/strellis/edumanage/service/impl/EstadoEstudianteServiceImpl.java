package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.PersonaEstadoDAO;
import ar.com.strellis.edumanage.exceptions.PersonaEstadoInexistenteException;
import ar.com.strellis.edumanage.model.PersonaEstado;
import ar.com.strellis.edumanage.service.EstadoEstudianteService;

@Service
public class EstadoEstudianteServiceImpl implements EstadoEstudianteService 
{
	@Autowired
	private PersonaEstadoDAO estadoEstudianteDAO;
	@Override
	@Transactional
	public PersonaEstado getById(long id) throws PersonaEstadoInexistenteException 
	{
		return estadoEstudianteDAO.findById(id).orElseThrow(PersonaEstadoInexistenteException::new);
	}

	@Override
	@Transactional
	public List<PersonaEstado> listarEstados() 
	{
		return estadoEstudianteDAO.findAll();
	}

}
