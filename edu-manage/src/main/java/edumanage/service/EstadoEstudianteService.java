package edumanage.service;

import java.util.List;

import edumanage.model.*;

public interface EstadoEstudianteService 
{
	public PersonaEstado getById(long id);
	public List<PersonaEstado> listarEstados();
}
