package edumanage.dao;

import java.util.*;

import edumanage.model.*;

public interface SucursalDAO 
{
	public Sucursal getById(long id);
	public List<Sucursal> listarSucursales();
}
