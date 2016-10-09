package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.OrientacionDAO;
import edumanage.model.Orientacion;

@Repository
public class OrientacionDAOImpl implements OrientacionDAO 
{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	@SuppressWarnings("unchecked")
	public List<Orientacion> listarOrientaciones() 
	{
		return (List<Orientacion>) sessionFactory.getCurrentSession().createQuery("from Orientacion").list();
	}
	
	@Override
	public Orientacion getById(long id) 
	{
		return (Orientacion) sessionFactory.getCurrentSession().createQuery("from Orientacion where id="+id).uniqueResult();
	}
}
