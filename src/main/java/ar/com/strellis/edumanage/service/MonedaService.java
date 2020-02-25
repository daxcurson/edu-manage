package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.MonedaExistenteException;
import ar.com.strellis.edumanage.exceptions.MonedaInexistenteException;
import ar.com.strellis.edumanage.model.Moneda;

public interface MonedaService 
{
	public Moneda getById(long id) throws MonedaInexistenteException;
	public List<Moneda> listarMonedas();
	public void save(Moneda moneda) throws MonedaExistenteException;
}
