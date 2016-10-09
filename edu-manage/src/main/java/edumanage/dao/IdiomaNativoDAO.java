package edumanage.dao;

import java.util.List;

import edumanage.model.IdiomaNativo;

public interface IdiomaNativoDAO 
{
	public IdiomaNativo getById(long id);
	public List<IdiomaNativo> listarIdiomasNativos();
}
