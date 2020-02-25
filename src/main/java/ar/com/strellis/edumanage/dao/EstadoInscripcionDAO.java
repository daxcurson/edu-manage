package ar.com.strellis.edumanage.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.EstadoInscripcion;

@Repository
public interface EstadoInscripcionDAO extends JpaRepository<EstadoInscripcion,Long>
{
	EstadoInscripcion getByAbreviatura(String string);
}
