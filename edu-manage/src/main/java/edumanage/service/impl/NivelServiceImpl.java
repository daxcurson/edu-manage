package edumanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.NivelDAO;
import edumanage.model.Nivel;
import edumanage.service.NivelService;

import java.util.List;

@Service
public class NivelServiceImpl implements NivelService 
{

	@Autowired
	private NivelDAO nivelDAO;
	@Override
	@Transactional
	public Nivel getById(long id) 
	{
		return nivelDAO.getById(id);
	}
	@Transactional
	public List<Nivel> listarNiveles()
	{
		return nivelDAO.listarNiveles();
	}
}
