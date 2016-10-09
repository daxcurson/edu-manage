package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.CargaHorariaDAO;
import edumanage.model.CargaHoraria;

@Repository
public class CargaHorariaDAOImpl implements CargaHorariaDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public CargaHoraria getById(long id) 
	{
		return (CargaHoraria) sessionFactory.getCurrentSession().createQuery("from CargaHoraria where id="+id).uniqueResult();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<CargaHoraria> listarCargasHorarias() 
	{
		return (List<CargaHoraria>) sessionFactory.getCurrentSession().createQuery("from CargaHoraria").list();
	}

	@Override
	public void addCargaHoraria(CargaHoraria carga_horaria) 
	{
		sessionFactory.getCurrentSession().save(carga_horaria);
	}
}
