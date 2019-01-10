package edumanage.controller;

import edumanage.documentation.*;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edumanage.model.CargaHoraria;
import edumanage.model.TipoCurso;
import edumanage.model.propertyeditor.TipoCursoEditor;
import edumanage.service.CargaHorariaService;
import edumanage.service.TipoCursoService;

@DescripcionClase(value="Carga Horaria")
@Controller
@RequestMapping("carga_horaria")
@SessionAttributes
public class CargaHorariaController extends AppController
{
	static Logger log = Logger.getLogger(CursosController.class);
	@Autowired
	private CargaHorariaService cargaHorariaService;
	@Autowired
	private TipoCursoService tipoCursoService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) 
	{
		binder.registerCustomEditor(TipoCurso.class, new TipoCursoEditor(tipoCursoService));
	}
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CARGA_HORARIA_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Ver cargas horarias disponibles",permission="ROLE_CARGA_HORARIA_MOSTRAR_MENU")
	public ModelAndView mostrarMenu(Model model) 
	{
		ModelAndView modelo=new ModelAndView("carga_horaria_index");
		modelo.addObject("cargas_horarias",cargaHorariaService.listarCargasHorarias());
		return modelo;
	}
	private ModelAndView cargarFormCargaHoraria(CargaHoraria carga)
	{
		ModelAndView modelo=new ModelAndView("carga_horaria_add");
		modelo.addObject("carga_horaria",carga);
		modelo.addObject("tiposcurso",tipoCursoService.listarTiposCurso());
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CARGA_HORARIA_AGREGAR')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormCargaHoraria(new CargaHoraria());
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CARGA_HORARIA_AGREGAR')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@Descripcion(value="Agregar carga horaria",permission="ROLE_CARGA_HORARIA_AGREGAR")
	public ModelAndView addCargaHoraria(@Valid @ModelAttribute("carga_horaria")
	CargaHoraria carga_horaria, BindingResult result,ModelMap model)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormCargaHoraria(carga_horaria);
			return modelo;
		}
		else
		{
			cargaHorariaService.addCargaHoraria(carga_horaria);
			model.addAttribute("message","Carga horaria agregada exitosamente");
			return new ModelAndView("carga_horaria_index");
		}
	}
}
