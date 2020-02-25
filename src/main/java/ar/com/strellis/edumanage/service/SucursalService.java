package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.SucursalInexistenteException;
import ar.com.strellis.edumanage.model.Sucursal;

public interface SucursalService 
{
	public Sucursal getById(long id) throws SucursalInexistenteException;
	public List<Sucursal> listarSucursales();
}
