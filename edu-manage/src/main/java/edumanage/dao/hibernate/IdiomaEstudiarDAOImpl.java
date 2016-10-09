package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.*;
import edumanage.model.IdiomaEstudiar;

@Repository
public class IdiomaEstudiarDAOImpl implements IdiomaEstudiarDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<IdiomaEstudiar> listarIdiomasEstudiar() 
	{
		return (List<IdiomaEstudiar>) sessionFactory.getCurrentSession().createQuery("from IdiomaEstudiar").list();
	}

	@Override
	public IdiomaEstudiar getById(long id) 
	{
		return (IdiomaEstudiar) sessionFactory.getCurrentSession().createQuery("from IdiomaEstudiar where id="+id).uniqueResult();
	}

}
