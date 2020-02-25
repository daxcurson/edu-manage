package ar.com.strellis.edumanage.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.Feriado;

@Repository
public interface FeriadosDAO extends JpaRepository<Feriado,Long>
{
	Feriado findByFecha(Date fechaProxClase);
	@Query("select f from Feriado f where fecha >= :desde and fecha <= :hasta")
	List<Feriado> findEntreFechas(Date desde, Date hasta);
}
