package edumanage.dao.hibernate;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.ProfesorDAO;
import edumanage.model.Profesor;

@Repository
public class ProfesorDAOImpl implements ProfesorDAO 
{
	static Logger log = Logger.getLogger(ProfesorDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Profesor getById(long id) 
	{
		return (Profesor)sessionFactory.getCurrentSession().createQuery("from Profesor where id="+id).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Profesor> listarProfesores() 
	{
		return sessionFactory.getCurrentSession().createQuery("from Profesor").getResultList();
	}

	@Override
	public Long cantidadTotal() 
	{
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(id) from Profesor").getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Profesor> listarProfesoresPorPagina(int primerRegistro, int largoPagina) 
	{
		Query<Profesor> lista=sessionFactory.getCurrentSession().createQuery("from Profesor");
		lista.setFirstResult(primerRegistro);
		lista.setMaxResults(largoPagina);
		return lista.getResultList();
	}

	@Override
	public void grabar(Profesor p) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(p);
	}
}
