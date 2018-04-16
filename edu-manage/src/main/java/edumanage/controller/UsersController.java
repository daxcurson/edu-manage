package edumanage.controller;

import org.springframework.security.access.prepost.PreAuthorize;
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
}
