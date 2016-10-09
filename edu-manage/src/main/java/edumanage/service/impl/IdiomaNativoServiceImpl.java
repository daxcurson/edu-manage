package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.IdiomaNativoDAO;
import edumanage.model.IdiomaNativo;
import edumanage.service.IdiomaNativoService;

@Service
public class IdiomaNativoServiceImpl implements IdiomaNativoService 
{
	@Autowired
	private IdiomaNativoDAO idiomaNativoDAO;
	@Override
	@Transactional
	public IdiomaNativo getById(long id) 
	{
		return idiomaNativoDAO.getById(id);
	}

	@Override
	@Transactional
	public List<IdiomaNativo> listarIdiomasNativos() 
	{
		return idiomaNativoDAO.listarIdiomasNativos();
	}

}
