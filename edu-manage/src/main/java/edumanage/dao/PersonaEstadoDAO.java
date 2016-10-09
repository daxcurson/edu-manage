package edumanage.dao;

import java.util.List;

import edumanage.model.PersonaEstado;

public interface PersonaEstadoDAO 
{
	public PersonaEstado getById(long id);
	public List<PersonaEstado> listarEstados();
}
