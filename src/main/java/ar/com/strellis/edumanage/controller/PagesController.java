package ar.com.strellis.edumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pages")
/**
 * Administrador de paginas fijas. Estan exentas de la autenticacion y son 
 * efectivamente publicas.
 * @author daxcurson
 *
 */
public class PagesController extends AppController
{
	@RequestMapping("/adios")
	public ModelAndView adios()
	{
		return new ModelAndView("adios");
	}
}
