package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.NivelDAO;
import edumanage.model.Nivel;

@Repository
public class NivelDAOImpl implements NivelDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Nivel> listarNiveles() 
	{
		return (List<Nivel>) sessionFactory.getCurrentSession().createQuery("from Nivel").getResultList();
	}
	
	@Override
	public Nivel getById(long id) 
	{
		return (Nivel) sessionFactory.getCurrentSession().createQuery("from Nivel where id="+id).getSingleResult();
	}
}
