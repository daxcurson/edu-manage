package edumanage.service.impl;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.HonorarioAsignadoDAO;
import edumanage.dao.HonorarioProfesorDAO;
import edumanage.model.HonorarioAsignado;
import edumanage.model.HonorarioProfesor;
import edumanage.service.HonorarioProfesorService;

@Service
public class HonorarioProfesorServiceImpl implements HonorarioProfesorService
{
	@Autowired
	private HonorarioProfesorDAO honorarioProfesorDAO;
	@Autowired
	private HonorarioAsignadoDAO honorarioAsignadoDAO;
	@Transactional
	@Override
	public HonorarioProfesor getById(long id) 
	{
		return honorarioProfesorDAO.getById(id);
	}

	@Transactional
	@Override
	public List<HonorarioProfesor> buscarHonorariosAsignados(long profesorId) 
	{
		// Hay que ir a buscar los honorarios asignados!!!
		List<HonorarioProfesor> lista=new LinkedList<HonorarioProfesor>();
		List<HonorarioAsignado> asignaciones=honorarioAsignadoDAO.listarHonorariosAsignados(profesorId);
		for(HonorarioAsignado asignacion:asignaciones)
		{
			lista.add(asignacion.getHonorarioProfesor());
		}
		return lista;
	}

	@Override
	@Transactional
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId) 
	{
		return honorarioProfesorDAO.buscarHonorariosIdioma(idiomaEstudiarId);
	}

	@Override
	@Transactional
	public void agregarHonorario(HonorarioProfesor honorario) 
	{
		// hay que agregar desde que fecha es valido este honorario.
		// Se asume la fecha de hoy.
		honorario.setFecha_desde(new Date());
		honorarioProfesorDAO.grabar(honorario);
	}

	@Override
	public List<HonorarioProfesor> listarHonorarios() 
	{
		return honorarioProfesorDAO.listarHonorarios();
	}
}
