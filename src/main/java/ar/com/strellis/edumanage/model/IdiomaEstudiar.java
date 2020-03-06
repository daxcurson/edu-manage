package ar.com.strellis.edumanage.model;

import javax.persistence.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Entity
@Table(name="idioma_estudiares")
public class IdiomaEstudiar implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5119129690937245558L;
	static Logger log = LogManager.getLogger(IdiomaEstudiar.class);
	public static final int ESPANOL=2;
	public static final int INGLES=1;
	public IdiomaEstudiar()
	{
		
	}
	public IdiomaEstudiar(long id,String desc)
	{
		this.id=id;
		this.descripcion=desc;
	}
	@Id
	@GeneratedValue
	private long id;
	private String descripcion;
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro instanceof IdiomaEstudiar)
		{
			// Dos objetos son iguales si se refieren al mismo idioma!!!
			IdiomaEstudiar otroIdioma=(IdiomaEstudiar)otro;
			result=(otroIdioma.canEqual(this) && otroIdioma.id==this.id && otroIdioma.descripcion.equals(this.descripcion));
		}
		return result;
	}
	@Override
	public int hashCode()
	{
		return (int) (25013*(25013+this.id)+this.descripcion.hashCode());
	}
	public boolean canEqual(Object otro)
	{
		return (otro instanceof IdiomaEstudiar);
	}
	@Override
	public String toString()
	{
		// Devolver nada mas que la descripcion, total es lo unico que importa.
		return descripcion;
	}
}
