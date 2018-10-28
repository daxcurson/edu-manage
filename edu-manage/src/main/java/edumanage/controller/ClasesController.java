package edumanage.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import edumanage.documentation.Descripcion;
import edumanage.documentation.DescripcionClase;
import edumanage.model.Clase;
import edumanage.service.ClaseService;

@Controller
@RequestMapping("clases")
@DescripcionClase(value="Clases")
public class ClasesController extends AppController
{
	static Logger log = Logger.getLogger(ClasesController.class);
	
	@Autowired
	private ClaseService claseService;
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CLASES_LISTAR')")
	@RequestMapping("/listar_clases_hoy")
	@Descripcion(value="Mostrar menu de cursos",permission="ROLE_CLASES_LISTAR")
	public @ResponseBody List<Clase> listarClasesHoy()
	{
		Date hoy=Calendar.getInstance().getTime();
		return claseService.listarClasesActivasEntreFechas(hoy,hoy);
	}
}
