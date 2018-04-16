package edumanage.service;

import java.util.List;

import edumanage.excepciones.MonedaExistenteException;
import edumanage.model.Moneda;

public interface MonedaService 
{
	public Moneda getById(long id);
	public List<Moneda> listarMonedas();
	public void save(Moneda moneda) throws MonedaExistenteException;
}
