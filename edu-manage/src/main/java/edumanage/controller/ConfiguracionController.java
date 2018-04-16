package edumanage.controller;

import edumanage.documentation.*;
import edumanage.model.CalendarEntry;
import edumanage.model.Feriado;
import edumanage.service.ConfiguracionService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="configuracion")
@DescripcionClase("Configuracion del sistema")
public class ConfiguracionController extends AppController 
{
	static Logger log = Logger.getLogger(ConfiguracionController.class);

	@Autowired
	private ConfiguracionService configuracionService;
	@PreAuthorize("isAuthenticated() and (hasRole('ROLE_ADMIN') or hasRole('ROLE_CONFIGURACION_MOSTRAR_MENU'))")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Mostrar opciones configurables",permission="ROLE_CONFIGURACION_MOSTRAR_MENU")
	public String menuConfiguracion()
	{
		return "configuracion_index";
	}
	/**
	 * Lista los feriados.
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_USER')")
	@RequestMapping(value="/feriados",method=RequestMethod.GET)
	public @ResponseBody List<CalendarEntry> listarFeriados(
			@RequestParam("start") String desde,
			@RequestParam("end") String hasta,
			@RequestParam("_") String timestamp
			)
	{
		// En el get vienen start y end, que son las fechas entre las cuales
		// tengo que buscar feriados.
		List<CalendarEntry> eventos=new LinkedList<CalendarEntry>();
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date hastaFecha=formatter.parse(hasta);
			Date desdeFecha=formatter.parse(desde);
			List<Feriado> feriados=configuracionService.listarFeriados(desdeFecha, hastaFecha);
			for(Feriado h:feriados)
			{
				CalendarEntry c=new CalendarEntry(h);
				// Por definicion, un feriado es de todo el dia. Eso se carga
				// en el constructor del feriado. La conversion de arriba siempre tiene
				// exito.
				eventos.add(c);
			}
		}
		catch(ParseException e)
		{
			log.fatal(e.getMessage());
		}
		return eventos;
	}
}
