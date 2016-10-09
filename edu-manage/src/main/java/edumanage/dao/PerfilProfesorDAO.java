package edumanage.dao;

import java.util.List;

import edumanage.model.PerfilProfesor;

public interface PerfilProfesorDAO 
{
	public List<PerfilProfesor> listarPerfiles();
	public PerfilProfesor getById(long id);
}
