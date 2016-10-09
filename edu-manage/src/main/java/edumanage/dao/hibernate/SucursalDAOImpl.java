package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.SucursalDAO;
import edumanage.model.Sucursal;

@Repository
public class SucursalDAOImpl implements SucursalDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Sucursal> listarSucursales() 
	{
		return (List<Sucursal>) sessionFactory.getCurrentSession().createQuery("from Sucursal").list();
	}

	@Override
	public Sucursal getById(long id) 
	{
		return (Sucursal) sessionFactory.getCurrentSession().createQuery("from Sucursal where id="+id).uniqueResult();
	}

}
