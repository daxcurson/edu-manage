package ar.com.strellis.edumanage.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.PerfilProfesorDAO;
import ar.com.strellis.edumanage.dao.ProfesorDAO;
import ar.com.strellis.edumanage.exceptions.PerfilProfesorInexistenteException;
import ar.com.strellis.edumanage.exceptions.ProfesorInexistenteException;
import ar.com.strellis.edumanage.service.ProfesorService;
import ar.com.strellis.edumanage.model.*;

@Service
public class ProfesorServiceImpl implements ProfesorService 
{
	@Autowired
	private ProfesorDAO profesorDao;
	@Autowired
	private PerfilProfesorDAO perfilProfesorDao;
	@Override
	@Transactional
	public Profesor getById(long id) throws ProfesorInexistenteException 
	{
		return profesorDao.findById(id).orElseThrow(ProfesorInexistenteException::new);
	}

	@Override
	@Transactional
	public List<Profesor> listarProfesores() 
	{
		return profesorDao.findAll();
	}

	@Override
	@Transactional
	public void agregarProfesor(Profesor profesor) 
	{
		// Tengo que guardar la fecha de creacion!!
		profesor.setCreated(new Date());
		profesorDao.save(profesor);
	}

	@Override
	public Page<Profesor> listarProfesoresPorPagina(int primerRegistro, int largoPagina) 
	{
		Pageable pageable=PageRequest.of(primerRegistro, largoPagina);
		return profesorDao.findAll(pageable);
	}

	@Override
	public long cantidadProfesores() 
	{
		return profesorDao.count();
	}
	public List<PerfilProfesor> listarPerfilProfesores()
	{
		return perfilProfesorDao.findAll();
	}

	@Override
	public PerfilProfesor getPerfilById(long id) throws PerfilProfesorInexistenteException 
	{
		return perfilProfesorDao.findById(id).orElseThrow(PerfilProfesorInexistenteException::new);
	}
}
