package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.NacionalidadDAO;
import edumanage.model.Nacionalidad;

@Repository
public class NacionalidadDAOImpl implements NacionalidadDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Nacionalidad getById(long id) 
	{
		return (Nacionalidad) sessionFactory.getCurrentSession().createQuery("from Nacionalidad where id="+id).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Nacionalidad> listarNacionalidades() 
	{
		return (List<Nacionalidad>) sessionFactory.getCurrentSession().createQuery("from Nacionalidad").getResultList();
	}

}
