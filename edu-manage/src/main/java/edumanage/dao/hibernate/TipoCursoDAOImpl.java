package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.TipoCursoDAO;
import edumanage.model.TipoCurso;

@Repository
public class TipoCursoDAOImpl implements TipoCursoDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoCurso> listarTiposCurso() 
	{
		return (List<TipoCurso>) sessionFactory.getCurrentSession().createQuery("from TipoCurso").getResultList();
	}

	@Override
	public TipoCurso getById(long parseLong) 
	{
		return (TipoCurso) sessionFactory.getCurrentSession().createQuery("from TipoCurso where id="+parseLong).getSingleResult();
	}
}
