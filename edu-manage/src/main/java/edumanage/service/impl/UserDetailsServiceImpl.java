package edumanage.service.impl;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.UserDAO;
import edumanage.excepciones.UsuarioExistenteException;
import edumanage.model.User;
import edumanage.service.authentication.UserService;

public class UserDetailsServiceImpl implements UserDetailsService,UserService {
	static Logger log = Logger.getLogger(UserDetailsServiceImpl.class);
    private UserDAO userRepository;

    //required by cglib because I use class based aspect weaving
    protected UserDetailsServiceImpl() {
    }

    public UserDetailsServiceImpl(UserDAO userRepository) {
    	log.trace("Estoy en UserDetailsServieImpl.constructor");
        this.userRepository = userRepository;
    }

    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
    	log.trace("Estoy en AuthenticationUserDetailsGetter.loadUserByUsername");
        User user = userRepository.findByLogin(username);
        throwExceptionIfNotFound(user, username);
        return new AuthenticationUserDetails(user);
    }

    private void throwExceptionIfNotFound(User user, String username) {
    	log.trace("Estoy en throwExceptionIfNotFound");
    	if (user == null) {
    		throw new UsernameNotFoundException("User with login " + username + "  has not been found.");
    	}
    }

	public User getById(long id) 
	{
		return userRepository.findById(id);
	}
	public void save(User user) throws UsuarioExistenteException
	{
		// Vamos a grabar aqui algunos datos que
		// no se graban de la interfaz
		user.setEnabled(1);
		// Hay que encriptar el password antes de grabarlo!!!
        BCryptPasswordEncoder pwe=new BCryptPasswordEncoder();
        user.setPassword(pwe.encode(user.getPassword()));
        user.setConfirm_password(user.getPassword());
        try
        {
        	userRepository.save(user);
        }
        catch(ConstraintViolationException e)
        {
        	// Si se arroja esta excepcion, es porque el usuario ya existe.
        	// Convertirla en la excepcion UsuarioExistente
        	throw new UsuarioExistenteException();
        }
	}

	@Override
	public List<User> listUsers() 
	{
		return userRepository.listUsers();
	}
}