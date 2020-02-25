package ar.com.strellis.edumanage.service.authentication;

import java.util.List;
import java.util.Optional;

import ar.com.strellis.edumanage.model.Group;

public interface PermissionService 
{
	public List<Group> listAllGroups();
	public String grantOrRevokePermission(Group g,String permission);
	public Optional<Group> findGroupById(long id);
}
