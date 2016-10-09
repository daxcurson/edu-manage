package edumanage.service;

import java.util.*;

import edumanage.model.*;

public interface OrientacionService 
{
	public List<Orientacion> listarOrientaciones();
	public Orientacion getById(long parseLong);
}
