package edumanage.service;

import java.util.List;

import edumanage.model.DuracionModo;

public interface DuracionModoService 
{
	public DuracionModo getById(long id);
	public List<DuracionModo> listarModos();
}
