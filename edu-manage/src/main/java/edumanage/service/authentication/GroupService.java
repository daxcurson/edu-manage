package edumanage.service.authentication;

import java.util.List;

import edumanage.excepciones.GrupoExistenteException;
import edumanage.model.Group;

public interface GroupService 
{
	public Group getById(long id);
	public void save(Group group) throws GrupoExistenteException;
	public List<Group> listGroups();
}
