package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.IdiomaEstudiarDAO;
import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.service.IdiomaEstudiarService;

@Service
public class IdiomaEstudiarServiceImpl implements IdiomaEstudiarService 
{
	@Autowired
	private IdiomaEstudiarDAO idiomaEstudiarDAO;
	@Override
	@Transactional
	public IdiomaEstudiar getById(long id) throws IdiomaEstudiarInexistente 
	{
		return idiomaEstudiarDAO.findById(id).orElseThrow(IdiomaEstudiarInexistente::new);
	}
	@Override
	@Transactional
	public List<IdiomaEstudiar> listarIdiomasEstudiar() 
	{
		return idiomaEstudiarDAO.findAll();
	}

}
