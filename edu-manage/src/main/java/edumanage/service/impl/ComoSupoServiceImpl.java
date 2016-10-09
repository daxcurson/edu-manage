package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.ComoSupoDAO;
import edumanage.model.ComoSupo;
import edumanage.service.ComoSupoService;

@Service
public class ComoSupoServiceImpl implements ComoSupoService 
{
	@Autowired
	private ComoSupoDAO comoSupoDAO;
	@Override
	@Transactional
	public ComoSupo getById(long id) 
	{
		return comoSupoDAO.getById(id);
	}
	@Override
	@Transactional
	public List<ComoSupo> listarComoSupo() 
	{
		return comoSupoDAO.listarComoSupo();
	}

}
