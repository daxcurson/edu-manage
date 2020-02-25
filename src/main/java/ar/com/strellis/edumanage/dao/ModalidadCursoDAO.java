package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.model.ModalidadCurso;
import ar.com.strellis.edumanage.model.ModalidadDisponible;

@Repository
public interface ModalidadCursoDAO extends JpaRepository<ModalidadCurso,Long>
{
	@Query("select m from ModalidadDisponible m where m.id=:id")
	ModalidadDisponible findModalidadDisponible(long id);
	@Query("select m from ModalidadCurso m where :idioma_estudiar member of m.idiomas_asignados")
	List<ModalidadCurso> findByIdiomaEstudiar(IdiomaEstudiar idioma_estudiar);
}
