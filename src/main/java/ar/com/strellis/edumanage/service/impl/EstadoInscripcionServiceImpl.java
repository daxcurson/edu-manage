package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.EstadoInscripcionDAO;
import ar.com.strellis.edumanage.exceptions.EstadoInscripcionInexistente;
import ar.com.strellis.edumanage.model.EstadoInscripcion;
import ar.com.strellis.edumanage.service.EstadoInscripcionService;

@Service
public class EstadoInscripcionServiceImpl implements EstadoInscripcionService 
{
	@Autowired
	private EstadoInscripcionDAO estadoInscripcionDAO;
	@Override
	@Transactional
	public EstadoInscripcion getById(long id) throws EstadoInscripcionInexistente 
	{
		return estadoInscripcionDAO.findById(id).orElseThrow(EstadoInscripcionInexistente::new);
	}

	@Override
	@Transactional
	public List<EstadoInscripcion> listarEstados() 
	{
		return estadoInscripcionDAO.findAll();
	}
}
