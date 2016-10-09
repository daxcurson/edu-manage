package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.DuracionModoDAO;
import edumanage.model.DuracionModo;

@Repository
public class DuracionModoDAOImpl implements DuracionModoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public DuracionModo getById(long id) 
	{
		return (DuracionModo) sessionFactory.getCurrentSession().createQuery("from DuracionModo where id="+id).uniqueResult();
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<DuracionModo> listarDuraciones() 
	{
		return (List<DuracionModo>) sessionFactory.getCurrentSession().createQuery("from DuracionModo").list();
	}
}
