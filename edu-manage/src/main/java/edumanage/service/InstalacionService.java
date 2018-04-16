package edumanage.service;

import edumanage.excepciones.GrupoExistenteException;
import edumanage.excepciones.UsuarioExistenteException;
import edumanage.model.User;

public interface InstalacionService 
{
	public void grabarUsuarioAdministrador(User user) throws GrupoExistenteException, UsuarioExistenteException;
}
