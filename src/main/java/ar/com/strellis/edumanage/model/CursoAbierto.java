package ar.com.strellis.edumanage.model;

public class CursoAbierto extends CursoEstado 
{
	public static final String ABIERTO="S";
	
	public CursoAbierto()
	{
		this.nombre=ABIERTO;
		this.descripcion=new String("Abierto");
	}

	@Override
	/**
	 * Si un curso esta abierto y se recibe una inscripcion, hay que crearle
	 * cuotas al estudiante!!!
	 */
	public CursoEstado inscripcionRecibida(Inscripcion insc) 
	{
		// No hay qeu cambiar nada.
		return insc.getCurso().getAbierto();
	}

	@Override
	public CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor) 
	{
		// En este estado no hay que devolver ningun cambio de estado
		return curso.getAbierto();
	}

	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro !=null && otro instanceof CursoAbierto)
			return true;
		return result;
	}
}
