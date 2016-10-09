package edumanage.service;

import java.util.List;

import edumanage.model.IdiomaEstudiar;

public interface IdiomaEstudiarService 
{
	public IdiomaEstudiar getById(long id);
	public List<IdiomaEstudiar> listarIdiomasEstudiar();
}
