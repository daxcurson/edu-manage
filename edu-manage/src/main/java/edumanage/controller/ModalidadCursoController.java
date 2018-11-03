package edumanage.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.*;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import edumanage.model.*;
import edumanage.model.propertyeditor.*;
import edumanage.service.*;
import edumanage.documentation.*;

@DescripcionClase(value="Modalidad de cursos")
@Controller
@RequestMapping("modalidades_curso")
public class ModalidadCursoController 
{
	static Logger log = Logger.getLogger(CursosController.class);
	@Autowired
	private ModalidadCursoService modalidadCursoService;
	@Autowired
	private CargaHorariaService cargaHorariaService;
	@Autowired
	private IdiomaEstudiarService idiomaEstudiarService;
	@Autowired
	private ModalidadPagoService modalidadPagoService;
	@Autowired
	private DuracionModoService duracionModoService;
	@Autowired
	private MonedaService monedaService;

	@InitBinder
    public void initBinder(WebDataBinder binder) 
	{
		binder.registerCustomEditor(CargaHoraria.class, new CargaHorariaEditor(cargaHorariaService));
		binder.registerCustomEditor(IdiomaEstudiar.class, new IdiomaEstudiarEditor(idiomaEstudiarService));
		binder.registerCustomEditor(ModalidadPago.class, new ModalidadPagoEditor(modalidadPagoService));
		binder.registerCustomEditor(DuracionModo.class, new DuracionModoEditor(duracionModoService));
		binder.registerCustomEditor(Moneda.class, new MonedaEditor(monedaService));
	}
	
	@Descripcion(value="Mostrar menu",permission="ROLE_MODALIDAD_CURSOS_MOSTRAR_MENU")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_CURSOS_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	public ModelAndView mostrarMenu()
	{
		ModelAndView modelo=new ModelAndView("modalidad_curso_index");
		// Busco las modalidades que hay para mostrarlas.
		modelo.addObject("modalidades_curso",modalidadCursoService.listarModalidadesCurso());
		return modelo;
	}
	private ModelAndView cargarFormAgregarModalidad(String accion,ModalidadCurso m)
	{
		ModelAndView modelo=new ModelAndView("modalidad_curso_"+accion);
		modelo.addObject("modalidad_curso",m);
		modelo.addObject("cargas_horarias",cargaHorariaService.listarCargasHorarias());
		modelo.addObject("idiomas_estudiar",idiomaEstudiarService.listarIdiomasEstudiar());
		modelo.addObject("modalidades_pago",modalidadPagoService.listarModalidadesPago());
		modelo.addObject("monedas",monedaService.listarMonedas());
		modelo.addObject("duraciones",duracionModoService.listarModos());
		List<IdiomaEstudiar> idiomas_asignados=modalidadCursoService.listarIdiomasAsignados(m);
		modelo.addObject("idiomas_asignados",idiomas_asignados);
		return modelo;
	}
	@Descripcion(value="Agregar modalidad de curso",permission="ROLE_MODALIDAD_CURSOS_AGREGAR_MODALIDAD")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_CURSOS_AGREGAR_MODALIDAD')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar()
	{
		ModelAndView modelo=this.cargarFormAgregarModalidad("add", new ModalidadCurso());
		modelo.addObject("titulo","Agregar Modalidad de cursada");
		modelo.addObject("accion","add");
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_CURSOS_AGREGAR_MODALIDAD')")
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView add(@Valid @ModelAttribute("modalidad_curso")
	ModalidadCurso modalidad_curso, BindingResult result,ModelMap model)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormAgregarModalidad("add", modalidad_curso);
			return modelo;
		}
		else
		{
			modalidadCursoService.addModalidadCurso(modalidad_curso);
			model.addAttribute("message","Modalidad de curso agregada exitosamente");
			return new ModelAndView("modalidad_curso_index");
		}
	}
	@Descripcion(value="Editar modalidad de curso",permission="ROLE_MODALIDAD_CURSOS_EDITAR_MODALIDAD")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_CURSOS_EDITAR_MODALIDAD')")
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public ModelAndView mostrarFormEditar(@PathVariable long id,Model model)
	{
		ModalidadCurso m=modalidadCursoService.getById(id);
		ModelAndView modelo=this.cargarFormAgregarModalidad("edit", m);
		modelo.addObject("titulo","Editar Modalidad de cursada");
		modelo.addObject("accion","edit");
		return modelo;		
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MODALIDAD_CURSOS_EDITAR_MODALIDAD')")
	@RequestMapping(value="/edit/{id}",method=RequestMethod.POST)
	public ModelAndView edit(@PathVariable long id,@Valid @ModelAttribute("modalidad_curso")
	ModalidadCurso modalidad_curso, BindingResult result,ModelMap model, HttpServletRequest r)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormAgregarModalidad("edit", modalidad_curso);
			return modelo;
		}
		else
		{
			modalidadCursoService.editModalidadCurso(modalidad_curso);
			model.addAttribute("message","Modalidad de curso agregada exitosamente");
			return new ModelAndView("modalidad_curso_index");
		}		
	}
	@RequestMapping(value="/listar_modalidades_curso")
	public @ResponseBody List<ModalidadCurso> ListarModalidades(
			@RequestParam(value="idioma_estudiar_id",required=true) Integer idioma_estudiar_id,
			@RequestParam(value="tipo_curso_id",required=true) Integer tipo_curso_id)
	{
		return modalidadCursoService.listarModalidadesCursoPorIdioma(idioma_estudiar_id, tipo_curso_id);
	}

}
