package edumanage.dao;

import java.util.*;

import edumanage.model.*;

public interface NivelDAO 
{
	public List<Nivel> listarNiveles();
	public Nivel getById(long id);
}
