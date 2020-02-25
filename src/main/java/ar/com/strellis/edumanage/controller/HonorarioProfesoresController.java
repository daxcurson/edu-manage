package ar.com.strellis.edumanage.controller;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ar.com.strellis.edumanage.documentation.Descripcion;
import ar.com.strellis.edumanage.documentation.DescripcionClase;
import ar.com.strellis.edumanage.exceptions.HonorarioProfesorInexistente;
import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.exceptions.ProfesorInexistenteException;
import ar.com.strellis.edumanage.model.HonorarioProfesor;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.model.Moneda;
import ar.com.strellis.edumanage.model.propertyeditor.IdiomaEstudiarEditor;
import ar.com.strellis.edumanage.model.propertyeditor.MonedaEditor;
import ar.com.strellis.edumanage.service.*;

@Controller
@RequestMapping("honorarios")
@DescripcionClase("Honorarios de profesores")
public class HonorarioProfesoresController 
{
	static Logger log = LogManager.getLogger(HonorarioProfesoresController.class);
	
	@Autowired
	private HonorarioProfesorService honorarioProfesorService;
	@Autowired
	private MonedaService monedaService;
	@Autowired
	private IdiomaEstudiarService idiomaEstudiarService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		binder.registerCustomEditor(Moneda.class, new MonedaEditor(monedaService));
		binder.registerCustomEditor(IdiomaEstudiar.class, new IdiomaEstudiarEditor(idiomaEstudiarService));
	}	
	@Descripcion(value="Pantalla principal de honorarios",permission="ROLE_HONORARIOS_INDICE")
	@RequestMapping(value={"/","/index"})
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_INDICE')")
	public ModelAndView indiceHonorarios()
	{
		ModelAndView lista=new ModelAndView("honorario_profesor_index");
		lista.addObject("honorarios",honorarioProfesorService.listarHonorarios());
		return lista;
	}
	private ModelAndView cargarFormHonorario(HonorarioProfesor honorario)
	{
		ModelAndView modelo=new ModelAndView("honorario_profesor_agregar");
		modelo.addObject("honorario",honorario);
		// Leo la lista de modalidades.
		modelo.addObject("monedas",monedaService.listarMonedas());
		modelo.addObject("idiomas",idiomaEstudiarService.listarIdiomasEstudiar());
		return modelo;
	}
	@Descripcion(value="Agregar honorario",permission="ROLE_HONORARIOS_AGREGAR")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_AGREGAR')")
	public ModelAndView mostrarFormAgregarHonorario()
	{
		return cargarFormHonorario(new HonorarioProfesor());
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_AGREGAR')")
	public ModelAndView agregarHonorario(@Valid @ModelAttribute("honorario")
	HonorarioProfesor honorario, BindingResult result,ModelMap model,RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			String mensajes="";
			while(i.hasNext())
			{
				String mensaje=i.next().toString();
				log.trace("Error: "+mensaje);
				mensajes+=mensaje;
			}
			model.addAttribute(mensajes);
			ModelAndView modelo=this.cargarFormHonorario(honorario);
			return modelo;
		}
		else
		{
			honorarioProfesorService.agregarHonorario(honorario);
			model.addAttribute("message","Honorario agregado exitosamente");
			redirectAttributes.addFlashAttribute("message","Honorario agregado exitosamente");
			return new ModelAndView("redirect:/honorarios/index");
		}
	}
	@Descripcion(value="Editar Honorario",permission="ROLE_HONORARIOS_EDITAR")
	@RequestMapping(value="/edit")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_EDITAR')")
	public ModelAndView editarHonorario()
	{
		return new ModelAndView("honorario_profesor_editar");
	}
	@Descripcion(value="Borrar honorario",permission="ROLE_HONORARIOS_BORRAR")
	@RequestMapping(value="/delete")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_BORRAR')")
	public ModelAndView borrarHonorario()
	{
		return new ModelAndView("honorario_profesor_borrar");
	}
	@Descripcion(value="Mostrar datos de un honorario",permission="ROLE_HONORARIOS_MOSTRAR_DATO")
	@RequestMapping(value="/buscar_dato_honorario/{honorarioId}")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_MOSTRAR_DATO')")
	public @ResponseBody HonorarioProfesor buscarDatoHonorario(@PathVariable("honorarioId") long honorarioId)
	{
		try {
			return honorarioProfesorService.getById(honorarioId);
		} catch (HonorarioProfesorInexistente e) {
			e.printStackTrace();
		}
		return null;
	}
	@Descripcion(value="Mostrar honorarios asignados a un profesor",permission="ROLE_HONORARIOS_BUSCAR_HONORARIOS_ASIGNADOS")
	@RequestMapping(value="/buscar_honorarios_asignados/{profesorId}")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_BUSCAR_HONORARIOS_ASIGNADOS')")
	public @ResponseBody List<HonorarioProfesor> buscarHonorariosAsignados(@PathVariable("profesorId") long profesorId)
	{
		try {
			return honorarioProfesorService.buscarHonorariosAsignados(profesorId);
		} catch (ProfesorInexistenteException e) {
			e.printStackTrace();
		}
		return new LinkedList<HonorarioProfesor>();
	}
	@Descripcion(value="Buscar honorarios correspondientes a un idioma",permission="ROLE_HONORARIOS_BUSCAR_HONORARIOS_IDIOMA")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_HONORARIOS_BUSCAR_HONORARIOS_IDIOMA')")
	@RequestMapping(value="/buscar_honorarios_idioma/{idiomaEstudiarId}")
	public @ResponseBody List<HonorarioProfesor> buscarHonorariosIdioma(@PathVariable("idiomaEstudiarId") long idiomaEstudiarId)
	{
		try {
			return honorarioProfesorService.buscarHonorariosIdioma(idiomaEstudiarId);
		} catch (IdiomaEstudiarInexistente e) {
			e.printStackTrace();
		}
		return new LinkedList<HonorarioProfesor>();
	}
}
