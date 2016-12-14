package edumanage.service;

import java.util.List;

import edumanage.model.Sucursal;

public interface SucursalService 
{
	public Sucursal getById(long id);
	public List<Sucursal> listarSucursales();
}
