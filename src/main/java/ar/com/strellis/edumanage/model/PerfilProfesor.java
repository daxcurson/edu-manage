package ar.com.strellis.edumanage.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="perfil_profesores")
public class PerfilProfesor 
{
	@Id
	@Column(name="id",insertable = true, updatable = true,nullable = false)
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
