package edumanage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edumanage.documentation.Descripcion;
import edumanage.documentation.DescripcionClase;
import edumanage.model.*;
import edumanage.model.propertyeditor.*;
import edumanage.model.validacion.ModeloFormInscripcionValidator;
import edumanage.service.*;

@DescripcionClase(value="Inscripciones")
@Controller
@RequestMapping("inscripciones")
@SessionAttributes({"inscripcion","persona"})
public class InscripcionesController extends AppController
{
	static Logger log = Logger.getLogger(InscripcionesController.class);

	@Autowired
	private CursoService cursoService;
	@Autowired
	private PersonaService personaService;
	@Autowired
	private InscripcionService inscripcionService;
	@Autowired
	private NacionalidadService nacionalidadService;
	@Autowired
	private IdiomaNativoService idiomaNativoService;
	@Autowired
	private ComoSupoService comoSupoService;
	@Autowired
	private NivelService nivelService;
	@Autowired
	private TipoCursoService tipoCursoService;
	@Autowired
	private IdiomaEstudiarService idiomaEstudiarService;
	@Autowired
	private OrientacionService orientacionService;
	@Autowired
	private SucursalService sucursalService;
	
	ModeloFormInscripcionValidator modeloFormInscripcionvalidator = null;

	public ModeloFormInscripcionValidator getValidator() {
		return modeloFormInscripcionvalidator;
	}

	@Autowired
	public void setValidator(ModeloFormInscripcionValidator validator) {
		this.modeloFormInscripcionvalidator = validator;
	}

