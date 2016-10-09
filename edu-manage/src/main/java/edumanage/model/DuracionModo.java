package edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="duracion_modos")
public class DuracionModo implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6774200586102116333L;
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	private String descripcion;
	private String codigo;
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
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
}
