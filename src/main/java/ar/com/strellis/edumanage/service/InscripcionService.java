package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.CursoInexistenteException;
import ar.com.strellis.edumanage.exceptions.InscripcionInexistenteException;
import ar.com.strellis.edumanage.exceptions.PersonaEstadoInexistenteException;
import ar.com.strellis.edumanage.model.Inscripcion;
import ar.com.strellis.edumanage.model.Persona;

public interface InscripcionService 
{
	public Inscripcion getById(long id) throws InscripcionInexistenteException;
	public void grabar_inscripcion(Inscripcion insc,Persona persona) throws CursoInexistenteException, PersonaEstadoInexistenteException;
	public List<Inscripcion> listarInscripcionesAConfirmar();
	public void confirmar_inscripcion(Inscripcion insc);
	public List<Inscripcion> listarInscripcionesTerminanHoy();
}
