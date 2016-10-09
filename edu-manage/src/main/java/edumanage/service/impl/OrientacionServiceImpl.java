package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.*;
import edumanage.model.Orientacion;
import edumanage.service.OrientacionService;

@Service
public class OrientacionServiceImpl implements OrientacionService
{
	@Autowired
	private OrientacionDAO orientacionDAO;
	@Override
	@Transactional
	public List<Orientacion> listarOrientaciones() 
	{
		return orientacionDAO.listarOrientaciones();
	}
	@Override
	@Transactional
	public Orientacion getById(long parseLong) {
		return orientacionDAO.getById(parseLong);
	}
}
