package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.HorarioCursoDAO;
import edumanage.model.Curso;
import edumanage.model.HorarioCurso;
import edumanage.service.HorarioCursoService;

@Service
public class HorarioCursoServiceImpl implements HorarioCursoService
{
	@Autowired
	private HorarioCursoDAO horarioCursoDao;
	@Override
	@Transactional
	public HorarioCurso getById(long id) 
	{
		return horarioCursoDao.getById(id);
	}

	@Override
	@Transactional
	public List<HorarioCurso> listarHorarios(Curso curso) 
	{
		return horarioCursoDao.listarHorariosCurso(curso);
	}

}
