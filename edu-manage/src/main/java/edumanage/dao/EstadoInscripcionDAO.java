package edumanage.dao;

import java.util.List;

import edumanage.model.EstadoInscripcion;

public interface EstadoInscripcionDAO 
{
	public List<EstadoInscripcion> listarEstados();
	public EstadoInscripcion getById(long id);
	public EstadoInscripcion getByAbreviatura(String abreviatura);
}
