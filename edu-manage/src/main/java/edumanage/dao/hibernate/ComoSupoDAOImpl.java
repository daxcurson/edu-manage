package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.ComoSupoDAO;
import edumanage.model.ComoSupo;

@Repository
public class ComoSupoDAOImpl implements ComoSupoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<ComoSupo> listarComoSupo() 
	{
		return (List<ComoSupo>) sessionFactory.getCurrentSession().createQuery("from ComoSupo").list();
	}

	@Override
	public ComoSupo getById(long id) 
	{
		return (ComoSupo) sessionFactory.getCurrentSession().createQuery("from ComoSupo where id="+id).uniqueResult();
	}
}
