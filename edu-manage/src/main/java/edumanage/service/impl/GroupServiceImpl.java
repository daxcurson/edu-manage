package edumanage.service.impl;

import java.util.List;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edumanage.dao.GroupDAO;
import edumanage.excepciones.GrupoExistenteException;
import edumanage.model.Group;
import edumanage.service.authentication.GroupService;

@Service
public class GroupServiceImpl implements GroupService
{
	@Autowired
	private GroupDAO groupDAO;
	@Override
	public Group getById(long id) 
	{
		return groupDAO.findGroupById(id);
	}
	@Override
	public void save(Group group) throws GrupoExistenteException
	{
        try
        {
        	groupDAO.save(group);
        }
        catch(ConstraintViolationException e)
        {
        	// Si se arroja esta excepcion, es porque el usuario ya existe.
        	// Convertirla en la excepcion UsuarioExistente
        	throw new GrupoExistenteException();
        }
	}
	@Override
	public List<Group> listGroups() 
	{
		return groupDAO.listAllGroups();
	}
}
