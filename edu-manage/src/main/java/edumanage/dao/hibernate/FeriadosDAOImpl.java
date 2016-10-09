package edumanage.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
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
		Query queryFeriados=sessionFactory.getCurrentSession().createQuery(this.feriadosEntreFechas);
		queryFeriados.setDate("fechaDesde", desde);
		queryFeriados.setDate("fechaHasta", hasta);
		return queryFeriados.list();
	}

	@Override
	public Feriado buscarFeriadoEnFecha(Date fecha) 
	{
		Query queryFeriados=sessionFactory.getCurrentSession().createQuery("from Feriado where fecha=:fechaFeriado");
		queryFeriados.setDate("fechaFeriado", fecha);
		return (Feriado) queryFeriados.uniqueResult();
	}
}
