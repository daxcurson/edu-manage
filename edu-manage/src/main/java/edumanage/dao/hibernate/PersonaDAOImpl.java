package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.*;
import edumanage.model.*;

@Repository
public class PersonaDAOImpl implements PersonaDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Persona> listPersona() 
	{
		return (List<Persona>) sessionFactory.getCurrentSession().createQuery("from Persona").getResultList();
	}

	public void removePersona(Integer id) 
	{
		Persona contact = (Persona) sessionFactory.getCurrentSession().load(Persona.class, id);
		if (null != contact) 
		{
			sessionFactory.getCurrentSession().delete(contact);
		}
	}

	@Override
	public Persona getById(long id) 
	{
		return (Persona) sessionFactory.getCurrentSession().createQuery("from Persona where id="+id).getSingleResult();
	}

	@Override
	public void save(Persona persona) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(persona);
	}
}
