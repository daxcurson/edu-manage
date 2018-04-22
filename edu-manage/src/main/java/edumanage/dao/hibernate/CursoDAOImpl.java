package edumanage.dao.hibernate;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.*;
import edumanage.model.Curso;
import edumanage.model.CursoGenerico;

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
			"curso.idioma_estudiar=:idiomaEstudiarId and "+
			"curso.nivel=:nivelId and "+
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
	private String queryCursos="from Curso curso";
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
	public List<Curso> listarCursos()
	{
		List<Curso> listaCursos=null;
		String queryCursos=this.queryCursos;
		@SuppressWarnings("unchecked")
		Query<Curso> querycursos=sessionFactory.getCurrentSession().createQuery(queryCursos);
		listaCursos=querycursos.getResultList();
		return listaCursos;
	}
}
