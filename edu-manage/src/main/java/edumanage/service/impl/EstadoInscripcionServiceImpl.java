package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.EstadoInscripcionDAO;
import edumanage.model.EstadoInscripcion;
import edumanage.service.EstadoInscripcionService;

@Service
public class EstadoInscripcionServiceImpl implements EstadoInscripcionService 
{
	@Autowired
	private EstadoInscripcionDAO estadoInscripcionDAO;
	@Override
	@Transactional
	public EstadoInscripcion getById(long id) 
	{
		return estadoInscripcionDAO.getById(id);
	}

	@Override
	@Transactional
	public List<EstadoInscripcion> listarEstados() 
	{
		return estadoInscripcionDAO.listarEstados();
	}
}
