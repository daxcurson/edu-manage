package edumanage.model.criterio;

import java.text.SimpleDateFormat;
import java.util.Date;

import edumanage.model.Curso;
import edumanage.model.CursoAbierto;

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
	public static boolean estaVigente(Curso curso)
	{
		Date hoy=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(
				curso.getAbierto().equals(new CursoAbierto()) &&
				(curso.getFecha_comienzo().before(hoy) || sdf.format(curso.getFecha_comienzo()).equals(sdf.format(hoy))) &&
				(curso.getFecha_fin().after(hoy) || sdf.format(curso.getFecha_fin()).equals(sdf.format(hoy)) ) &&
				(curso.getBaja()==0 || (curso.getFecha_baja().after(hoy) || sdf.format(curso.getFecha_baja()).equals(sdf.format(hoy))))
		)
		{
			return true;
		}
		return false;
	}
}
