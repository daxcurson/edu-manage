package edumanage.service;

import java.util.List;

import edumanage.model.EstadoInscripcion;

public interface EstadoInscripcionService 
{
	public EstadoInscripcion getById(long id);
	public List<EstadoInscripcion> listarEstados();
}
