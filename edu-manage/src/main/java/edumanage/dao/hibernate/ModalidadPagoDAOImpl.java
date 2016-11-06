package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.ModalidadPagoDAO;
import edumanage.model.ModalidadPago;

@Repository
public class ModalidadPagoDAOImpl implements ModalidadPagoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ModalidadPago> listarModalidadesPago() 
	{
		return (List<ModalidadPago>) sessionFactory.getCurrentSession().createQuery("from ModalidadPago").getResultList();
	}

	@Override
	public ModalidadPago getById(long id) 
	{
		return (ModalidadPago)sessionFactory.getCurrentSession().createQuery("from ModalidadPago where id="+id).getSingleResult();
	}
}
