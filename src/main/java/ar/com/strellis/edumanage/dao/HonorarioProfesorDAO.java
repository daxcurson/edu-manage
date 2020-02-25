package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.HonorarioProfesor;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;

@Repository
public interface HonorarioProfesorDAO extends JpaRepository<HonorarioProfesor,Long>
{
	@Query("select h from HonorarioProfesor h where h.idioma_estudiar=:idiomaEstudiar")
	List<HonorarioProfesor> buscarHonorariosIdioma(IdiomaEstudiar idiomaEstudiar);

}
