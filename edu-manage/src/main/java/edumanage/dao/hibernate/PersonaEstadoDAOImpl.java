package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.PersonaEstadoDAO;
import edumanage.model.PersonaEstado;

@Repository
public class PersonaEstadoDAOImpl implements PersonaEstadoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<PersonaEstado> listarEstados() 
	{
		return (List<PersonaEstado>) sessionFactory.getCurrentSession().createQuery("from PersonaEstado").list();
	}

	@Override
	public PersonaEstado getById(long id) 
	{
		return (PersonaEstado) sessionFactory.getCurrentSession().createQuery("from PersonaEstado where id="+id).uniqueResult();
	}

}
