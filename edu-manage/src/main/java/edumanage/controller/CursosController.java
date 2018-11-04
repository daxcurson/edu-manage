package edumanage.controller;

import edumanage.documentation.*;
import edumanage.excepciones.ExceptionErrorAsignacionProfesor;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edumanage.model.*;
import edumanage.model.listados.ListadoCursosItem;
import edumanage.model.listados.ListadoPaginado;
import edumanage.model.propertyeditor.*;
import edumanage.service.*;

@Controller
@RequestMapping("cursos")
@SessionAttributes({"curso","clases","modalidadesdisponibles"})
@DescripcionClase(value="Cursos")
public class CursosController extends AppController
{
	static Logger log = Logger.getLogger(CursosController.class);
	@Autowired
	private CursoService cursoService;
	@Autowired
	private SucursalService sucursalService;
	@Autowired
	private NivelService nivelService;
	@Autowired
	private MonedaService monedaService;
	@Autowired
	private IdiomaEstudiarService idiomaEstudiarService;
	@Autowired
	private ModalidadPagoService modalidadPagoService;
	@Autowired
	private TipoCursoService tipoCursoService;
	@Autowired
	private ModalidadCursoService modalidadCursoService;
	@Autowired
	private HorarioCursoService horarioCursoService;
	@Autowired
	private ProfesorService profesorService;

