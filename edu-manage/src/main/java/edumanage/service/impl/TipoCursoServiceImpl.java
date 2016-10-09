package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.TipoCursoDAO;
import edumanage.model.TipoCurso;
import edumanage.service.TipoCursoService;

@Service
public class TipoCursoServiceImpl implements TipoCursoService 
{
	@Autowired
	private TipoCursoDAO tipoCursoDAO;
	@Override
	@Transactional
	public List<TipoCurso> listarTiposCurso() 
	{
		return tipoCursoDAO.listarTiposCurso();
	}
	@Override
	@Transactional
	public TipoCurso getById(long parseLong) 
	{
		return tipoCursoDAO.getById(parseLong);
	}

}
