package edumanage.service;

import java.util.List;

import edumanage.model.Nacionalidad;

public interface NacionalidadService 
{
	public Nacionalidad getById(long id);
	public List<Nacionalidad> listarNacionalidades();
}
