package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.HorarioCursoDAO;
import edumanage.model.Curso;
import edumanage.model.HorarioCurso;

@Repository
public class HorarioCursoDAOImpl implements HorarioCursoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<HorarioCurso> listarHorariosCurso(Curso curso) 
	{
		return (List<HorarioCurso>) sessionFactory.getCurrentSession().createQuery("from HorarioCurso where curso_id="+curso.getId()).getResultList();
	}

	@Override
	public HorarioCurso getById(long id) 
	{
		return (HorarioCurso) sessionFactory.getCurrentSession().createQuery("from HorarioCurso where id="+id).getSingleResult();
	}

}
