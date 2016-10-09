package edumanage.dao;

import java.util.List;

import edumanage.model.DuracionModo;

public interface DuracionModoDAO 
{
	public DuracionModo getById(long id);
	public List<DuracionModo> listarDuraciones();
}
