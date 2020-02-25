package ar.com.strellis.edumanage.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.strellis.edumanage.documentation.Descripcion;
import ar.com.strellis.edumanage.documentation.DescripcionClase;

@DescripcionClase(value="Menu")
@Controller
public class MenuController extends AppController
{
	@Descripcion(value="Mostrar menu principal",permission="ROLE_MENU_MOSTRAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MENU_MOSTRAR')")
	@RequestMapping({"/menu","/"})
	public ModelAndView menu(Model model)
	{
		ModelAndView modelo=new ModelAndView("menu");
		return modelo;
	}

}
