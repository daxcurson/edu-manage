package edumanage.controller;

import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edumanage.service.authentication.*;
import edumanage.documentation.Descripcion;
import edumanage.documentation.DescripcionClase;
import edumanage.excepciones.GrupoExistenteException;
import edumanage.model.Group;

@Controller
@RequestMapping("groups")
@SessionAttributes({"group"})
@DescripcionClase(value="Grupos")
public class GroupsController extends AppController
{
	private static Logger log=LogManager.getLogger(GroupsController.class);
	@Autowired
	private GroupService groupService;
	@Autowired
	private PermissionService permissionService;
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_GROUPS_ADMINISTRAR')")
	@RequestMapping({"/","/index"})
	@Descripcion(value="Listar grupos a administrar",permission="ROLE_GROUPS_ADMINISTRAR")
	public ModelAndView mostrarMenu()
	{
		ModelAndView model=new ModelAndView("groups_index");
		model.addObject("groups",groupService.listGroups());
		return model;
	}
	private ModelAndView cargarFormGrupo(Group group)
	{
		ModelAndView modelo=new ModelAndView("groups_add");
		modelo.addObject("group",group);
		return modelo;
	}
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_GROUPS_AGREGAR')")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView mostrarFormAgregar(Model model)
	{
		ModelAndView modelo=this.cargarFormGrupo(new Group());
		return modelo;
	}
	@Descripcion(value="Agregar grupo",permission="ROLE_GROUPS_AGREGAR")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_GROUPS_AGREGAR')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addGroup(@Valid @ModelAttribute("group")
	Group group,
	BindingResult result,ModelMap model, final RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors())
		{
			List<ObjectError> lista_errores=result.getAllErrors();
			Iterator<ObjectError> i=lista_errores.iterator();
			while(i.hasNext())
			{
				log.trace("Error: "+i.next().toString());
			}
			ModelAndView modelo=this.cargarFormGrupo(group);
			return modelo;
		}
		else
		{
			ModelAndView modelo=new ModelAndView("redirect:/groups/index");
			try
			{
				groupService.save(group);
				// Todo grupo tiene que tener el permiso de ROLE_USER.
				permissionService.grantOrRevokePermission(group, "ROLE_USER");
				redirectAttributes.addFlashAttribute("message","Grupo agregado exitosamente");
			}
			catch(GrupoExistenteException e)
			{
				model.addAttribute("message","Ese nombre de grupo ya existe, por favor elija otro");
				modelo=this.cargarFormGrupo(group);
			}
			return modelo;
		}
	}
}
