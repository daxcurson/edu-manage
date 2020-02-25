package ar.com.strellis.edumanage.controller;

import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ar.com.strellis.edumanage.service.MonedaService;
import ar.com.strellis.edumanage.documentation.Descripcion;
import ar.com.strellis.edumanage.documentation.DescripcionClase;
import ar.com.strellis.edumanage.exceptions.MonedaExistenteException;
import ar.com.strellis.edumanage.model.Moneda;

@Controller
@RequestMapping("monedas")
@SessionAttributes({"moneda"})
@DescripcionClase(value="Monedas")
public class MonedasController extends AppController
{
	private static Logger log=LogManager.getLogger(MonedasController.class);
	@Autowired
	private MonedaService monedaService;
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MONEDAS_ADMINISTRAR')")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Listar monedas a administrar",permission="ROLE_MONEDAS_ADMINISTRAR")
	public ModelAndView mostrarMenu()
	{
		ModelAndView model=new ModelAndView("moneda_index");
		model.addObject("monedas",monedaService.listarMonedas());
		return model;
	}
	private ModelAndView cargarFormMoneda(Moneda moneda)
	{
		ModelAndView modelo=new ModelAndView("moneda_add");
		modelo.addObject("moneda",moneda);
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MONEDAS_AGREGAR')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormMoneda(new Moneda());
		return modelo;
	}
	@Descripcion(value="Agregar moneda",permission="ROLE_MONEDAS_AGREGAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MONEDAS_AGREGAR')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addGroup(@Valid @ModelAttribute("moneda")
	Moneda moneda,
	BindingResult result,ModelMap model, final RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormMoneda(moneda);
			return modelo;
		}
		else
		{
			ModelAndView modelo=new ModelAndView("redirect:/monedas/index");
			try
			{
				monedaService.save(moneda);
				redirectAttributes.addFlashAttribute("message","Moneda agregada exitosamente");
			}
			catch(MonedaExistenteException e)
			{
				model.addAttribute("message","Esa monedaya existe, por favor elija otra");
				modelo=this.cargarFormMoneda(moneda);
			}
			return modelo;
		}
	}
}
