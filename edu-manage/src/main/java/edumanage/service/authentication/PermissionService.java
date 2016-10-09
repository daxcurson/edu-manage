package edumanage.service.authentication;

import java.util.List;

import edumanage.model.Group;

public interface PermissionService 
{
	public List<Group> listAllGroups();
	public String grantOrRevokePermission(Group g,String permission);
	public Group findGroupById(int id);
}
