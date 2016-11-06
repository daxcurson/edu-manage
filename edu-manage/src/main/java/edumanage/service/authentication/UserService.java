package edumanage.service.authentication;

import edumanage.model.User;

public interface UserService 
{
	public User getById(long id);
	public void save(User user);
}
