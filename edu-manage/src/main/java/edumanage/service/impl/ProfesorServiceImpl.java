package edumanage.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.PerfilProfesorDAO;
import edumanage.dao.ProfesorDAO;
import edumanage.model.PerfilProfesor;
import edumanage.model.Profesor;
import edumanage.service.ProfesorService;

@Service
public class ProfesorServiceImpl implements ProfesorService 
{
	@Autowired
	private ProfesorDAO profesorDao;
	@Autowired
	private PerfilProfesorDAO perfilProfesorDao;
	@Override
	@Transactional
	public Profesor getById(long id) 
	{
		return profesorDao.getById(id);
	}

	@Override
	@Transactional
	public List<Profesor> listarProfesores() 
	{
		return profesorDao.listarProfesores();
	}

	@Override
	@Transactional
	public void agregarProfesor(Profesor profesor) 
	{
		// Tengo que guardar la fecha de creacion!!
		profesor.setCreated(new Date());
		profesorDao.grabar(profesor);
	}

	@Override
	public List<Profesor> listarProfesoresPorPagina(int primerRegistro, int largoPagina) 
	{
		return profesorDao.listarProfesoresPorPagina(primerRegistro,largoPagina);
	}

	@Override
	public long cantidadProfesores() 
	{
		return profesorDao.cantidadTotal();
	}
	public List<PerfilProfesor> listarPerfilProfesores()
	{
		return perfilProfesorDao.listarPerfiles();
	}

	@Override
	public PerfilProfesor getPerfilById(long id) 
	{
		return perfilProfesorDao.getById(id);
	}
}
