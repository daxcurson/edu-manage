package ar.com.strellis.edumanage.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.UserDAO;
import ar.com.strellis.edumanage.model.User;

public class AuthenticationUserDetailsGetter implements UserDetailsService {
	static Logger log = LogManager.getLogger(AuthenticationUserDetailsGetter.class);
	@Autowired
    private UserDAO userRepository;

	@SuppressWarnings("unused")
	private AuthenticationUserDetailsGetter()
	{
		
	}
    public AuthenticationUserDetailsGetter(UserDAO userDAO) {
    	userRepository=userDAO;
    }

    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
    	log.trace("Estoy en AuthenticationUserDetailsGetter.loadUserByUsername, username pedido:"+username);
    	if(userRepository!=null)
    		log.trace("Hay un userRepository: "+userRepository);
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
}