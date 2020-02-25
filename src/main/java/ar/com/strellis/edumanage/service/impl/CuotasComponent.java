package ar.com.strellis.edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ar.com.strellis.edumanage.model.Inscripcion;
import ar.com.strellis.edumanage.service.PagoService;

@Component
/**
 * Crea cuotas para los estudiantes, puede ser llamado de varios lados y tiene acceso
 * a los Servicios de pagos.
 * @author daxcurson
 *
 */
public class CuotasComponent 
{
	@Autowired
	private PagoService pagoService;
	
	public void crearCuotas(Inscripcion inscripcion)
	{
		pagoService.crearCuotas(inscripcion);
	}
}
