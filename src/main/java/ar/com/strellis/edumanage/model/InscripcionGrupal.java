package ar.com.strellis.edumanage.model;

import javax.persistence.*;

import org.hibernate.envers.Audited;

@Entity
@DiscriminatorValue("Grupal")
@Audited
public class InscripcionGrupal extends Inscripcion
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column(name="lista_espera")
	protected Integer lista_espera;
	/**
	 * Constructor default: pongo algunos valores por defecto al generar una nueva inscripcion
	 * grupal.
	 */
	public InscripcionGrupal()
	{
		this.confirmada=0;
		this.lista_espera=0;
	}
	/**
	 * @return the lista_espera
	 */
	public int getLista_espera() 
	{
		return lista_espera;
	}
	/**
	 * @param lista_espera the lista_espera to set
	 */
	public void setLista_espera(Integer lista_espera) 
	{
		this.lista_espera = lista_espera;
	}
	@Override
	public boolean esValida() 
	{
		return true;
	}
}
