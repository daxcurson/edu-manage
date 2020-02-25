package ar.com.strellis.edumanage.service.impl;

import java.util.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ar.com.strellis.edumanage.model.Group;
import ar.com.strellis.edumanage.model.Permission;
import ar.com.strellis.edumanage.model.PermissionGranted;
import ar.com.strellis.edumanage.model.User;

public class AuthenticationUserDetails implements org.springframework.security.core.userdetails.UserDetails {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
    private final String login;
    private final String passwordHash;
    private final boolean enabled;
    private HashSet<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();
    static Logger log = LogManager.getLogger(AuthenticationUserDetails.class);

    public AuthenticationUserDetails(User user) 
    {
    	log.trace("Estoy en AuthenticationUserDetails (constructor)");
        this.login = user.getUsername();
        this.passwordHash = user.getPassword();
        this.enabled = (user.getEnabled()==1 ? true:false);
        BCryptPasswordEncoder pwe=new BCryptPasswordEncoder();
        String encodedPassword=pwe.encode("bien2encaminados");
        log.trace("El password tiene que ser "+encodedPassword);
        // Convierto los permisos leidos de la base, para el grupo al que pertenece el usuario, en Authorities.
        Group g=user.getGroup();
        for(Permission p:g.getPermissions())
        {
        	PermissionGranted pg=new PermissionGranted(p.getAuthority());
        	log.trace("Obtuve el permiso "+pg.getAuthority());
        	this.grantedAuthorities.add(pg);
        }
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() 
    {
    	log.trace("Estoy en AuthenticationUserDetails.getAuthorities");
        return grantedAuthorities;
    }

    @Override
    public String getPassword() {
    	log.trace("Estoy en AuthenticationUserDetails.getPassword");
        return passwordHash;
    }

    @Override
    public String getUsername() {
    	log.trace("Estoy en AuthenticationUserDetails.getUsername");
        return login;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @Override
    public boolean isAccountNonExpired() {
    	log.trace("Estoy en isAccountNonExpired");
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
    	log.trace("Estoy en isAccountNonLocked");
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
    	log.trace("Estoy en isCredentialsNonExpired");
        return true;
    }

    public String getLogin() {
    	log.trace("Estoy en getLogin");
        return login;
    }

	public Long getId() {
		log.trace("Estoy en getId");
		return id;
	}
}