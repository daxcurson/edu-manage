package edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="nacionalidades")
public class Nacionalidad 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	
	@Column(name="descripcion")
	private String descripcion;
	
	@Column(name="descripcion_ingles")
	private String descripcion_ingles;

	public long getId() 
	{
		return id;
	}

	public void setId(long id) 
	{
		this.id = id;
	}

	public String getDescripcion() 
	{
		return descripcion;
	}

	public void setDescripcion(String descripcion) 
	{
		this.descripcion = descripcion;
	}

	public String getDescripcion_ingles() 
	{
		return descripcion_ingles;
	}

	public void setDescripcion_ingles(String descripcion_ingles) 
	{
		this.descripcion_ingles = descripcion_ingles;
	}
}
