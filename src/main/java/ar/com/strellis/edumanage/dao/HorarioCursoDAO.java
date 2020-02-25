package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.HorarioCurso;

@Repository
public interface HorarioCursoDAO extends JpaRepository<HorarioCurso,Long>
{
	@Query("select h from HorarioCurso h where h.curso=:curso")
	List<HorarioCurso> findCursosByHorario(Curso curso);

}
