package edumanage.model;

import org.apache.log4j.Logger;

public class CursoCerrado extends CursoEstado
{
	static Logger log = Logger.getLogger(CursoCerrado.class);

	public static final String CERRADO="N";
	
	public CursoCerrado()
	{
		this.nombre=CERRADO;
		this.descripcion=new String("Cerrado");
	}

	@Override
	/**
	 * En un curso cerrado, si la inscripcion es en un curso de espanol, 
	 * hay que pasar al estado esperando profesor inmediatamente. Pero si no
	 * es de espanol, hay que ver si la cantidad de estudiantes de este curso
	 * es superior a la minima planteada para el tipo de curso. Si lo es,
	 * hay que cambiar.
	 * 
	 * De lo contrario, devuelvo el estado actual.
	 */
	public CursoEstado inscripcionRecibida(Inscripcion insc) 
	{
		CursoGenerico curso=insc.getCurso();
		if(curso.getIdioma_estudiar().getId()==IdiomaEstudiar.ESPANOL)
		{
			log.trace("El curso es de espanol. Hay que abrir de inmediato.");
			return new CursoEsperandoProfesor();
		}
		else
		{
			// me fijo si estoy por arriba de la cantidad minima. Si es asi, abro.
			log.trace("El curso no es de espanol, me tengo que fijar si se supera la cantidad minima de estudiantes");
			if(curso.getInscriptos()>=curso.getTipo_curso().getCant_minima_estudiantes())
			{
				log.trace("La cantidad es mayor al minimo, hay que abrir");
				return new CursoEsperandoProfesor();
			}
		}
		// Si ninguna condicion se cumple, o arrojo una excepcion, o no
		// devuelvo nada... 
		return curso.getAbierto();
	}

	@Override
	/**
	 * Si estoy en un curso cerrado y asigno profesor, hay que pasar a esperando
	 * estudiantes.
	 */
	public CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor) 
	{
		// En cualquier caso, hay que pasar a esperando estudiantes.
		log.trace("Asigno profesor, hay que pasar a esperando estudiantes");
		if(curso.getAbierto().equals(new CursoEsperandoProfesor()))
			return new CursoAbierto();
		else
			return new CursoEsperandoEstudiantes();
	}
	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro instanceof CursoCerrado)
			return true;
		return result;
	}
}
