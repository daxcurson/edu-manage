package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.PerfilProfesorDAO;
import edumanage.model.PerfilProfesor;

@Repository
public class PerfilProfesorDAOImpl implements PerfilProfesorDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<PerfilProfesor> listarPerfiles() 
	{
		return (List<PerfilProfesor>) sessionFactory.getCurrentSession().createQuery("from PerfilProfesor").getResultList();
	}

	@Override
	public PerfilProfesor getById(long id) 
	{
		return (PerfilProfesor) sessionFactory.getCurrentSession().createQuery("from PerfilProfesor where id="+id).getSingleResult();
	}
}