	@InitBinder
	public void initBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.registerCustomEditor(LocalTime.class,new LocalTimeEditor(false));
		binder.registerCustomEditor(Sucursal.class, new SucursalEditor(sucursalService));
		binder.registerCustomEditor(Nivel.class, new NivelEditor(nivelService));
		binder.registerCustomEditor(Moneda.class, new MonedaEditor(monedaService));
		binder.registerCustomEditor(IdiomaEstudiar.class, new IdiomaEstudiarEditor(idiomaEstudiarService));
		binder.registerCustomEditor(ModalidadPago.class, new ModalidadPagoEditor(modalidadPagoService));
		binder.registerCustomEditor(TipoCurso.class, new TipoCursoEditor(tipoCursoService));
		binder.registerCustomEditor(ModalidadDisponible.class, new ModalidadDisponibleEditor(modalidadCursoService));
		binder.registerCustomEditor(HorarioCurso.class,new HorarioCursoEditor(horarioCursoService));
    }
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Mostrar menu de cursos",permission="ROLE_CURSOS_MOSTRAR_MENU")
	public ModelAndView mostrarMenu(Model model) 
	{
		ModelAndView modelo=new ModelAndView("curso_index");
		modelo.addObject("controller","Cursos");
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_MOSTRAR_MENU')")
	@RequestMapping("/listar_cursos")
	@Descripcion(value="Mostrar menu de cursos",permission="ROLE_CURSOS_MOSTRAR_MENU")
	public @ResponseBody ListadoPaginado<ListadoCursosItem> listarCursos(
			@RequestParam Map<String, String> requestParams)
	{
		// Busco los cursos iniciales que tienen que aparecer en pantalla.
		/*
		 * Recibiria por parametro la lista de filtros a aplicar a la lista,
		 * aqui se interpretaria la solicitud, se invocaria al metodo necesario en el Servicio,
		 * y despues se retornaria 
		 */
		int resultsPerPage=3;
		ListadoPaginado<Curso> c=cursoService.listarCursos(requestParams,resultsPerPage);
		// Ahora aplico filtros, o algo???
		Stream<ListadoCursosItem> cur=c.getData().stream().map(curso->new ListadoCursosItem(curso));
		List<ListadoCursosItem> cursos=cur.collect(Collectors.toList());
		ListadoPaginado<ListadoCursosItem> l=new ListadoPaginado<ListadoCursosItem>();
		l.setRegistros_por_pagina(c.getRegistros_por_pagina());
		l.setTotal_registros(c.getTotal_registros());
		l.setCurrent_page(c.getCurrent_page());
		l.setData(cursos);
		return l;
	}
	private ModelAndView cargarFormCurso(Curso curso)
	{
		ModelAndView modelo=new ModelAndView("curso_add");
		modelo.addObject("controller","Cursos");
		modelo.addObject("curso",curso);
		// Leo la lista de modalidades.
		// Tengo que guardar en una variable de sesion la lista de modalidades
		// disponibles para manejarla por separado del curso.
		List<ModalidadDisponible> l=new LinkedList<ModalidadDisponible>();
		if(curso.getModalidades_disponibles()!=null)
			l=curso.getModalidades_disponibles();
		modelo.addObject("modalidadesdisponibles",l);
		modelo.addObject("modalidadespago",cursoService.listarModalidadesPago());
		modelo.addObject("monedas",cursoService.listarMonedas());
		modelo.addObject("idiomas",cursoService.listarIdiomasEstudiar());
		modelo.addObject("niveles",cursoService.listarNiveles());
		modelo.addObject("sucursales",cursoService.listarSucursales());
		modelo.addObject("tiposcurso",tipoCursoService.listarTiposCurso());
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_AGREGAR')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormCurso(new Curso());
		return modelo;
	}
	@Descripcion(value="Agregar curso",permission="ROLE_CURSOS_AGREGAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_AGREGAR')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addCurso(@Valid @ModelAttribute("curso")
	Curso curso,
	BindingResult result,ModelMap model,RedirectAttributes redirectAttributes)
	{
		// Las modalidades venian separadas, tengo que ir e incorporarlas
		// al curso que me acabo de traer.
		//curso.setModalidades_disponibles(listaModalidades);
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormCurso(curso);
			return modelo;
		}
		else
		{
			cursoService.addCurso(curso);
			redirectAttributes.addFlashAttribute("message","Curso agregado exitosamente");
			return new ModelAndView("redirect:/cursos/index");
		}
	}
	@Descripcion(value="Mostrar cursos vigentes",permission="ROLE_CURSOS_LISTAR_VIGENTES")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_LISTAR_VIGENTES')")
	@RequestMapping(value="/listar_cursos_vigentes",method=RequestMethod.GET)
	public ModelAndView listarCursosVigentes()
	{
		ModelAndView modelo=new ModelAndView("curso_listar_cursos_vigentes");
		modelo.addObject("cursos",cursoService.listarCursosVigentes());
		return modelo;
	}
	@Descripcion(value="Mostrar cursos sin clases",permission="ROLE_CURSOS_LISTAR_SIN_CLASES")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_LISTAR_SIN_CLASES')")
	@RequestMapping(value="/listar_cursos_sin_clases",method=RequestMethod.GET)
	public ModelAndView listarCursosSinClases()
	{
		ModelAndView modelo=new ModelAndView("curso_listar_cursos_sin_clases");
		modelo.addObject("cursos",cursoService.listarCursosSinClases());
		return modelo;
	}
	/**
	 * Agrega una modalidad en el formulario de agregar cursos. Forma
	 * parte del ciclo de agregar curso.
	 * @param modalidad_id_agregar
	 * @param curso
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_AGREGAR')")
	@RequestMapping(value="/agregar_modalidad")
	public @ResponseBody List<ModalidadDisponible> AgregarModalidad(
			@RequestParam(value="modalidad_id_agregar",required=true) Integer modalidad_id_agregar,
			//ModelAttribute("modalidadesdisponibles") LinkedList<ModalidadDisponible> lista,
			@ModelAttribute("curso") Curso curso)
	{
		// Creo una modalidad disponible para agregar!!!
		if(curso.getModalidades_disponibles()==null)
			curso.setModalidades_disponibles(new LinkedList<ModalidadDisponible>());
		curso.getModalidades_disponibles().add(modalidadCursoService.agregarModalidadDisponible(curso, modalidad_id_agregar));
		return curso.getModalidades_disponibles();
	}
	/**
	 * Lista las modalidades que tiene un curso, forma parte de los procesos
	 * de agregar y ver cursos.
	 * @param curso
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_AGREGAR')")
	@RequestMapping(value="/listar_modalidades")
	public @ResponseBody List<ModalidadDisponible> ListarModalidades(
			@RequestBody
			@ModelAttribute Curso curso
			)
	{
		return curso.getModalidades_disponibles();
	}
	@Descripcion(value="Asignar profesor",permission="ROLE_CURSOS_ASIGNAR_PROFESOR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	@RequestMapping(value="/asignar_profesor/{cursoId}",method=RequestMethod.GET)
	public ModelAndView mostrarFormAsignarProfesor(@PathVariable("cursoId") Integer cursoId)
	{
		Curso curso=cursoService.getById(cursoId);
		return cargarFormAsignacionProfesor(curso);
	}
	private ModelAndView cargarFormAsignacionProfesor(Curso curso)
	{
		ModelAndView model=new ModelAndView("curso_asignar_profesor");
		// Tengo el id del curso que necesito en una variable. Uso eso para
		// buscar los datos del curso.
		model.addObject("curso",curso);
		model.addObject("horario_curso",new HorarioCurso());
		model.addObject("sucursales",cursoService.listarSucursales());
		model.addObject("profesores",this.profesorService.listarProfesores());
		model.addObject("monedas",monedaService.listarMonedas());
		// Si el curso tiene clases, hay que buscar las clases para que 
		// aparezcan en pantalla, pero por ahora no vamos a hacer eso.
		return model;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	@RequestMapping(value="/asignar_profesor/{cursoId}",method=RequestMethod.POST)
	public ModelAndView asignarProfesor(@PathVariable("cursoId") Integer cursoId,
			@Valid @ModelAttribute("curso") Curso curso, BindingResult result,ModelMap model)
	{
		ModelAndView pantallaRetorno=new ModelAndView("redirect:/cursos/index");
		if(!result.hasErrors())
		{
			try
			{
				cursoService.asignarNuevoProfesor(curso);
				// Si la asignacion tiene exito, ir a la pantalla de lista de cursos.
				model.addAttribute("message","Profesor asignado exitosamente");
			}
			catch(ExceptionErrorAsignacionProfesor e)
			{
				model.addAttribute("message","Hay errores al asignar profesor");
				// Si ocurrio un error, hay que volver a empezar.
				log.fatal("Error al asignar profesor!!!"+e.getMessage());
				pantallaRetorno=this.cargarFormAsignacionProfesor(curso);
			}
		}
		else
		{
			model.addAttribute("message","Hay errores al asignar profesor");
			// Si ocurrio un error, hay que volver a empezar.
			log.fatal("Error al asignar profesor!!!");
			pantallaRetorno=this.cargarFormAsignacionProfesor(curso);
		}
		return pantallaRetorno;
	}
	@RequestMapping(value="/listar_clases_curso/{cursoId}",method=RequestMethod.GET)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	public @ResponseBody List<CalendarEntry> ListarClasesAsignarCurso(@PathVariable("cursoId") Integer cursoId,
			@ModelAttribute Curso curso)
	{
		// Listo las clases guardadas en la variable de sesion!!!!
		// Aca recibo el id del curso, podria no necesariamente ser el del curso
		// guardado... habria que pensar si hay que validar eso o no.
		List<HorarioCurso> lista=curso.getHorario();
		List<CalendarEntry> eventos=new LinkedList<CalendarEntry>();
		for(HorarioCurso h:lista)
		{
			CalendarEntry c=new CalendarEntry(h);
			eventos.add(c);
		}
		return eventos;
	}
	@RequestMapping(value="/agregar_clase_cronograma/{cursoId}",method=RequestMethod.POST)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	@ResponseStatus(value = HttpStatus.OK)
	public @ResponseBody String AgregarClaseCronograma(@PathVariable("cursoId") Integer cursoId,
			@Valid @ModelAttribute("horario_curso") HorarioCurso horario_curso,
			BindingResult result, ModelMap model,
			@ModelAttribute Curso curso)
	{
		String status="";
		// Aqui viene el agregar el horario al curso.
		if(!result.hasErrors())
		{
			// Si no hay ningun error, le tengo que asignar un id temporal,
			// hasta que este horario este guardado en la base de datos.
			horario_curso.setCalendar_id(UUID.randomUUID().toString());
			curso.getHorario().add(horario_curso);
			status="OK";
		}
		else
		{
			// Aca hay que adjuntar ademas el error de validacion
			// para que se sepa lo que salio mal.
			status="Error al agregar el horario de cursada. ";
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				String error=i.next().toString();
				log.trace("Error: "+error);
				status+=error;
			}
		}
		return status;
	}
	@RequestMapping(value="/editar_clase_cronograma/{cursoId}",method=RequestMethod.POST)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	@ResponseStatus(value=HttpStatus.OK)
	public void EditarClase(@PathVariable("cursoId") Integer cursoId,
			@Valid @ModelAttribute("horario_curso") HorarioCurso horario_curso,
			BindingResult result,ModelMap model,
			@ModelAttribute("curso") Curso curso)
	{
		// Aqui viene el editar una clase.
		if(!result.hasErrors())
		{
			// Si tengo el id en la lista de horarios para el curso, ir y editarlo.
			String calendar_id=horario_curso.getCalendar_id();
			List <HorarioCurso> horarios=curso.getHorario();
			for(HorarioCurso h:horarios)
			{
				if(h.getCalendar_id().equals(calendar_id))
				{
					// Editarlo.
					h.setDia_semana(horario_curso.getDia_semana());
					h.setHora_inicio(horario_curso.getHora_inicio());
					h.setHora_fin(horario_curso.getHora_fin());
					h.setFecha(horario_curso.getFecha());
				}
			}
		}
	}
	@RequestMapping(value="/borrar_clase_cronograma/{cursoId}",method=RequestMethod.POST)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_CURSOS_ASIGNAR_PROFESOR')")
	@ResponseStatus(value=HttpStatus.OK)
	public void BorrarClase(@PathVariable("cursoId") Integer cursoId,
			@ModelAttribute("horario_curso") HorarioCurso horario_curso,
			BindingResult result,ModelMap model,
			@ModelAttribute("curso") Curso curso)
	{
		if(!result.hasErrors())
		{
			// Solamente necesito el id de calendario a borrar.
			String id_borrar=horario_curso.getCalendar_id();
			List<HorarioCurso> horarios=curso.getHorario();
			Iterator<HorarioCurso> listIterator=horarios.iterator();
			while(listIterator.hasNext())
			{
				HorarioCurso h=listIterator.next();
				if(h.getCalendar_id().equals(id_borrar))
					listIterator.remove();
			}
		}
	}
	@ExceptionHandler(value={NullPointerException.class,
			org.hibernate.HibernateException.class})
	public ModelAndView mensajeError(Exception e)
	{
		ModelAndView model=new ModelAndView("error_mensajeError");
		model.addObject("exceptionType",e.getClass().getName());
		model.addObject("exceptionMessage",e.getMessage());
		StackTraceElement elem[]=e.getStackTrace();
		String stackTrace="";
		for(int i=0;i<elem.length;i++)
			stackTrace+=elem[i].toString()+"\r\n<br/>";
		model.addObject("stackTrace",stackTrace);
		return model;
	}
}
