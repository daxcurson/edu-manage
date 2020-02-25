package ar.com.strellis.edumanage.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.PersonaEstado;

@Repository
public interface PersonaEstadoDAO extends JpaRepository<PersonaEstado,Long>
{

}
