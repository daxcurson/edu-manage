package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.NacionalidadDAO;
import ar.com.strellis.edumanage.exceptions.NacionalidadInexistenteException;
import ar.com.strellis.edumanage.model.Nacionalidad;
import ar.com.strellis.edumanage.service.NacionalidadService;

@Service
public class NacionalidadServiceImpl implements NacionalidadService 
{
	@Autowired
	private NacionalidadDAO nacionalidadDAO;
	
	@Override
	@Transactional
	public Nacionalidad getById(long id) throws NacionalidadInexistenteException 
	{
		return nacionalidadDAO.findById(id).orElseThrow(NacionalidadInexistenteException::new);
	}

	@Override
	@Transactional
	public List<Nacionalidad> listarNacionalidades() 
	{
		return nacionalidadDAO.findAll();
	}

}
