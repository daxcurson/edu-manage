package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.CursoGenerico;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.model.Nivel;

@Repository
public interface CursoDAO extends JpaRepository<CursoGenerico,Long> 
{
	List<Curso> findByVigente(boolean esVigente);
	@Query("select c from Curso c where c.idioma_estudiar=:idioma and c.nivel=:nivel")
	List<Curso> findByIdioma_estudiarAndNivel(IdiomaEstudiar idioma, Nivel nivel);
	@Query("select c from Curso c where c.clases is empty")
	List<Curso> listarCursosSinClases();
}
