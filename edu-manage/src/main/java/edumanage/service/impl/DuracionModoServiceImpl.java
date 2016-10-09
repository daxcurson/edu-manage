package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.DuracionModoDAO;
import edumanage.model.DuracionModo;
import edumanage.service.DuracionModoService;

@Service
public class DuracionModoServiceImpl implements DuracionModoService 
{
	@Autowired
	private DuracionModoDAO duracionModoDAO;
	@Override
	@Transactional
	public DuracionModo getById(long id) 
	{
		return duracionModoDAO.getById(id);
	}

	@Override
	@Transactional
	public List<DuracionModo> listarModos() 
	{
		return duracionModoDAO.listarDuraciones();
	}

}
