package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.MonedaDAO;
import ar.com.strellis.edumanage.exceptions.MonedaExistenteException;
import ar.com.strellis.edumanage.exceptions.MonedaInexistenteException;
import ar.com.strellis.edumanage.model.Moneda;
import ar.com.strellis.edumanage.service.MonedaService;

@Service
public class MonedaServiceImpl implements MonedaService 
{
	@Autowired
	private MonedaDAO monedaDAO;
	
	@Override
	@Transactional
	public Moneda getById(long id) throws MonedaInexistenteException
	{
		return monedaDAO.findById(id).orElseThrow(MonedaInexistenteException::new);
	}

	@Override
	@Transactional
	public List<Moneda> listarMonedas() 
	{
		return monedaDAO.findAll();
	}

	@Override
	public void save(Moneda moneda) throws MonedaExistenteException
	{
		try
		{
			monedaDAO.save(moneda);
		}
        catch(ConstraintViolationException e)
        {
        	throw new MonedaExistenteException("Esa moneda ya existe");
        }
	}
}
