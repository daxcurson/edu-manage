package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.IdiomaNativoDAO;
import edumanage.model.IdiomaNativo;

@Repository
public class IdiomaNativoDAOImpl implements IdiomaNativoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<IdiomaNativo> listarIdiomasNativos() 
	{
		return (List<IdiomaNativo>) sessionFactory.getCurrentSession().createQuery("from IdiomaNativo").getResultList();
	}

	@Override
	public IdiomaNativo getById(long id) 
	{
		return (IdiomaNativo) sessionFactory.getCurrentSession().createQuery("from IdiomaNativo where id="+id).getSingleResult();
	}

}
