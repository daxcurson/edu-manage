package edumanage.service;

import java.util.List;

import edumanage.model.PerfilProfesor;
import edumanage.model.Profesor;

public interface ProfesorService 
{
	public Profesor getById(long id);
	public List<Profesor> listarProfesores();
	public List<Profesor> listarProfesoresPorPagina(int primerRegistro,int largoPagina);
	public long cantidadProfesores();
	public void agregarProfesor(Profesor profesor);
	public List<PerfilProfesor> listarPerfilProfesores();
	public PerfilProfesor getPerfilById(long id);
}
