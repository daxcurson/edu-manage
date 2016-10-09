package edumanage.dao;

import java.util.*;

import edumanage.model.*;

public interface IdiomaEstudiarDAO
{
	public List<IdiomaEstudiar> listarIdiomasEstudiar();
	public IdiomaEstudiar getById(long id);
}
