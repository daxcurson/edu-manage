package edumanage.service;

import java.util.List;

import edumanage.model.Inscripcion;
import edumanage.model.Persona;

public interface InscripcionService 
{
	public Inscripcion getById(long id);
	public void grabar_inscripcion(Inscripcion insc,Persona persona);
	public List<Inscripcion> listarInscripcionesAConfirmar();
	public void confirmar_inscripcion(Inscripcion insc);
}
