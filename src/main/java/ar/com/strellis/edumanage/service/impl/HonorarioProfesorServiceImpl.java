package ar.com.strellis.edumanage.service.impl;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.HonorarioAsignadoDAO;
import ar.com.strellis.edumanage.dao.HonorarioProfesorDAO;
import ar.com.strellis.edumanage.dao.IdiomaEstudiarDAO;
import ar.com.strellis.edumanage.dao.ProfesorDAO;
import ar.com.strellis.edumanage.exceptions.HonorarioProfesorInexistente;
import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.exceptions.ProfesorInexistenteException;
import ar.com.strellis.edumanage.model.HonorarioAsignado;
import ar.com.strellis.edumanage.model.HonorarioProfesor;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.model.Profesor;
import ar.com.strellis.edumanage.service.HonorarioProfesorService;

@Service
public class HonorarioProfesorServiceImpl implements HonorarioProfesorService
{
	@Autowired
	private HonorarioProfesorDAO honorarioProfesorDAO;
	@Autowired
	private HonorarioAsignadoDAO honorarioAsignadoDAO;
	@Autowired
	private IdiomaEstudiarDAO idiomaEstudiarDAO;
	@Autowired
	private ProfesorDAO profesorDAO;
	@Transactional
	@Override
	public HonorarioProfesor getById(long id) throws HonorarioProfesorInexistente 
	{
		return honorarioProfesorDAO.findById(id).orElseThrow(HonorarioProfesorInexistente::new);
	}

	@Transactional
	@Override
	public List<HonorarioProfesor> buscarHonorariosAsignados(long profesorId) throws ProfesorInexistenteException 
	{
		// Hay que ir a buscar los honorarios asignados!!!
		List<HonorarioProfesor> lista=new LinkedList<HonorarioProfesor>();
		Profesor p=profesorDAO.findById(profesorId).orElseThrow(ProfesorInexistenteException::new);
		List<HonorarioAsignado> asignaciones=honorarioAsignadoDAO.listarHonorariosAsignados(p);
		for(HonorarioAsignado asignacion:asignaciones)
		{
			lista.add(asignacion.getHonorarioProfesor());
		}
		return lista;
	}

	@Override
	@Transactional
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId) throws IdiomaEstudiarInexistente 
	{
		IdiomaEstudiar idiomaEstudiar=idiomaEstudiarDAO.findById(idiomaEstudiarId).orElseThrow(IdiomaEstudiarInexistente::new);
		return honorarioProfesorDAO.buscarHonorariosIdioma(idiomaEstudiar);
	}

	@Override
	@Transactional
	public void agregarHonorario(HonorarioProfesor honorario) 
	{
		// hay que agregar desde que fecha es valido este honorario.
		// Se asume la fecha de hoy.
		honorario.setFecha_desde(new Date());
		honorarioProfesorDAO.save(honorario);
	}

	@Override
	public List<HonorarioProfesor> listarHonorarios() 
	{
		return honorarioProfesorDAO.findAll();
	}
}
