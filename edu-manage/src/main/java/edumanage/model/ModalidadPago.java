package edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="modalidad_pagos")
public class ModalidadPago implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6059388428777978042L;
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	private String descripcion;
	private String modo_facturacion;
	private String modo_calculo;
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
	 * @return the modo_facturacion
	 */
	public String getModo_facturacion() {
		return modo_facturacion;
	}
	/**
	 * @param modo_facturacion the modo_facturacion to set
	 */
	public void setModo_facturacion(String modo_facturacion) {
		this.modo_facturacion = modo_facturacion;
	}
	/**
	 * @return the modo_calculo
	 */
	public String getModo_calculo() {
		return modo_calculo;
	}
	/**
	 * @param modo_calculo the modo_calculo to set
	 */
	public void setModo_calculo(String modo_calculo) {
		this.modo_calculo = modo_calculo;
	}
}
