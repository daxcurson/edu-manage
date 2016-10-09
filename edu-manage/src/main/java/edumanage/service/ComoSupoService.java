package edumanage.service;

import java.util.List;

import edumanage.model.ComoSupo;

public interface ComoSupoService 
{
	public ComoSupo getById(long id);
	public List<ComoSupo> listarComoSupo();
}
