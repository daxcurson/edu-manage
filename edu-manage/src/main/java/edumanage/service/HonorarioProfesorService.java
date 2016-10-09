package edumanage.service;

import java.util.List;

import edumanage.model.HonorarioProfesor;

public interface HonorarioProfesorService 
{
	public HonorarioProfesor getById(long id);
	public List<HonorarioProfesor> buscarHonorariosAsignados(long profesorId);
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId);
	public void agregarHonorario(HonorarioProfesor honorario);
	public List<HonorarioProfesor> listarHonorarios();
}
