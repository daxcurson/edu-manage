package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.*;
import ar.com.strellis.edumanage.model.Orientacion;
import ar.com.strellis.edumanage.service.OrientacionService;

@Service
public class OrientacionServiceImpl implements OrientacionService
{
	@Autowired
	private OrientacionDAO orientacionDAO;
	@Override
	@Transactional
	public List<Orientacion> listarOrientaciones() 
	{
		return orientacionDAO.findAll();
	}
	@Override
	@Transactional
	public Orientacion getById(long parseLong) throws OrientacionInexistenteException {
		return orientacionDAO.findById(parseLong).orElseThrow(OrientacionInexistenteException::new);
	}
}
