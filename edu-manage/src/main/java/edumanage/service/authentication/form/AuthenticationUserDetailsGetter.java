package edumanage.service.authentication.form;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import edumanage.model.*;
import edumanage.security.UserRepository;

public class AuthenticationUserDetailsGetter implements UserDetailsService {
	static Logger log = Logger.getLogger(AuthenticationUserDetailsGetter.class);
    private UserRepository userRepository;

    //required by cglib because I use class based aspect weaving
    protected AuthenticationUserDetailsGetter() {
    }

    public AuthenticationUserDetailsGetter(UserRepository userRepository) {
    	log.trace("Estoy en AuthenticationUserDetailsGetter.constructor");
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
}