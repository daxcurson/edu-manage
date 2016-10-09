package edumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController extends AppController
{
	@RequestMapping("/users/login")
	public ModelAndView login(Model model) 
	{
		ModelAndView modelo=new ModelAndView("login");
		return modelo;
	}
	@RequestMapping("/users/logindenied")
	public ModelAndView loginDenied(Model model)
	{
		ModelAndView modelo=new ModelAndView("login_denied");
		return modelo;
	}
}
