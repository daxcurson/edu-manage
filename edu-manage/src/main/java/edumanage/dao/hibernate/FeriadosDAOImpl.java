package edumanage.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.FeriadosDAO;
import edumanage.model.Feriado;

@Repository
public class FeriadosDAOImpl implements FeriadosDAO 
{
	@Autowired
	private SessionFactory sessionFactory;
	
	private final String feriadosEntreFechas="from Feriado where fecha>=:fechaDesde and fecha<=:fechaHasta";

	@SuppressWarnings("unchecked")
	@Override
	public List<Feriado> listarFeriados(Date desde, Date hasta) 
	{
		Query<Feriado> queryFeriados=sessionFactory.getCurrentSession().createQuery(this.feriadosEntreFechas);
		queryFeriados.setParameter("fechaDesde", desde);
		queryFeriados.setParameter("fechaHasta", hasta);
		return queryFeriados.getResultList();
	}

	@Override
	public Feriado buscarFeriadoEnFecha(Date fecha) 
	{
		Query<Feriado> queryFeriados=sessionFactory.getCurrentSession().createQuery("from Feriado where fecha=:fechaFeriado",Feriado.class);
		queryFeriados.setParameter("fechaFeriado", fecha);
		return (Feriado) queryFeriados.getSingleResult();
	}
}
