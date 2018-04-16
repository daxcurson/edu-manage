package edumanage.service.authentication;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import edumanage.excepciones.UsuarioExistenteException;
import edumanage.model.User;

public interface UserService 
{
	public User getById(long id);
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException;
	public void save(User user) throws UsuarioExistenteException;
	public List<User> listUsers();
}
