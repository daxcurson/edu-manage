package edumanage.dao.hibernate;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.*;
import edumanage.dao.criterio.Criterio;
import edumanage.model.Curso;
import edumanage.model.CursoGenerico;
import edumanage.model.criterio.CursoVigente;
import edumanage.model.listados.ListadoPaginado;

@Repository
public class CursoDAOImpl implements CursoDAO
{
	static Logger log = Logger.getLogger(CursoDAOImpl.class);

	private String queryCursosVigentes="from Curso curso where " +
			"curso.fecha_fin >= cast(:fecha_fin as date) and curso.baja=0"+
			"and curso.inscriptos>0 "+
			"and curso.abierto='S'";
	private String queryCursosIdiomaNivel="from Curso curso where "+
			"curso.tipo_curso=2 and "+
			"curso.idioma_estudiar.id=:idiomaEstudiarId and "+
			"curso.nivel.id=:nivelId and "+
			"curso.fecha_fin>=cast(:fechaHoy as date) and "+
			"(curso.baja=0 or curso.fecha_baja>= cast(:fechaHoy as date))";
	private String queryCursosSinClases="from Curso curso where "
			+ "not exists (from Clase clase where clase.curso.id=curso.id) "
			+ "and curso.fecha_fin >= cast(:fechaHoy as date)"
			+ "and curso.baja=0 "
			+ "order by curso.idioma_estudiar ASC";
	private String queryCursosNoTerminados="from Curso curso where "
			+ "curso.fecha_fin >= cast(:fechaHoy as date)"
			+ "and ("
			+ 	"curso.baja=0 or (curso.fecha_baja >= cast(:fechaHoy as date))"
			+ ")";
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	public List<Curso> listarCursosVigentes()
	{
		Query<Curso> querycursos=sessionFactory.getCurrentSession().createQuery(queryCursosVigentes);
		querycursos.setParameter("fecha_fin", DateUtils.truncate(new java.util.Date(), Calendar.DATE));
		List<Curso> listaCursos=querycursos.getResultList();
		return listaCursos;
	}
	@Override
	public void addCurso(Curso curso) 
	{
		sessionFactory.getCurrentSession().save(curso);
	}
	@Override
	public void editCurso(Curso curso) 
	{
	}
	@Override
	public Curso getById(long id) 
	{
		return (Curso) sessionFactory.getCurrentSession().createQuery("from Curso where id="+id).getSingleResult();
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<Curso> listarCursosIdiomaNivel(int idioma, int nivel) 
	{
		List<Curso> listaCursos=null;
		Query<Curso> querycursos=sessionFactory.getCurrentSession().createQuery(this.queryCursosIdiomaNivel);
		querycursos.setParameter("idiomaEstudiarId",idioma);
		querycursos.setParameter("nivelId",nivel);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		querycursos.setParameter("fechaHoy",sdf.format(d));
		listaCursos=querycursos.getResultList();
		return listaCursos;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<Curso> listarCursosSinClases() 
	{
		List<Curso> listaCursos=null;
		Query<Curso> querycursos=sessionFactory.getCurrentSession().createQuery(this.queryCursosSinClases);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		querycursos.setParameter("fechaHoy",sdf.format(d));
		listaCursos=querycursos.getResultList();
		return listaCursos;
	}
	@SuppressWarnings("unchecked")
	@Override
	/**
	 * Lista los cursos cuya fecha de fin sea mayor al dia de hoy, que
	 * no esten dados de baja, o que si lo estan, que sea en una fecha posterior
	 * a la fecha de hoy.
	 * Si el tipo de curso es 1 (individual), busco los cursos individuales con
	 * cero integrantes, o los duales, no importa la cantidad, y que no esten abiertos.
	 * Si el tipo de curso es otro, buscar los cursos de ese tipo.
	 * Ademas si el idioma y el nivel son distintos de cero, agregar eso a las condiciones
	 * de busqueda.
	 */
	public List<Curso> listarCursosNoTerminados(int tipo_curso_id, int idioma_estudiar_id, int nivel_id) 
	{
		List<Curso> listaCursos=null;
		String queryCursos=this.queryCursosNoTerminados;
		if(tipo_curso_id!=0)
		{
			if(tipo_curso_id==1)
				queryCursos+=" and (curso.tipo_curso=1 or curso.tipo_curso=3)";
			else
				queryCursos+=" and curso.tipo_curso="+tipo_curso_id;
		}
		if(idioma_estudiar_id!=0)
			queryCursos+=" and curso.idioma_estudiar="+idioma_estudiar_id;
		if(nivel_id!=0)
			queryCursos+=" and curso.nivel="+nivel_id;
		Query<Curso> querycursos=sessionFactory.getCurrentSession().createQuery(queryCursos);
		Date d=new Date();
		String dateformat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateformat);
		querycursos.setParameter("fechaHoy", sdf.format(d));
		listaCursos=querycursos.getResultList();
		return listaCursos;
	}
	@Override
	public void saveCurso(CursoGenerico curso) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(curso);
	}
	@Override
	public CursoGenerico mergeCurso(CursoGenerico curso)
	{
		return (CursoGenerico) sessionFactory.getCurrentSession().merge(curso);
	}
	@Override
	public ListadoPaginado<Curso> listarCursos(List<Criterio> criterios,int firstResult,int maxResults) throws NoSuchMethodException, SecurityException
	{
		ListadoPaginado<Curso> listaCursos=new ListadoPaginado<Curso>();
		// Usemos la API de Hibernate.
		// Por cada item sacado de la lista, pedimos un criterio de Hibernate.
		Iterator<Criterio> iterator=criterios.iterator();
		Session session=sessionFactory.getCurrentSession();
		CriteriaBuilder cb=session.getCriteriaBuilder();
		CriteriaQuery<Curso> criteriosQuery=cb.createQuery(Curso.class);
		Root<Curso> raiz=criteriosQuery.from(Curso.class);
		criteriosQuery.select(raiz);
		// Hasta 10 predicados vamos a aguantar.
		int maxPredicados=10;
		int predicado=0;
		List<Predicate> predicados=new LinkedList<Predicate>();
		while(iterator.hasNext() && predicado<maxPredicados)
		{
			Criterio c=iterator.next();
			switch(c.getCampo())
			{
			case "vigente":
				// Hay que construir predicados
				predicados.add(CursoVigente.criteriosVigencia(raiz, cb));
				break;
			default:
				switch(c.getOperador())
				{
				case "eq":
					// Operador de igualdad.
					predicados.add(cb.equal(raiz.get(c.getCampo()), c.getValor()));
				}
				break;
			}
			predicado++;
		}
		// Ya tengo una lista de predicados. Los asumo todos combinados con AND.
		// Ahora, si no me informan criterios, esto no hace falta.
		if(!criterios.isEmpty())
			criteriosQuery.where(cb.and(predicados.toArray(new Predicate[0])));
		// Primero obtengo el numero de registros total!!!
		ScrollableResults r=session.createQuery(criteriosQuery).scroll();
		r.last();
		int totalRegistros=r.getRowNumber()+1;
		r.close();
		Query<Curso> q=session.createQuery(criteriosQuery);
		q.setFirstResult(firstResult);
		q.setMaxResults(maxResults);
		listaCursos.setData(q.getResultList());
		listaCursos.setTotal_registros(totalRegistros);
		return listaCursos;
	}
}
