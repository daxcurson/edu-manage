package edumanage.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.SucursalDAO;
import edumanage.model.Sucursal;
import edumanage.service.SucursalService;

@Service
public class SucursalServiceImpl implements SucursalService
{
	static Logger log = Logger.getLogger(SucursalServiceImpl.class);
	@Autowired
	private SucursalDAO sucursalDAO;
	
	@Transactional
	public Sucursal getById(long id) 
	{
		return sucursalDAO.getById(id);
	}
	@Override
	public List<Sucursal> listarSucursales()
	{
		return sucursalDAO.listarSucursales();
	}
}
