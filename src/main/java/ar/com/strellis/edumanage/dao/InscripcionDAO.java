package ar.com.strellis.edumanage.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.CursoGenerico;
import ar.com.strellis.edumanage.model.Inscripcion;

@Repository
public interface InscripcionDAO extends JpaRepository<Inscripcion,Long>
{
	@Query("select i from Inscripcion i where i.confirmada=0")
	List<Inscripcion> listarInscripcionesAConfirmar();
	List<Inscripcion> findByFechaFinalizacion(Date hoy);
	@Query("select i from Inscripcion i where i.curso=:curso")
	List<Inscripcion> buscarIntegrantesCurso(CursoGenerico curso);

}
