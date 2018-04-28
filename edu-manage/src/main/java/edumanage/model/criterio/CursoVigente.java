package edumanage.model.criterio;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import edumanage.model.Curso;
import edumanage.model.CursoAbierto;
import edumanage.model.CursoGenerico;

/**
 * Define el criterio para determinar si un curso esta vigente.
 * 
 * Un curso esta vigente si a la fecha de hoy tiene el estado Abierto,
 * la fecha de comienzo es igual o menor a la de hoy, la fecha de fin es igual o mayor a la de hoy,
 * no fue dado de baja, o si lo fue, esta baja es despues de hoy
 * @author Agustín Villafañe
 *
 */
public class CursoVigente
{
	public static boolean estaVigente(CursoGenerico cursoGenerico)
	{
		Date hoy=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(
				cursoGenerico.getAbierto().equals(new CursoAbierto()) &&
				(cursoGenerico.getFecha_comienzo().before(hoy) || sdf.format(cursoGenerico.getFecha_comienzo()).equals(sdf.format(hoy))) &&
				(cursoGenerico.getFecha_fin().after(hoy) || sdf.format(cursoGenerico.getFecha_fin()).equals(sdf.format(hoy)) ) &&
				(cursoGenerico.getBaja()==0 || (cursoGenerico.getFecha_baja().after(hoy) || sdf.format(cursoGenerico.getFecha_baja()).equals(sdf.format(hoy))))
		)
		{
			return true;
		}
		return false;
	}
	public static Predicate criteriosVigencia(Root<Curso> raiz,CriteriaBuilder cb) throws NoSuchMethodException, SecurityException
	{
		Date hoy=new Date();
		// Convertimos los requerimientos de arriba en condiciones solamente de Hibernate.
		Predicate p1=cb.equal(raiz.get("abierto"), new CursoAbierto().nombre);
		Predicate p2=cb.lessThanOrEqualTo(raiz.get("fecha_comienzo"),cb.literal(hoy));
		Predicate p3=cb.greaterThanOrEqualTo(raiz.get("fecha_fin"),cb.literal(hoy));
		Predicate p4=cb.or(cb.equal(raiz.get("baja"), "0"),cb.greaterThanOrEqualTo(raiz.get("fecha_baja"),cb.literal(hoy)));
		return cb.and(p1,p2,p3,p4);
	}
}
