package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.TipoCursoDAO;
import ar.com.strellis.edumanage.exceptions.TipoCursoInexistenteException;
import ar.com.strellis.edumanage.model.TipoCurso;
import ar.com.strellis.edumanage.service.TipoCursoService;

@Service
public class TipoCursoServiceImpl implements TipoCursoService 
{
	@Autowired
	private TipoCursoDAO tipoCursoDAO;
	@Override
	@Transactional
	public List<TipoCurso> listarTiposCurso() 
	{
		return tipoCursoDAO.findAll();
	}
	@Override
	@Transactional
	public TipoCurso getById(long parseLong) throws TipoCursoInexistenteException 
	{
		return tipoCursoDAO.findById(parseLong).orElseThrow(TipoCursoInexistenteException::new);
	}

}
