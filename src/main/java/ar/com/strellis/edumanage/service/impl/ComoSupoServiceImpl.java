package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.ComoSupoDAO;
import ar.com.strellis.edumanage.exceptions.ComoSupoInexistente;
import ar.com.strellis.edumanage.model.ComoSupo;
import ar.com.strellis.edumanage.service.ComoSupoService;

@Service
public class ComoSupoServiceImpl implements ComoSupoService 
{
	@Autowired
	private ComoSupoDAO comoSupoDAO;
	@Override
	@Transactional
	public ComoSupo getById(long id) throws ComoSupoInexistente 
	{
		return comoSupoDAO.findById(id).orElseThrow(ComoSupoInexistente::new);
	}
	@Override
	@Transactional
	public List<ComoSupo> listarComoSupo() 
	{
		return comoSupoDAO.findAll();
	}

}
