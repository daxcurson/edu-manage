package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="estado_inscripcion")
public class EstadoInscripcion 
{
	@Id
    @Column(name="id")
    @GeneratedValue
	private int id;
	@Column(name="descripcion")
	private String descripcion;
	@Column(name = "abreviatura", insertable = false, updatable = false)
	private String abreviatura;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getAbreviatura() {
		return abreviatura;
	}
	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}
}
