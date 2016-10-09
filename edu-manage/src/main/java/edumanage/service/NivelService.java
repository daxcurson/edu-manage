package edumanage.service;

import java.util.List;

import edumanage.model.Nivel;

public interface NivelService 
{
	public Nivel getById(long id);
	public List<Nivel> listarNiveles();
}
