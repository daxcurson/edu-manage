package ar.com.strellis.edumanage.service;

import java.util.List;

import org.springframework.data.domain.Page;

import ar.com.strellis.edumanage.exceptions.PerfilProfesorInexistenteException;
import ar.com.strellis.edumanage.exceptions.ProfesorInexistenteException;
import ar.com.strellis.edumanage.model.PerfilProfesor;
import ar.com.strellis.edumanage.model.Profesor;

public interface ProfesorService 
{
	public Profesor getById(long id) throws ProfesorInexistenteException;
	public List<Profesor> listarProfesores();
	public Page<Profesor> listarProfesoresPorPagina(int primerRegistro,int largoPagina);
	public long cantidadProfesores();
	public void agregarProfesor(Profesor profesor);
	public List<PerfilProfesor> listarPerfilProfesores();
	public PerfilProfesor getPerfilById(long id) throws PerfilProfesorInexistenteException;
}
