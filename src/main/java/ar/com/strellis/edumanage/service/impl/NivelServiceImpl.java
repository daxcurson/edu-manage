package ar.com.strellis.edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.NivelDAO;
import ar.com.strellis.edumanage.exceptions.NivelInexistenteException;
import ar.com.strellis.edumanage.model.Nivel;
import ar.com.strellis.edumanage.service.NivelService;

import java.util.List;

@Service
public class NivelServiceImpl implements NivelService 
{

	@Autowired
	private NivelDAO nivelDAO;
	@Override
	@Transactional
	public Nivel getById(long id) throws NivelInexistenteException 
	{
		return nivelDAO.findById(id).orElseThrow(NivelInexistenteException::new);
	}
	@Transactional
	public List<Nivel> listarNiveles()
	{
		return nivelDAO.findAll();
	}
}
