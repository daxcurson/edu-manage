package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.IdiomaNativoDAO;
import ar.com.strellis.edumanage.exceptions.IdiomaNativoInexistente;
import ar.com.strellis.edumanage.model.IdiomaNativo;
import ar.com.strellis.edumanage.service.IdiomaNativoService;

@Service
public class IdiomaNativoServiceImpl implements IdiomaNativoService 
{
	@Autowired
	private IdiomaNativoDAO idiomaNativoDAO;
	@Override
	@Transactional
	public IdiomaNativo getById(long id) throws IdiomaNativoInexistente 
	{
		return idiomaNativoDAO.findById(id).orElseThrow(IdiomaNativoInexistente::new);
	}

	@Override
	@Transactional
	public List<IdiomaNativo> listarIdiomasNativos() 
	{
		return idiomaNativoDAO.findAll();
	}

}
