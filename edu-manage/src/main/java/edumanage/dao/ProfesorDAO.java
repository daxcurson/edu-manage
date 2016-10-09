package edumanage.dao;

import java.util.List;

import edumanage.model.Profesor;

public interface ProfesorDAO 
{
	public Profesor getById(long id);
	public List<Profesor> listarProfesores();
	public List<Profesor> listarProfesoresPorPagina(int primerRegistro, int largoPagina);
	public Long cantidadTotal();
	public void grabar(Profesor p);
}
