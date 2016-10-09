package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.*;
import edumanage.model.*;

@Repository
public class MonedaDAOImpl implements MonedaDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Moneda> listarMonedas() 
	{
		return (List<Moneda>) sessionFactory.getCurrentSession().createQuery("from Moneda").list();
	}

	@Override
	public Moneda getById(long id) 
	{
		return (Moneda)sessionFactory.getCurrentSession().createQuery("from Moneda where id="+id).uniqueResult();
	}
}
