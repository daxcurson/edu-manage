package ar.com.strellis.edumanage.service.authentication;


import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface UserDetailsService extends org.springframework.security.core.userdetails.UserDetailsService
{
    org.springframework.security.core.userdetails.UserDetails loadUserByUsername(String username)
        throws UsernameNotFoundException, DataAccessException;
}