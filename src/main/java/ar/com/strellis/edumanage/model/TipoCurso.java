package ar.com.strellis.edumanage.model;

import javax.persistence.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Entity
@Table(name="tipo_cursos")
public class TipoCurso implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4406060980617811365L;
	public static final int INDIVIDUAL=1;
	public static final int GRUPAL=2;
	public static final int DUAL=3;
	@Id
    @Column(name="id")
    @GeneratedValue
    private Long id;

    @Column(name="descripcion")
	private String descripcion;
    
    @Column(name="cant_minima_estudiantes")
    private int cant_minima_estudiantes;

	static Logger log = LogManager.getLogger(TipoCurso.class);

    public long getId()
    {
    	return id;
    }
    public void setId(long Id)
    {
    	this.id=Id;
    }
    public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro instanceof TipoCurso)
		{
			// Dos objetos son iguales si se refieren al mismo tipo de curso!!!
			TipoCurso otroTipo=(TipoCurso)otro;
			result=(otroTipo.canEqual(this) && otroTipo.id==this.id && otroTipo.descripcion.equals(this.descripcion));
		}
		return result;
	}
	public int getCant_minima_estudiantes() 
	{
		return cant_minima_estudiantes;
	}
	public void setCant_minima_estudiantes(int cant_minima_estudiantes) 
	{
		this.cant_minima_estudiantes = cant_minima_estudiantes;
	}
	@Override
	public int hashCode()
	{
		return (int) (41*(41+this.id)+this.descripcion.hashCode());
	}
	public boolean canEqual(Object otro)
	{
		return (otro instanceof TipoCurso);
	}
	@Override
	public String toString()
	{
		// Devolver nada mas que la descripcion, total es lo unico que importa.
		return descripcion;
	}
}
