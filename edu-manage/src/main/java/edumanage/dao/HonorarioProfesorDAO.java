package edumanage.dao;

import java.util.List;

import edumanage.model.HonorarioProfesor;

public interface HonorarioProfesorDAO 
{
	public HonorarioProfesor getById(long id);
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId);
	public void grabar(HonorarioProfesor honorario);
	public List<HonorarioProfesor> listarHonorarios();
}
