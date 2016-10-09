package edumanage.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.HonorarioAsignadoDAO;
import edumanage.model.HonorarioAsignado;

@Repository
public class HonorarioAsignadoDAOImpl implements HonorarioAsignadoDAO
{
	private static final String queryHonorariosAsignadosProfesor="from HonorarioAsignado where profesor_id=:profesorId";
	static Logger log = Logger.getLogger(HonorarioAsignadoDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<HonorarioAsignado> listarHonorariosAsignados(long profesorId) 
	{
		Query query=sessionFactory.getCurrentSession().createQuery(queryHonorariosAsignadosProfesor);
		query.setLong("profesorId", profesorId);
		return query.list();
	}

}
