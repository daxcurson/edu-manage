package edumanage.service;

import java.util.Date;

import edumanage.model.Inscripcion;

public interface PagoService 
{
	public void crearCuotas(Inscripcion inscripcion);
	public void crearCuotasEntreFechas(Inscripcion inscripcion,Date fecha_desde,Date fecha_hasta);
}
