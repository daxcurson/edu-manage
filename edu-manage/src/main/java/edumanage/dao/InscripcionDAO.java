package edumanage.dao;

import java.util.List;

import edumanage.model.CursoGenerico;
import edumanage.model.Inscripcion;

public interface InscripcionDAO 
{
	public List<Inscripcion> listarInscripcionesHoy();
	public Inscripcion getById(long id);
	public void grabarNueva(Inscripcion insc);
	public void grabar(Inscripcion insc);
	public List<Inscripcion> listarInscripcionesAConfirmar();
	public List<Inscripcion> buscarIntegrantesCurso(CursoGenerico curso);
	public List<Inscripcion> listarInscripcionesTerminanHoy();
}
