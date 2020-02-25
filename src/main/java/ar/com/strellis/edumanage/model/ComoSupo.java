package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="como_supos")
public class ComoSupo 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;

	@Column(name="descripcion")
	private String descripcion;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
