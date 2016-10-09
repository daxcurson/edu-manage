package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.MonedaDAO;
import edumanage.model.Moneda;
import edumanage.service.MonedaService;

@Service
public class MonedaServiceImpl implements MonedaService 
{
	@Autowired
	private MonedaDAO monedaDAO;
	
	@Override
	@Transactional
	public Moneda getById(long id)
	{
		return monedaDAO.getById(id);
	}

	@Override
	@Transactional
	public List<Moneda> listarMonedas() 
	{
		return monedaDAO.listarMonedas();
	}
}
