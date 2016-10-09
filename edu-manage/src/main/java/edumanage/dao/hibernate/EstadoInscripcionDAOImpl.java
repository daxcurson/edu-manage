package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.EstadoInscripcionDAO;
import edumanage.model.EstadoInscripcion;

@Repository
public class EstadoInscripcionDAOImpl implements EstadoInscripcionDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<EstadoInscripcion> listarEstados() 
	{
		return (List<EstadoInscripcion>) sessionFactory.getCurrentSession().createQuery("from EstadoInscripcion").list();
	}

	@Override
	public EstadoInscripcion getById(long id) 
	{
		return (EstadoInscripcion) sessionFactory.getCurrentSession().createQuery("from EstadoInscripcion where id="+id).uniqueResult();
	}

	@Override
	public EstadoInscripcion getByAbreviatura(String abreviatura) 
	{
		return (EstadoInscripcion) sessionFactory.getCurrentSession().createQuery("from EstadoInscripcion where abreviatura='"+abreviatura+"'").uniqueResult();
	}

}
