package edumanage.service;

import java.util.List;

import edumanage.model.Moneda;

public interface MonedaService 
{
	public Moneda getById(long id);
	public List<Moneda> listarMonedas();
}
