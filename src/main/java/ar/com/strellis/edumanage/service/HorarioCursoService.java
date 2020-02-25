package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.HorarioCursoInexistente;
import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.HorarioCurso;

public interface HorarioCursoService 
{
	public HorarioCurso getById(long id) throws HorarioCursoInexistente;
	public List<HorarioCurso> listarHorarios(Curso curso);
}
