package edumanage.dao;

import java.util.*;

import edumanage.model.*;

public interface OrientacionDAO 
{
	public List<Orientacion> listarOrientaciones();
	public Orientacion getById(long id);
}
