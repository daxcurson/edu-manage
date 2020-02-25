package ar.com.strellis.edumanage.controller;

import java.util.Iterator;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.com.strellis.edumanage.exceptions.GrupoExistenteException;
import ar.com.strellis.edumanage.exceptions.UsuarioExistenteException;
import ar.com.strellis.edumanage.model.User;
import ar.com.strellis.edumanage.service.InstalacionService;

@Controller
@RequestMapping("/instalacion")
public class InstalacionController extends AppController
{
	private static Logger log=LogManager.getLogger(InstalacionController.class);
	
	@Autowired
	private InstalacionService instalacionService;

	@GetMapping({"","/index"})
	public ModelAndView MostrarMenu()
	{
		return new ModelAndView("instalacion_index");
	}
	private ModelAndView cargarFormUsuario(User user)
	{
		ModelAndView modelo=new ModelAndView("instalacion_user_add");
		modelo.addObject(user);
		// Esta pantalla es "seleccione el nombre del usuario administrador",
		// por lo cual vamos a asumir que ese es el grupo del usuario.
		return modelo;
	}
	@RequestMapping(value="/user_add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormUsuario(new User());
		return modelo;
	}
	@RequestMapping(value = "/user_add", method = RequestMethod.POST)
	public ModelAndView addCurso(@ModelAttribute("user")
	User user, BindingResult result,ModelMap model)
	{
		if(!user.getPassword().equals(user.getConfirm_password()))
			result.addError(new ObjectError("user", "Los passwords no coinciden"));
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormUsuario(user);
			return modelo;
		}
		else
		{
			// El servicio de instalacion ya tiene el metodo necesario
			// para realizar esto.
			// Como se puede tirar una excepcion, vamos a asegurarnos que
			// este metodo devuelva algo creando ahora el objeto de respuesta.
			ModelAndView modelo=new ModelAndView("redirect:/instalacion/index");
			try
			{
				instalacionService.grabarUsuarioAdministrador(user);
				model.addAttribute("message","Usuario grabado exitosamente");
			}
			catch(GrupoExistenteException e)
			{
				modelo=this.cargarFormUsuario(user);
				model.addAttribute("message","El grupo admin ya existe, imposible agregar otro");
			}
			catch(UsuarioExistenteException e)
			{
				// Si ya existe en usuario, ir a decirlo.
				modelo=this.cargarFormUsuario(user);
				model.addAttribute("message", "El usuario admin ya existe, imposible agregar otro");
			}
			finally
			{
			}
			return modelo;
		}
	}
}
