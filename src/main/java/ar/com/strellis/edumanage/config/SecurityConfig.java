package ar.com.strellis.edumanage.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

import ar.com.strellis.edumanage.dao.UserDAO;
import ar.com.strellis.edumanage.service.impl.AuthenticationUserDetailsGetter;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserDAO userDAO;
	private static final String[] PUBLIC_MATCHERS = 
		{ 
				"/css/**", 
				"/js/**", 
				"/img/**"
		};

	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		http.authorizeRequests()
			.antMatchers(PUBLIC_MATCHERS).permitAll()
			.antMatchers("/instalacion/**").permitAll()
			.antMatchers("/**").hasRole("USER")
			.anyRequest().hasRole("USER")
			.and().sessionManagement().sessionFixation().migrateSession()
			.and()
			.formLogin().loginPage("/users/login")
			.loginProcessingUrl("/j_spring_security_check").defaultSuccessUrl("/")
			.permitAll()
			.failureUrl("/users/logindenied")
			.and()
			.logout().logoutUrl("/users/logout");
	}
	@Override
	protected void configure(AuthenticationManagerBuilder auth)
	{
		DaoAuthenticationProvider authProvider=new DaoAuthenticationProvider();
		UserDetailsService userDetailsService=new AuthenticationUserDetailsGetter(userDAO);
		authProvider.setUserDetailsService(userDetailsService);
		authProvider.setPasswordEncoder(new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder());
		auth.authenticationProvider(authProvider);
	}
}
