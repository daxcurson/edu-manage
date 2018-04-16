package edumanage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edumanage.documentation.Descripcion;
import edumanage.documentation.DescripcionClase;

@Controller
@RequestMapping("users")
@SessionAttributes({"user"})
@DescripcionClase(value="Usuarios")
public class UsersController extends AppController
{
	private static Logger log=LogManager.getLogger(UsersController.class);
	@RequestMapping("/login")
	public ModelAndView login(Model model) 
	{
		ModelAndView modelo=new ModelAndView("login");
		return modelo;
	}
	@RequestMapping("/logindenied")
	public ModelAndView loginDenied(Model model)
	{
		ModelAndView modelo=new ModelAndView("login_denied");
		return modelo;
	}
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_USERS_ADMINISTRAR')")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Listar usuarios a administrar",permission="ROLE_USERS_ADMINISTRAR")
	public ModelAndView administrarUsuarios()
	{
		ModelAndView modelo=new ModelAndView("users_listar");
		return modelo;
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
		{
			log.trace("Realizando accion de Logout");
			new SecurityContextLogoutHandler().logout(request, response, auth);
			log.trace("Acciones realizadas, nos vemos pronto!");
		}
		else
			log.trace("Autenticacion nula, no hago nada");
		return "redirect:/users/login";
	}
}
