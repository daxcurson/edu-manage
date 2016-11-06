package edumanage.service.authentication;

import edumanage.model.Group;

public interface GroupService 
{
	public Group getById(long id);
	public void save(Group group);
}
