package ar.com.strellis.edumanage.service.impl;

import java.util.List;
import java.util.Optional;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.com.strellis.edumanage.dao.GroupDAO;
import ar.com.strellis.edumanage.exceptions.GrupoExistenteException;
import ar.com.strellis.edumanage.model.Group;
import ar.com.strellis.edumanage.service.authentication.GroupService;

@Service
public class GroupServiceImpl implements GroupService
{
	@Autowired
	private GroupDAO groupDAO;
	@Override
	public Optional<Group> getById(long id) 
	{
		return groupDAO.findById(id);
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
		return groupDAO.findAll();
	}
}
