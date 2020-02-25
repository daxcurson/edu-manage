package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.HonorarioProfesorInexistente;
import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.exceptions.ProfesorInexistenteException;
import ar.com.strellis.edumanage.model.HonorarioProfesor;

public interface HonorarioProfesorService 
{
	public HonorarioProfesor getById(long id) throws HonorarioProfesorInexistente;
	public List<HonorarioProfesor> buscarHonorariosAsignados(long profesorId) throws ProfesorInexistenteException;
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId) throws IdiomaEstudiarInexistente;
	public void agregarHonorario(HonorarioProfesor honorario);
	public List<HonorarioProfesor> listarHonorarios();
}
