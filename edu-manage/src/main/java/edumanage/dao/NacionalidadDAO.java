package edumanage.dao;

import java.util.List;

import edumanage.model.Nacionalidad;

public interface NacionalidadDAO 
{
	public Nacionalidad getById(long id);
	public List<Nacionalidad> listarNacionalidades();
}
