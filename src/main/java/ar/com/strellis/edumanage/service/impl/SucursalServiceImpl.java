package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.SucursalDAO;
import ar.com.strellis.edumanage.exceptions.SucursalInexistenteException;
import ar.com.strellis.edumanage.model.Sucursal;
import ar.com.strellis.edumanage.service.SucursalService;

@Service
public class SucursalServiceImpl implements SucursalService
{
	static Logger log = LogManager.getLogger(SucursalServiceImpl.class);
	@Autowired
	private SucursalDAO sucursalDAO;
	
	@Transactional
	public Sucursal getById(long id) throws SucursalInexistenteException 
	{
		return sucursalDAO.findById(id).orElseThrow(SucursalInexistenteException::new);
	}
	@Override
	public List<Sucursal> listarSucursales()
	{
		return sucursalDAO.findAll();
	}
}
