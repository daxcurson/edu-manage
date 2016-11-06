package edumanage.dao.hibernate;

import java.util.List;



//import org.hibernate.Hibernate;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.ModalidadCursoDAO;
import edumanage.model.ModalidadCurso;
import edumanage.model.ModalidadDisponible;

@Repository
public class ModalidadCursoDAOImpl implements ModalidadCursoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	private String queryModalidadesPorIdiomaTipo=
			"select modalidad " +
			"from ModalidadCurso as modalidad join modalidad.idiomas_asignados as idioma_e where idioma_e.id=:idioma " +
			"and modalidad.carga_horaria.tipo_curso.id=:tipo_curso";
	@Override
	public ModalidadCurso getById(long id) 
	{
		return (ModalidadCurso)sessionFactory.getCurrentSession().createQuery("from ModalidadCurso where id="+id).getSingleResult();
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<ModalidadCurso> listarModalidadesCurso() 
	{
		return (List<ModalidadCurso>) sessionFactory.getCurrentSession().createQuery("from ModalidadCurso").getResultList();
	}
	@Override
	public void addModalidadCurso(ModalidadCurso modalidad_curso) 
	{
		sessionFactory.getCurrentSession().save(modalidad_curso);
	}
	@Override
	public void edit(ModalidadCurso modalidad_curso) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(modalidad_curso);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ModalidadCurso> listarModalidadesCursoPorIdiomaTipo(int idioma_estudiar_id, int tipo_curso_id) 
	{
		Query<ModalidadCurso> queryModalidades=sessionFactory.getCurrentSession().createQuery(this.queryModalidadesPorIdiomaTipo);
		queryModalidades.setParameter("idioma", idioma_estudiar_id);
		queryModalidades.setParameter("tipo_curso", tipo_curso_id);
		return queryModalidades.getResultList();
	}
	@Override
	public ModalidadDisponible grabarModalidadDisponible(ModalidadDisponible m) 
	{
		sessionFactory.getCurrentSession().save(m);
		return m;
	}
	@Override
	public ModalidadDisponible getModalidadDisponibleById(long id) 
	{
		ModalidadDisponible m=(ModalidadDisponible) sessionFactory.getCurrentSession().load(ModalidadDisponible.class, id);
		return m;
	}
}
