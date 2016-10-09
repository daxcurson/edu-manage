package edumanage.model;

import edumanage.model.eventos.AperturaCurso;

public class CursoEsperandoEstudiantes extends CursoEstado 
{
	public static final String ESPERANDO_ESTUDIANTES="A";
	
	public CursoEsperandoEstudiantes()
	{
		this.nombre=ESPERANDO_ESTUDIANTES;
		this.descripcion=new String("Esperando Estudiantes");
	}

	@Override
	/**
	 * Si el curso esta esperando estudiantes, hay que ver si se supero la cantidad
	 * minima o si el curso es de espanol para abrirlo.
	 */
	public CursoEstado inscripcionRecibida(Inscripcion insc) 
	{
		CursoGenerico curso=insc.getCurso();
		if(curso.getIdioma_estudiar().getId()==IdiomaEstudiar.ESPANOL)
		{
			log.trace("El curso es de espanol. Hay que abrir de inmediato.");
			log.trace("En algun lado habria que avisar que el curso esta abierto y que es momento de cargar cuotas");
			publisher.publishEvent(new AperturaCurso(curso));
			return new CursoAbierto();
		}
		else
		{
			// me fijo si estoy por arriba de la cantidad minima. Si es asi, abro.
			log.trace("El curso no es de espanol, me tengo que fijar si se supera la cantidad minima de estudiantes");
			if(curso.getInscriptos()>=curso.getTipo_curso().getCant_minima_estudiantes())
			{
				log.trace("La cantidad es mayor al minimo, hay que abrir");
				publisher.publishEvent(new AperturaCurso(curso));
				return new CursoAbierto();
			}
		}
		return insc.getCurso().getAbierto();
	}

	@Override
	/**
	 * Si estoy esperando estudiantes y asigno profesor, no hay que hacer nada.
	 */
	public CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor) 
	{
		return curso.getAbierto();
	}
}
