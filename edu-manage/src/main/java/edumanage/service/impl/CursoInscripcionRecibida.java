package edumanage.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import edumanage.model.CursoGenerico;
import edumanage.model.Inscripcion;
import edumanage.model.eventos.InscripcionRecibida;
import edumanage.service.CursoService;

/**
 * Captura eventos de inscripcion recibida. Realiza acciones de acuerdo a la cantidad
 * de personas.
 * @author daxcurson
 *
 */
@Component
public class CursoInscripcionRecibida implements ApplicationListener<InscripcionRecibida>
{
	static Logger log = Logger.getLogger(CursoInscripcionRecibida.class);
	@Autowired
	private CursoService cursoService;

	@Override
	/**
	 * Recibe un evento de inscripcion y realiza acciones sobre un curso. 
	 */
	public void onApplicationEvent(InscripcionRecibida inscRecibida)
	{
		log.trace("Capture el evento Inscripcion Recibida!!!");
		Inscripcion insc=(Inscripcion) inscRecibida.getSource();
		CursoGenerico curso=insc.getCurso();
		cursoService.recibirInscripto(curso, insc);
	}
}
