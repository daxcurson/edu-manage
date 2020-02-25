package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.HorarioCursoDAO;
import ar.com.strellis.edumanage.exceptions.HorarioCursoInexistente;
import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.HorarioCurso;
import ar.com.strellis.edumanage.service.HorarioCursoService;

@Service
public class HorarioCursoServiceImpl implements HorarioCursoService
{
	@Autowired
	private HorarioCursoDAO horarioCursoDao;
	@Override
	@Transactional
	public HorarioCurso getById(long id) throws HorarioCursoInexistente 
	{
		return horarioCursoDao.findById(id).orElseThrow(HorarioCursoInexistente::new);
	}

	@Override
	@Transactional
	public List<HorarioCurso> listarHorarios(Curso curso) 
	{
		return horarioCursoDao.findCursosByHorario(curso);
	}

}
