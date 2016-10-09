package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.CargaHorariaDAO;
import edumanage.model.CargaHoraria;
import edumanage.service.CargaHorariaService;

@Service
public class CargaHorariaServiceImpl implements CargaHorariaService
{
	@Autowired
	private CargaHorariaDAO cargaHorariaDAO;
	@Override
	@Transactional
	public List<CargaHoraria> listarCargasHorarias() 
	{
		return cargaHorariaDAO.listarCargasHorarias();
	}
	@Override
	@Transactional
	public void addCargaHoraria(CargaHoraria carga_horaria) 
	{
		cargaHorariaDAO.addCargaHoraria(carga_horaria);
	}
	@Override
	@Transactional
	public CargaHoraria getById(long parseLong) 
	{
		return cargaHorariaDAO.getById(parseLong);
	}
}
