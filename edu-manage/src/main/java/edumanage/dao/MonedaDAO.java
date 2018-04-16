package edumanage.dao;

import java.util.List;

import edumanage.model.Moneda;

public interface MonedaDAO
{
	public List<Moneda> listarMonedas();
	public Moneda getById(long id);
	public void save(Moneda arg0);
}