	@InitBinder
    public void initBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.registerCustomEditor(Curso.class, new CursoEditor(cursoService));
		binder.registerCustomEditor(Persona.class, new PersonaEditor(personaService));
		binder.registerCustomEditor(Inscripcion.class, new InscripcionEditor(inscripcionService));
		binder.registerCustomEditor(Nacionalidad.class,new NacionalidadEditor(nacionalidadService));
		binder.registerCustomEditor(IdiomaNativo.class,new IdiomaNativoEditor(idiomaNativoService));
		binder.registerCustomEditor(ComoSupo.class,new ComoSupoEditor(comoSupoService));
		binder.registerCustomEditor(Nivel.class,new NivelEditor(nivelService));
		binder.registerCustomEditor(TipoCurso.class,new TipoCursoEditor(tipoCursoService));
		binder.registerCustomEditor(IdiomaEstudiar.class, new IdiomaEstudiarEditor(idiomaEstudiarService));
		binder.registerCustomEditor(Orientacion.class, new OrientacionEditor(orientacionService));
		binder.registerCustomEditor(TipoCurso.class,new TipoCursoEditor(tipoCursoService));
		binder.registerCustomEditor(Sucursal.class, new SucursalEditor(sucursalService));
	}

	@Descripcion(value="Mostrar menu de inscripciones",permission="ROLE_INSCRIPCIONES_MOSTRAR_MENU")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_INSCRIPCIONES_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	public ModelAndView mostrarMenu(Model model) 
	{
		ModelAndView modelo=new ModelAndView("inscripcion_index");
		return modelo;
	}
	private ModelAndView cargarFormInscripcion(ModeloFormInscripcion modelo_inscripcion)
	{
		ModelAndView modelo=new ModelAndView("inscripcion_inscribir");
		modelo.addObject("modelo_inscripcion",modelo_inscripcion);
		modelo.addObject("nacionalidades",nacionalidadService.listarNacionalidades());
		modelo.addObject("idiomasNativos",idiomaNativoService.listarIdiomasNativos());
		modelo.addObject("comoSupos",comoSupoService.listarComoSupo());
		modelo.addObject("niveles",nivelService.listarNiveles());
		modelo.addObject("tipoCursos",tipoCursoService.listarTiposCurso());
		List<IdiomaEstudiar> listaIdiomas=idiomaEstudiarService.listarIdiomasEstudiar();
		modelo.addObject("idiomasEstudiar",listaIdiomas);
		listaIdiomas.add(new IdiomaEstudiar(0,"Otros/Other"));
		modelo.addObject("idiomasIndividuales",listaIdiomas);
		modelo.addObject("orientaciones",orientacionService.listarOrientaciones());
		modelo.addObject("sucursales",sucursalService.listarSucursales());
		return modelo;
	}
	@RequestMapping(value="/inscribir",method=RequestMethod.GET)
	public ModelAndView nuevoFormInscripcion(Model model)
	{
		Persona p=new Persona();
		InscripcionGrupal g=new InscripcionGrupal();
		InscripcionIndividual i=new InscripcionIndividual();
		ModelAndView modelo=this.cargarFormInscripcion(new ModeloFormInscripcion(p,g,i));
		return modelo;
	}
	@RequestMapping(value="/inscribir",method=RequestMethod.POST)
	public ModelAndView procesarFormInscripcion(
			@Valid
			@ModelAttribute("modelo_inscripcion") ModeloFormInscripcion modelo_inscripcion,
			BindingResult result,ModelMap model)
	{
		//ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		//Validator validator = factory.getValidator();
		//Set<ConstraintViolation<ModeloFormInscripcion>> violations=validator.validate(modelo_inscripcion, InscripcionChecks.class);
		//modeloFormInscripcionvalidator.validate(modelo_inscripcion, result);
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormInscripcion(modelo_inscripcion);
			// Hay que poner un mensaje de error!
			
			model.addAttribute("message",this.getMessage("errores_inscripcion"));
			return modelo;
		}
		else
		{
			try
			{
				Persona persona=modelo_inscripcion.getPersona();
				Inscripcion inscripcion=modelo_inscripcion.getInscripcion();
				inscripcionService.grabar_inscripcion(inscripcion,persona);
				model.addAttribute("message",this.getMessage("inscripcion_recibida"));
				return new ModelAndView("inscripcion_index");
			}
			catch(Exception e)
			{
				log.error("Error: ",e);
			}
			return this.cargarFormInscripcion(modelo_inscripcion);
		}
	}
	@RequestMapping(value="/listar_cursos")
	public @ResponseBody List<Curso> listarCursos(@RequestParam("idioma_estudiar_id") int idiomaEstudiarId,@RequestParam("nivel_id") int nivel)
	{
		// Busco los cursos.
		return cursoService.listarCursosIdiomaNivel(idiomaEstudiarId, nivel);
	}
	/**
	 * Lista las inscripciones que hay para confirmar.
	 * @param model
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_INSCRIPCIONES_LISTAR_INSCRIPCIONES_CONFIRMAR')")
	@Descripcion(value="Listar inscripciones a confirmar",permission="ROLE_INSCRIPCIONES_LISTAR_INSCRIPCIONES_CONFIRMAR")
	@RequestMapping(value="/listar_inscripciones_confirmar")
	public ModelAndView listarInscripcionesAConfirmar(Model model)
	{
		ModelAndView inscripciones=new ModelAndView("inscripcion_listar_inscripciones_confirmar");
		inscripciones.addObject("inscripciones",inscripcionService.listarInscripcionesAConfirmar());
		return inscripciones;
	}
	/**
	 * Busca la inscripcion que hay que confirmar y busca el formulario de inscripcion a confirmar.
	 * @param inscripcion_id
	 * @return
	 */
	public ModelAndView cargarFormConfirmarInscripcion(int inscripcion_id)
	{
		Inscripcion inscripcion=this.inscripcionService.getById(inscripcion_id);
		ModelAndView formInscripcion=new ModelAndView("inscripcion_confirmar_inscripcion");
		formInscripcion.addObject("inscripcion", inscripcion);
		List<IdiomaEstudiar> listaIdiomas=idiomaEstudiarService.listarIdiomasEstudiar();
		formInscripcion.addObject("idiomasEstudiar",listaIdiomas);
		listaIdiomas.add(new IdiomaEstudiar(0,"Otros/Other"));
		formInscripcion.addObject("tipoCursos",tipoCursoService.listarTiposCurso());
		formInscripcion.addObject("niveles",nivelService.listarNiveles());
		formInscripcion.addObject("cursos_posibles",cursoService.listarCursosNoTerminados(0,0,0));
		return formInscripcion;
	}
	/**
	 * Lista los cursos en donde se puede confirmar inscripcion
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_INSCRIPCIONES_LISTAR_INSCRIPCIONES_CONFIRMAR')")
	@RequestMapping(value="/listar_cursos_confirmar",method=RequestMethod.GET)
	public @ResponseBody List<Curso> listar_cursos_confirmar(@RequestParam("tipo_curso_id") int tipo_curso_id,@RequestParam("idioma_estudiar_id") int idioma_estudiar_id,@RequestParam("nivel_id") int nivel_id)
	{
		// Recibe parametros:
		/*
		 * 	tipo_curso_id: $("#InscripcionTipoCursoId").val(),
			idioma_estudiar_id: $("#InscripcionIdiomaEstudiarId").val(),
			nivel_id: $("#InscripcionNivelId").val()
		 */
		return cursoService.listarCursosNoTerminados(tipo_curso_id,idioma_estudiar_id,nivel_id);
	}
	/**
	 * Confirma las inscripciones recibidas. 
	 * @param model
	 * @return
	 */
	@Descripcion(value="Confirmar inscripciones",permission="ROLE_INSCRIPCIONES_CONFIRMAR_INSCRIPCION")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_INSCRIPCIONES_CONFIRMAR_INSCRIPCION')")
	@RequestMapping(value="/confirmar_inscripcion/{inscripcion_id}",method=RequestMethod.GET)
	public ModelAndView confirmarInscripcion(@PathVariable("inscripcion_id") int inscripcion_id)
	{
		return this.cargarFormConfirmarInscripcion(inscripcion_id);
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_INSCRIPCIONES_CONFIRMAR_INSCRIPCION')")
	@RequestMapping(value="/confirmar_inscripcion/{inscripcion_id}",method=RequestMethod.POST)
	public String procesarConfirmarInscripcion(@PathVariable("inscripcion_id") int inscripcion_id,
			@Valid
			@ModelAttribute("inscripcion") Inscripcion inscripcion,
			BindingResult result,ModelMap model,RedirectAttributes redirectAttributes)
	{
		inscripcionService.confirmar_inscripcion(inscripcion);
		redirectAttributes.addFlashAttribute("message",this.getMessage("inscripcion_confirmada"));
		return "redirect:/inscripciones/listar_inscripciones_confirmar";
	}
}
