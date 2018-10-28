package edumanage.dao.hibernate;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.ClaseDAO;
import edumanage.model.Clase;
import edumanage.model.HorarioCurso;

@Repository
public class ClaseDAOImpl implements ClaseDAO 
{
	private final String queryClasesSuperpuestas="from Clase where Clase.Profesor.id=:profesorClase and "
			+ "("
			+ "(Clase.hora_fin > :horaComienzoClase and Clase.hora_fin <= :horaFinClase)"
			+ "or (Clase.hora_comienzo >= :horaComienzoClase and Clase.hora_comienzo < :horaFinClase)"
			+ "or (Clase.hora_comienzo  <= :horaComienzoClase and Clase.hora_fin >= :horaFinClase)"
			+ ")";
	
	private final String queryClaseSuperpuestaEnDiaSemana="from Clase where "
			+ "extract(dow from timestamp fecha_clase)=:diaSemana "
			+ "and Clase.fecha_clase >= :fechaDesde "
			+ "and Clase.fecha_clase <= :fechaHasta "
			+ "and Clase.Profesor.id=:profesorClase "
			+ "and ("
			+ "(Clase.hora_fin > :horaComienzoClase and Clase.hora_fin <= :horaFinClase)"
			+ "or (Clase.hora_comienzo >= :horaComienzoClase and Clase.hora_comienzo < :horaFinClase)"
			+ "or (Clase.hora_comienzo  <= :horaComienzoClase and Clase.hora_fin >= :horaFinClase)"
			+ ")";
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Clase getById(long id) 
	{
		return (Clase) sessionFactory.getCurrentSession().createQuery("from Clase where id="+id).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Clase> getClasesSuperpuestas(Clase clase) 
	{
		Query<Clase> querySuperpuestas=sessionFactory.getCurrentSession().createQuery(this.queryClasesSuperpuestas);
		LocalTime time=clase.getHora_comienzo();
		Instant i=time.atDate(LocalDate.of(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH))).atZone(ZoneId.systemDefault()).toInstant();
		querySuperpuestas.setParameter("horaComienzoClase",Date.from(i));
		time=clase.getHora_fin();
		i=time.atDate(LocalDate.of(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH))).atZone(ZoneId.systemDefault()).toInstant();
		querySuperpuestas.setParameter("horaFinClase", Date.from(i));
		querySuperpuestas.setParameter("profesorClase", clase.getProfesor().getId());
		return (List<Clase>) querySuperpuestas.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Clase> getClasesSuperpuestas(HorarioCurso horario)
	{
		Query<Clase> clases=sessionFactory.getCurrentSession().createQuery(this.queryClaseSuperpuestaEnDiaSemana);
		// Convertimos de palabra dia de semana a numero. 0 es domingo.
		int dia_semana=0; // Domingo
		switch(horario.getDia_semana())
		{
		case "Monday":
			dia_semana=1;break;
		case "Tuesday":
			dia_semana=2;break;
		case "Wednesday":
			dia_semana=3;break;
		case "Thursday":
			dia_semana=4;break;
		case "Friday":
			dia_semana=5;break;
		case "Saturday":
			dia_semana=6;break;
		}
		clases.setParameter("diaSemana", dia_semana);
		clases.setParameter("profesorClase", horario.getProfesor().getId());
		clases.setParameter("fechaDesde", horario.getFecha_desde());
		clases.setParameter("fechaHasta", horario.getFecha_hasta());
		DateTimeFormatter format=DateTimeFormatter.ofPattern("HH:mm");
		clases.setParameter("horaComienzoClase",horario.getHora_inicio().format(format) );
		clases.setParameter("homraFinClase",horario.getHora_fin().format(format));
		// En el HorarioCurso viene el nombre del dia de la semana.
		return (List<Clase>) clases.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<Clase> getEntreFechas(String desde,String hasta)
	{
		String claseshoy="from Clase where Clase.fecha_clase>=:desde and Clase.fecha_clase<=:hasta";
		Query<Clase> clases=sessionFactory.getCurrentSession().createQuery(claseshoy);
		clases.setParameter("desde", desde);
		clases.setParameter("hasta", hasta);
		return (List<Clase>) clases.getResultList();
	}
}
