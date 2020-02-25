package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.CargaHorariaDAO;
import ar.com.strellis.edumanage.exceptions.CargaHorariaInexistenteException;
import ar.com.strellis.edumanage.model.CargaHoraria;
import ar.com.strellis.edumanage.service.CargaHorariaService;

@Service
public class CargaHorariaServiceImpl implements CargaHorariaService
{
	@Autowired
	private CargaHorariaDAO cargaHorariaDAO;
	@Override
	@Transactional
	public List<CargaHoraria> listarCargasHorarias() 
	{
		return cargaHorariaDAO.findAll();
	}
	@Override
	@Transactional
	public void addCargaHoraria(CargaHoraria carga_horaria) 
	{
		cargaHorariaDAO.save(carga_horaria);
	}
	@Override
	@Transactional
	public CargaHoraria getById(long parseLong) throws CargaHorariaInexistenteException 
	{
		return cargaHorariaDAO.findById(parseLong).orElseThrow(CargaHorariaInexistenteException::new);
	}
}
