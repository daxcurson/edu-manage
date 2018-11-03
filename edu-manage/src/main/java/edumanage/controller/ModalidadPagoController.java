package edumanage.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edumanage.documentation.Descripcion;
import edumanage.documentation.DescripcionClase;
import edumanage.model.ModalidadPago;
import edumanage.model.propertyeditor.ModalidadPagoEditor;
import edumanage.service.ModalidadPagoService;

@Controller
@RequestMapping("modalidades_pago")
@DescripcionClase(value="Modalidades de pago")
public class ModalidadPagoController extends AppController
{
	static Logger log = Logger.getLogger(ClasesController.class);
	
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
