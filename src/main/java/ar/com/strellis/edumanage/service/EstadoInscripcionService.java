package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.EstadoInscripcionInexistente;
import ar.com.strellis.edumanage.model.EstadoInscripcion;

public interface EstadoInscripcionService 
{
	public EstadoInscripcion getById(long id) throws EstadoInscripcionInexistente;
	public List<EstadoInscripcion> listarEstados();
}
