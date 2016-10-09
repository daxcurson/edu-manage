package edumanage.dao.hibernate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.InscripcionDAO;
import edumanage.model.CursoGenerico;
import edumanage.model.Inscripcion;

@Repository
public class InscripcionDAOImpl implements InscripcionDAO
{
	static Logger log = Logger.getLogger(InscripcionDAOImpl.class);

	private String queryInscripcionesAConfirmar="from Inscripcion where borrada=0"
			+ "and confirmada=0";
	private String queryIntegrantesCurso="from Inscripcion inscripcion where "
			+ "inscripcion.confirmada=1 "
			+ "and inscripcion.borrada=0 "
			+ "and inscripcion.fecha_finalizacion >= cast(:fechaHoy as date) "
			+ "and ("
			+ 	"inscripcion.persona.baja=0 or ("
			+ 		"inscripcion.persona.baja=1 and inscripcion.persona.fecha_baja>= cast(:fechaHoy as date) "
			+ 	")"
			+ ") "
			+ "and ("
			+ 	"inscripcion.baja=0 or ("
			+ 		"inscripcion.baja=1 and inscripcion.fecha_baja>= cast(:fechaHoy as date) "
			+ 	")"
			+ ")";

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Inscripcion> listarInscripcionesHoy() 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public Inscripcion getById(long id) 
	{
		return (Inscripcion) sessionFactory.getCurrentSession().createQuery("from Inscripcion where id="+id).uniqueResult();
	}

	@Override
	@Transactional
	public void grabarNueva(Inscripcion insc) 
	{
		sessionFactory.getCurrentSession().save(insc);
	}
	@Override
	@Transactional
	public void grabar(Inscripcion insc)
	{
		log.trace("Voy a grabar la insc "+insc.getId());
		sessionFactory.getCurrentSession().merge(insc);
	}

	@Override
	@Transactional
	public List<Inscripcion> listarInscripcionesAConfirmar() 
	{
		Query queryinscripciones=sessionFactory.getCurrentSession().createQuery(queryInscripcionesAConfirmar);
		@SuppressWarnings("unchecked")
		List<Inscripcion> listaInscripciones=queryinscripciones.list();
		return listaInscripciones;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Inscripcion> buscarIntegrantesCurso(CursoGenerico curso) 
	{
		Query queryIntegrantes=sessionFactory.getCurrentSession().createQuery(this.queryIntegrantesCurso);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		queryIntegrantes.setString("fechaHoy", sdf.format(d));
		return queryIntegrantes.list();
	}
}
