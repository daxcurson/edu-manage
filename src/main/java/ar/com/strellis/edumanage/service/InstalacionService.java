package ar.com.strellis.edumanage.service;

import ar.com.strellis.edumanage.exceptions.GrupoExistenteException;
import ar.com.strellis.edumanage.exceptions.UsuarioExistenteException;
import ar.com.strellis.edumanage.model.User;

public interface InstalacionService 
{
	public void grabarUsuarioAdministrador(User user) throws GrupoExistenteException, UsuarioExistenteException;
}
