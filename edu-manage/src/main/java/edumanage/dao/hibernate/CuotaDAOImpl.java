package edumanage.dao.hibernate;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.CuotaDAO;
import edumanage.model.Cuota;

@Repository
public class CuotaDAOImpl implements CuotaDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Cuota getById(long id) 
	{
		return (Cuota) sessionFactory.getCurrentSession().createQuery("from Cuota where id="+id).uniqueResult();
	}

}
