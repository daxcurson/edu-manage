package ar.com.strellis.edumanage.controller;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ar.com.strellis.edumanage.documentation.*;
import ar.com.strellis.edumanage.model.*;
import ar.com.strellis.edumanage.model.propertyeditor.*;
import ar.com.strellis.edumanage.service.*;

@Controller
@RequestMapping("profesores")
@SessionAttributes({"profesor"})
@DescripcionClase(value="Profesores")
public class ProfesoresController extends AppController
{
	static Logger log = LogManager.getLogger(ProfesoresController.class);
	@Autowired
	private ProfesorService profesorService;
	@Autowired
	private SucursalService sucursalService;
	@Autowired
	private MonedaService monedaService;
	@Autowired
	private NivelService nivelService;
	@Autowired
	private IdiomaEstudiarService idiomaEstudiarService;
	@Autowired
	private HonorarioProfesorService honorarioProfesorService;
	@Autowired
	private IdiomaNativoService idiomaNativoService;
	@Autowired
	private NacionalidadService nacionalidadService;
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
		binder.registerCustomEditor(Profesor.class, new ProfesorEditor(profesorService));
		binder.registerCustomEditor(HonorarioProfesor.class, new HonorarioProfesorEditor(honorarioProfesorService));
		binder.registerCustomEditor(PerfilProfesor.class, new PerfilProfesorEditor(profesorService));
		binder.registerCustomEditor(Nacionalidad.class,new NacionalidadEditor(nacionalidadService));
		binder.registerCustomEditor(IdiomaNativo.class, new IdiomaNativoEditor(idiomaNativoService));
    }
	@Descripcion(value="Pantalla principal de profesores",permission="ROLE_PROFESORES_SERVICE")
	@RequestMapping(value={"/","/index"})
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_SERVICE')")
	public ModelAndView indiceProfesores()
	{
		ModelAndView indice=new ModelAndView("profesor_index");
		indice.addObject("profesor",new Profesor());
		// Lista de profesores
		return indice;
	}
	@Descripcion(value="Listar profesores a administrar",permission="ROLE_PROFESORES_ADMINISTRAR")
	@RequestMapping(value="/administrar")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_ADMINISTRAR')")
	public ModelAndView administrarProfesores(
			@RequestParam(value="pagina",required=false,defaultValue="1") int pagina,
			HttpServletRequest request
	)
	{
		ModelAndView lista=new ModelAndView("profesor_administrar");
		
		int tamanoPagina=20;
		
		int current = pagina;
		int begin = Math.max(1, current - 10);
		long totalPageCount=profesorService.cantidadProfesores()/tamanoPagina;
		long end = Math.min(totalPageCount,current+10);

		Page<Profesor> listaProfesores=profesorService.listarProfesoresPorPagina(pagina, tamanoPagina);
		lista.addObject("beginIndex", begin);
		lista.addObject("endIndex", end);
		lista.addObject("currentIndex", current);
		lista.addObject("totalPageCount", totalPageCount);
		lista.addObject("listaProfesores",listaProfesores);
		return lista;
	}
	private ModelAndView cargarFormProfesor(Profesor profesor)
	{
		ModelAndView modelo=new ModelAndView("profesor_agregar");
		modelo.addObject("profesor",profesor);
		modelo.addObject("idiomas",idiomaEstudiarService.listarIdiomasEstudiar());
		modelo.addObject("idiomas_nativos",idiomaNativoService.listarIdiomasNativos());
		modelo.addObject("nacionalidades",nacionalidadService.listarNacionalidades());
		modelo.addObject("perfiles",profesorService.listarPerfilProfesores());
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_AGREGAR')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormProfesor(new Profesor());
		return modelo;
	}
	@Descripcion(value="Agregar profesor",permission="ROLE_PROFESORES_AGREGAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_AGREGAR')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addProfesor(@Valid @ModelAttribute("profesor")
	Profesor profesor, BindingResult result,ModelMap model)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormProfesor(profesor);
			return modelo;
		}
		else
		{
			profesorService.agregarProfesor(profesor);
			model.addAttribute("message","Profesor agregado exitosamente");
			return new ModelAndView("redirect:/profesores/index");
		}
	}
	@Descripcion(value="Mostrar calendario de profesores",permission="ROLE_PROFESORES_MOSTRAR_CALENDARIO")
	@RequestMapping(value="/mostrar_calendario")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_MOSTRAR_CALENDARIO')")
	public ModelAndView mostrarCalendario()
	{
		return new ModelAndView("profesor_mostrar_calendario");
	}
	@Descripcion(value="Mostrar informe de sueldo de profesores",permission="ROLE_PROFESORES_INFORME_SUELDOS")
	@RequestMapping(value="/informe_sueldos")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_INFORME_SUELDOS')")
	public ModelAndView informeSueldos()
	{
		return new ModelAndView("profesor_informe_sueldos");
	}
	@Descripcion(value="Listar profesores activos con clases recientes",permission="ROLE_PROFESORES_LISTAR_ACTIVOS")
	@RequestMapping(value="/listar_profesores_activos")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PROFESORES_LISTAR_ACTIVOS')")
	public ModelAndView listarProfesoresActivos()
	{
		return new ModelAndView("profesor_listar_profesores_activos");
	}
}
