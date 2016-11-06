package edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edumanage.dao.UserDAO;
import edumanage.model.User;
import edumanage.service.authentication.UserService;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDAO userDAO;
	@Override
	public User getById(long id) 
	{
		return userDAO.findById(id);
	}
	@Override
	public void save(User user) 
	{
		// Vamos a grabar aqui algunos datos que
		// no se graban de la interfaz
		user.setEnabled(1);
		userDAO.save(user);
	}
}
