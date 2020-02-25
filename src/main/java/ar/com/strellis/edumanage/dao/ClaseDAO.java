package ar.com.strellis.edumanage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.Clase;

@Repository
public interface ClaseDAO extends JpaRepository<Clase,Long>
{
	@Query("select c from Clase c where c.fecha_clase>=format and c.fecha_clase<=format2")
	List<Clase> getEntreFechas(String format, String format2);

}
