package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="niveles")
public class Nivel 
{
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
	public void setId(long id) {
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
	public String toString()
	{
		return descripcion;
	}
}
