package edumanage.model;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

/**
 * Las entradas de calendario tienen un formato muy especifico, para que
 * despues se puedan convertir en Json.
 * @author daxcurson
 *
 */
public class CalendarEntry 
{
	private String id;
	private String title;
	private Date start;
	private Date end;
	private boolean allDay;
	
	/**
	 * Creo una entrada de calendario a partir del HorarioCurso que es leido
	 * de la base de datos o sacado del curso
	 * @param h
	 */
	public CalendarEntry(FechaEnCalendario h)
	{
		// Si el id que esta dentro del HorarioCurso es distinto de cero,
		// usarlo. Si no, usar el calendar_id. Si ese tambien es cero o nulo,
		// inventar uno.
		if(h.getId()!=0)
			setId(String.valueOf(h.getId()));
		else if(h.getCalendar_id()!=null && h.getCalendar_id()!="")
			setId(h.getCalendar_id());
		else
			setId(UUID.randomUUID().toString());
		Calendar calendario=Calendar.getInstance(TimeZone.getTimeZone("GMT"));
		calendario.setTime(h.getFecha());
		// Le cargo el dia. Un feriado por definicion es de todo el dia.
		if(!h.isAllDay())
		{
			calendario.set(Calendar.HOUR_OF_DAY, h.getHora_inicio().getHour());
			calendario.set(Calendar.MINUTE, h.getHora_inicio().getMinute());
			setStart(calendario.getTime());
			// ahora la hora de fin.
			calendario.set(Calendar.HOUR_OF_DAY, h.getHora_fin().getHour());
			calendario.set(Calendar.MINUTE, h.getHora_fin().getMinute());
			setEnd(calendario.getTime());
		}
		else
		{
			this.allDay=true;
			setStart(calendario.getTime());
		}
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
}
