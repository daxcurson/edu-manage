package ar.com.strellis.edumanage.service.authentication;

import java.util.List;
import java.util.Optional;

import ar.com.strellis.edumanage.exceptions.GrupoExistenteException;
import ar.com.strellis.edumanage.model.Group;

public interface GroupService 
{
	public Optional<Group> getById(long id);
	public void save(Group group) throws GrupoExistenteException;
	public List<Group> listGroups();
}
