package edumanage.model;

import edumanage.model.eventos.AperturaCurso;

public class CursoEsperandoProfesor extends CursoEstado 
{
	public static final String ESPERANDO_PROFESOR="E";
	
	public CursoEsperandoProfesor()
	{
		this.nombre=ESPERANDO_PROFESOR;
		this.descripcion=new String("Esperando Profesor");
	}

	@Override
	/**
	 * Un curso que esta esperando profesor tiene ya la cantidad de estudiantes
	 * que necesita para estar abierto, solo que no tiene profesor asignado. No
	 * habria que hacer nada extra al recibir una inscripcion adicional.
	 */
	public CursoEstado inscripcionRecibida(Inscripcion insc) 
	{
		// Por ahora nada.
		return insc.getCurso().getAbierto();
	}

	@Override
	/**
	 * Si estoy esperando profesor y asigno, hay que abrir el curso.
	 */
	public CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor) 
	{
		// Mando un evento de apertura de curso!!
		publisher.publishEvent(new AperturaCurso(curso));
		return new CursoAbierto();
	}
}
