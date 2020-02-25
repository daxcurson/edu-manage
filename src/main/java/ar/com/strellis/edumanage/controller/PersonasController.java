package ar.com.strellis.edumanage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.strellis.edumanage.documentation.Descripcion;
import ar.com.strellis.edumanage.documentation.DescripcionClase;
import ar.com.strellis.edumanage.service.PersonaService;

@DescripcionClase(value="Personas")
@Controller
@RequestMapping("personas")
public class PersonasController extends AppController
{
	@Autowired
	private PersonaService personaService;

	@Descripcion(value="Mostrar menu",permission="ROLE_PERSONAS_MOSTRAR_MENU")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PERSONAS_MOSTRAR_MENU')")
	@RequestMapping({"/","/index"})
	public ModelAndView mostrarMenu(Model model) 
	{
		ModelAndView modelo=new ModelAndView("persona_index");
		return modelo;
	}
	@Descripcion(value="Borrar persona",permission="ROLE_PERSONAS_BORRAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_PERSONAS_BORRAR')")
	@RequestMapping("/personas/delete/{personaId}")
	public String deletePersona(@PathVariable("personaId") Long personaId) 
	{
		personaService.removePersona(personaId);
		return "redirect:/personas/index";
	}
}
