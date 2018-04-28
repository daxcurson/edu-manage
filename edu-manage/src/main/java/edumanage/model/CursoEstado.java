package edumanage.model;

import javax.persistence.Transient;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import edumanage.excepciones.ExceptionEstadoCursoInvalido;

/**
 * Estado del curso. El metodo con nombre de evento devuelve el nuevo estado de curso
 * a aplicar, si corresponde.
 * @author daxcurson
 *
 */
public abstract class CursoEstado implements ApplicationEventPublisherAware
{
	static Logger log = Logger.getLogger(CursoEstado.class);
	public String nombre;
	@Transient
	public String descripcion;
	
	public CursoEstado()
	{
		log.trace("Estoy en el constructor de CursoEstado");
		// Descripcion por defecto: vacia.
		descripcion="";
	}
	@Transient
	protected ApplicationEventPublisher publisher;
	public String toString()
	{
		return descripcion;
	}
	@Override
	public void setApplicationEventPublisher(ApplicationEventPublisher publisher) 
	{
		this.publisher=publisher;
	}
	public abstract CursoEstado inscripcionRecibida(Inscripcion insc) throws ExceptionEstadoCursoInvalido;
	public abstract CursoEstado profesorAsignado(CursoGenerico curso,Profesor profesor);
	public abstract boolean equals(Object otro);
}
