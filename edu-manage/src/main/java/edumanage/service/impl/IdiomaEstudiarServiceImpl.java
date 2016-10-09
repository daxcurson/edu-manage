package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.IdiomaEstudiarDAO;
import edumanage.model.IdiomaEstudiar;
import edumanage.service.IdiomaEstudiarService;

@Service
public class IdiomaEstudiarServiceImpl implements IdiomaEstudiarService 
{
	@Autowired
	private IdiomaEstudiarDAO idiomaEstudiarDAO;
	@Override
	@Transactional
	public IdiomaEstudiar getById(long id) 
	{
		return idiomaEstudiarDAO.getById(id);
	}
	@Override
	@Transactional
	public List<IdiomaEstudiar> listarIdiomasEstudiar() 
	{
		return idiomaEstudiarDAO.listarIdiomasEstudiar();
	}

}
