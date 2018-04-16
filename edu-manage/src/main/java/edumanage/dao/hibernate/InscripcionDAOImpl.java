package edumanage.dao.hibernate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
	/**
	 * Estudiantes que terminan hoy: estudiantes con inscripcion confirmada, que no se hayan
	 * borrado, o dado de baja, y que si fueron, que sea despues de hoy, y que,
	 * tengan una fecha de fin de inscripcion igual a hoy o que su curso tenga una fecha
	 * de fin igual a hoy, este abierto, no haya sido de baja o si lo fue, que haya sido despues de hoy.
	 */
	private String queryTerminanHoy="from Inscripcion inscripcion where "
			+ "inscripcion.confirmada=1 "
			+ "and inscripcion.borrada=0 "
			+ "and ("
			+ 	"inscripcion.fecha_finalizacion = cast(:fechaHoy as date)"
			+ 	"or "
			+ 	"inscripcion.curso.fecha_fin=cast(:fechaHoy as date)"
			+ ")"
			+ "and inscripcion.curso.abierto='S' and ("
			+ 	"inscripcion.curso.baja=0 or ("
			+ 		"inscripcion.curso.baja=1 and inscripcion.curso.fecha_baja>=cast(:fechaHoy as date)"
			+ 	")"
			+ ") "
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
		return (Inscripcion) sessionFactory.getCurrentSession().createQuery("from Inscripcion where id="+id).getSingleResult();
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
		Query<Inscripcion> queryinscripciones=sessionFactory.getCurrentSession().createQuery(queryInscripcionesAConfirmar,Inscripcion.class);
		
		List<Inscripcion> listaInscripciones=queryinscripciones.getResultList();
		return listaInscripciones;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Inscripcion> buscarIntegrantesCurso(CursoGenerico curso) 
	{
		Query<Inscripcion> queryIntegrantes=sessionFactory.getCurrentSession().createQuery(this.queryIntegrantesCurso);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		queryIntegrantes.setParameter("fechaHoy", sdf.format(d));
		return queryIntegrantes.getResultList();
	}

	@Override
	public List<Inscripcion> listarInscripcionesTerminanHoy()
	{
		@SuppressWarnings("unchecked")
		Query<Inscripcion> queryInscripcionesTerminanHoy=sessionFactory.getCurrentSession().createQuery(this.queryTerminanHoy);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		queryInscripcionesTerminanHoy.setParameter("fechaHoy", sdf.format(d));
		return queryInscripcionesTerminanHoy.getResultList();
	}
}
