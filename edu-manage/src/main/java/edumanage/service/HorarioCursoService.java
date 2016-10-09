package edumanage.service;

import java.util.List;

import edumanage.model.Curso;
import edumanage.model.HorarioCurso;

public interface HorarioCursoService 
{
	public HorarioCurso getById(long id);
	public List<HorarioCurso> listarHorarios(Curso curso);
}
