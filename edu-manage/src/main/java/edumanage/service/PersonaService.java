package edumanage.service;

import java.util.List;

import edumanage.model.Persona;

public interface PersonaService {
	public Persona getById(long id);
	public List<Persona> listPersona();
	public void removePersona(Integer id);
	public void save(Persona persona);
}
