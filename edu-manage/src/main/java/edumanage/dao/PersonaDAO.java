package edumanage.dao;

import java.util.List;

import edumanage.model.Persona;

public interface PersonaDAO 
{
	public List<Persona> listPersona();
	public void removePersona(Integer id);
	public Persona getById(long id);
	public void save(Persona persona);
}
