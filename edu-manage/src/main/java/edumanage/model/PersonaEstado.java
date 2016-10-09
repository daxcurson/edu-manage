package edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="estados")
@DiscriminatorColumn(name="id",discriminatorType=DiscriminatorType.INTEGER)
public class PersonaEstado 
{
	@Id
    @Column(name="id")
    @GeneratedValue
    private Integer id;
	@Column(name="descripcion")
	private String descripcion;
	public Integer getId() 
	{
		return id;
	}
	public void setId(Integer id) 
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
}
