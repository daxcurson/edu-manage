package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.DuracionModoDAO;
import ar.com.strellis.edumanage.exceptions.DuracionModoInexistenteException;
import ar.com.strellis.edumanage.model.DuracionModo;
import ar.com.strellis.edumanage.service.DuracionModoService;

@Service
public class DuracionModoServiceImpl implements DuracionModoService 
{
	@Autowired
	private DuracionModoDAO duracionModoDAO;
	@Override
	@Transactional
	public DuracionModo getById(long id) throws DuracionModoInexistenteException 
	{
		return duracionModoDAO.findById(id).orElseThrow(DuracionModoInexistenteException::new);
	}

	@Override
	@Transactional
	public List<DuracionModo> listarModos() 
	{
		return duracionModoDAO.findAll();
	}

}
