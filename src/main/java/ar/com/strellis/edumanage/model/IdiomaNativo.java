package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="idioma_nativos")
public class IdiomaNativo 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	
	@Column(name="descripcion")
	private String descripcion;
	
	@Column(name="descripcion_ingles")
	private String descripcion_ingles;
	
	public void setId(long i)
	{
		id=i;
	}
	public long getId()
	{
		return this.id;
	}
	public String getDescripcion_ingles() {
		return descripcion_ingles;
	}
	public void setDescripcion_ingles(String descripcion_ingles) {
		this.descripcion_ingles = descripcion_ingles;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public boolean equals(Object otro)
	{
		boolean result=false;
		if(otro instanceof IdiomaNativo)
		{
			// Dos objetos son iguales si se refieren al mismo idioma!!!
			IdiomaNativo otroIdioma=(IdiomaNativo)otro;
			result=(otroIdioma.canEqual(this) && otroIdioma.id==this.id && otroIdioma.descripcion.equals(this.descripcion));
		}
		return result;
	}
	@Override
	public int hashCode()
	{
		return (int) (41*(41+this.id)+this.descripcion.hashCode());
	}
	public boolean canEqual(Object otro)
	{
		return (otro instanceof IdiomaNativo);
	}
}
