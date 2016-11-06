package edumanage.dao.hibernate;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.HonorarioProfesorDAO;
import edumanage.model.HonorarioProfesor;

@Repository
public class HonorarioProfesorDAOImpl implements HonorarioProfesorDAO 
{
	static Logger log = Logger.getLogger(HonorarioProfesorDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public HonorarioProfesor getById(long id) 
	{
		return (HonorarioProfesor)sessionFactory.getCurrentSession().createQuery("from HonorarioProfesor where id="+id).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HonorarioProfesor> buscarHonorariosIdioma(long idiomaEstudiarId) 
	{
		Query<HonorarioProfesor> q=sessionFactory.getCurrentSession().createQuery("from HonorarioProfesor where idioma_estudiar.id=:idiomaEstudiarId");
		q.setParameter("idiomaEstudiarId", idiomaEstudiarId);
		return q.getResultList();
	}

	@Override
	public void grabar(HonorarioProfesor honorario) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(honorario);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HonorarioProfesor> listarHonorarios() 
	{
		return sessionFactory.getCurrentSession().createQuery("from HonorarioProfesor").getResultList();
	}
}
