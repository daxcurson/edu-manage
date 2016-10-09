package edumanage.model;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="feriados")
public class Feriado extends FechaEnCalendario
{
	@Id
	@GeneratedValue
	private long id;
	private Date fecha;
	private String descripcion;
	
	/**
	 * Un feriado por definicion es de todo el dia.
	 */
	public Feriado()
	{
		super();
		this.setAllDay(true);
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public LocalTime getHora_inicio() 
	{
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public LocalTime getHora_fin() {
		// TODO Auto-generated method stub
		return null;
	}
}
