package edumanage.service.impl;

import java.util.Date;

import org.apache.log4j.Logger;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import edumanage.dao.CuotaDAO;
import edumanage.model.Inscripcion;
import edumanage.service.PagoService;

@Service
public class PagoServiceImpl implements PagoService
{
	static Logger log = Logger.getLogger(PagoServiceImpl.class);
	//@Autowired
	//private CuotaDAO cuotaDAO;
	
	/**
	 * Determina entre que fechas hay que crear las cuotas para esta inscripcion,
	 * dependiendo de las fechas de inicio y de fin de su inscripcion, y las
	 * del curso. Tambien tiene en cuenta la fecha de baja prematura del curso.
	 */
	@Override
	public void crearCuotas(Inscripcion inscripcion) 
	{
		// La fecha de comienzo va a ser la de la inscripcion, salvo que se haya
		// elegido en la confirmacion de inscripcion una fecha que sea anterior
		// a la del comienzo del curso.
		Date fecha_comienzo=inscripcion.getFecha_comienzo();
		if(fecha_comienzo.before(inscripcion.getCurso().getFecha_comienzo()))
		{
			fecha_comienzo=inscripcion.getCurso().getFecha_comienzo();
		}
		// Por defecto, la fecha de fin para crear cuotas es la fecha de fin de curso,
		// salvo que tenga una baja prematura.
		Date fecha_fin=inscripcion.getCurso().getFecha_fin();
		if(fecha_fin.after(inscripcion.getCurso().getFecha_baja()) && inscripcion.getBaja()==1)
		{
			fecha_fin=inscripcion.getCurso().getFecha_baja();
		}
		// A los empleados no les cobro cuotas.
		if(inscripcion.getEmpleado()==0)
			this.crearCuotasEntreFechas(inscripcion, fecha_comienzo, fecha_fin);
	}

	@Override
	public void crearCuotasEntreFechas(Inscripcion inscripcion, Date fecha_desde, Date fecha_hasta) 
	{
		// Primero obtengo la cantidad de cuotas a generar, preguntandole
		// a la modalidad de pago, con las fechas. 
		log.trace("Estoy creando cuotas entre fechas!");
	}
}
