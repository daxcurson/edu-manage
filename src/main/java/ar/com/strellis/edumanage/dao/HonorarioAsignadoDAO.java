package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.HonorarioAsignado;
import ar.com.strellis.edumanage.model.Profesor;

@Repository
public interface HonorarioAsignadoDAO extends JpaRepository<HonorarioAsignado,Long>
{
	@Query("select h from HonorarioAsignado h where h.profesor=:profesor")
	List<HonorarioAsignado> listarHonorariosAsignados(Profesor profesor);

}
