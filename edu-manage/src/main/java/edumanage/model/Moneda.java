package edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="monedas")
public class Moneda implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 678695254675788208L;
	@Id
	@GeneratedValue
	private int id;
	private String descripcion;
	private Double tasa_cambio;
	private String simbolo;
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
	/**
	 * @return the tasa_cambio
	 */
	public Double getTasa_cambio() {
		return tasa_cambio;
	}
	/**
	 * @param tasa_cambio the tasa_cambio to set
	 */
	public void setTasa_cambio(Double tasa_cambio) {
		this.tasa_cambio = tasa_cambio;
	}
	/**
	 * @return the simbolo
	 */
	public String getSimbolo() {
		return simbolo;
	}
	/**
	 * @param simbolo the simbolo to set
	 */
	public void setSimbolo(String simbolo) {
		this.simbolo = simbolo;
	}
}
