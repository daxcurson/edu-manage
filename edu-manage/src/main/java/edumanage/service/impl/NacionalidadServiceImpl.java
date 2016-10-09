package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.NacionalidadDAO;
import edumanage.model.Nacionalidad;
import edumanage.service.NacionalidadService;

@Service
public class NacionalidadServiceImpl implements NacionalidadService 
{
	@Autowired
	private NacionalidadDAO nacionalidadDAO;
	
	@Override
	@Transactional
	public Nacionalidad getById(long id) 
	{
		return nacionalidadDAO.getById(id);
	}

	@Override
	@Transactional
	public List<Nacionalidad> listarNacionalidades() 
	{
		return nacionalidadDAO.listarNacionalidades();
	}

}
