package edumanage.model;

import edumanage.excepciones.ExceptionEstadoCursoInvalido;

public class CursoBaja extends CursoEstado 
{
	public static final String BAJA="B";
	
	public CursoBaja()
	{
		this.nombre=BAJA;
		this.descripcion=new String("Baja");
	}

	@Override
	/**
	 * Si el curso esta dado de baja, no se pueden recibir inscripciones.
	 */
	public CursoEstado inscripcionRecibida(Inscripcion insc) throws ExceptionEstadoCursoInvalido
	{
		//
		throw new ExceptionEstadoCursoInvalido("El estado del curso es baja. No puedo inscribir estudiantes");
	}

	@Override
	/**
	 * No se puede asignar profesor en un curso dado de baja.
	 */
	public CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor) 
	{
		//
		throw new ExceptionEstadoCursoInvalido("El estado del curso es baja. No puedo cambiar el profesor");
	}
	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro instanceof CursoBaja)
			return true;
		return result;
	}
}
