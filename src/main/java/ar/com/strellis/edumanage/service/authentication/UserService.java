package ar.com.strellis.edumanage.service.authentication;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ar.com.strellis.edumanage.exceptions.UsuarioExistenteException;
import ar.com.strellis.edumanage.model.User;

public interface UserService 
{
	public Optional<User> getById(long id);
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException;
	public void save(User user) throws UsuarioExistenteException;
	public List<User> listUsers();
}
