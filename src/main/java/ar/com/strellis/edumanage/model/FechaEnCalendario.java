package ar.com.strellis.edumanage.model;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Transient;

public abstract class FechaEnCalendario 
{
	@Transient
	protected String calendar_id;
	@Transient
	private boolean allDay;
	/**
	 * Este id es uno que se usa para mostrar el calendario en pantalla.
	 * Se usa al momento de la creacion del horario del curso, para mostrar un id
	 * temporal que despues se puede ir a editar, que no tiene nada que ver con el
	 * id que podria venir asignado de la base de datos. Al leer un horario grabado,
	 * este id seria hecho igual al de la base de datos.
	 * @return
	 */
	public String getCalendar_id()
	{
		return calendar_id;
	}
	public void setCalendar_id(String calendar_id)
	{
		this.calendar_id=calendar_id;
	}
	public abstract long getId();
	public abstract Date getFecha();
	public abstract LocalTime getHora_inicio();
	public abstract LocalTime getHora_fin();
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
}
