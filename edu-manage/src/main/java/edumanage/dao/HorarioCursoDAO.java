package edumanage.dao;

import java.util.List;

import edumanage.model.Curso;
import edumanage.model.HorarioCurso;

public interface HorarioCursoDAO 
{
	public List<HorarioCurso> listarHorariosCurso(Curso curso);
	public HorarioCurso getById(long id);
}
