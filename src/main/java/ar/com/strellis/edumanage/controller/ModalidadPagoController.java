package ar.com.strellis.edumanage.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.strellis.edumanage.documentation.Descripcion;
import ar.com.strellis.edumanage.documentation.DescripcionClase;
import ar.com.strellis.edumanage.model.ModalidadPago;
import ar.com.strellis.edumanage.model.propertyeditor.ModalidadPagoEditor;
import ar.com.strellis.edumanage.service.ModalidadPagoService;

@Controller
@RequestMapping("modalidades_pago")
@DescripcionClase(value="Modalidades de pago")
public class ModalidadPagoController extends AppController
{
	static Logger log = LogManager.getLogger(ClasesController.class);
	
	@Autowired
	private ModalidadPagoService modalidadPagoService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) 
	{
		binder.registerCustomEditor(ModalidadPago.class, new ModalidadPagoEditor(modalidadPagoService));
	}
	
	@Descripcion(value="Mostrar menu",permission="ROLE_MODALIDAD_PAGOS_MOSTRAR_MENU")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_PAGOS_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	public ModelAndView mostrarMenu()
	{
		ModelAndView modelo=new ModelAndView("modalidad_pago_index");
		// Busco las modalidades que hay para mostrarlas.
		modelo.addObject("modalidades_pago",modalidadPagoService.listarModalidadesPago());
		return modelo;
	}
}
