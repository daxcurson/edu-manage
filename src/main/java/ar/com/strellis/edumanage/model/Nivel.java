package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="niveles")
public class Nivel 
{
	@Id
	@GeneratedValue
	private int id;
	private String descripcion;
	/**
	 * @return the id
	 */
	public int getId() {
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
	public String toString()
	{
		return descripcion;
	}
}
