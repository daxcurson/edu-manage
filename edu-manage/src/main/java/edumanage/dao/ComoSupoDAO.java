package edumanage.dao;

import java.util.List;

import edumanage.model.ComoSupo;

public interface ComoSupoDAO 
{
	public ComoSupo getById(long id);
	public List<ComoSupo> listarComoSupo();
}
