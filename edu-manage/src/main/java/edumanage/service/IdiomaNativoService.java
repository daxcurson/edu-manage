package edumanage.service;

import java.util.List;

import edumanage.model.IdiomaNativo;

public interface IdiomaNativoService 
{
	public IdiomaNativo getById(long id);
	public List<IdiomaNativo> listarIdiomasNativos();
}
