package ar.com.strellis.edumanage.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import ar.com.strellis.edumanage.model.CursoGenerico;
import ar.com.strellis.edumanage.model.Inscripcion;
import ar.com.strellis.edumanage.model.events.InscripcionRecibida;
import ar.com.strellis.edumanage.service.CursoService;

/**
 * Captura eventos de inscripcion recibida. Realiza acciones de acuerdo a la cantidad
 * de personas.
 * @author daxcurson
 *
 */
@Component
public class CursoInscripcionRecibida implements ApplicationListener<InscripcionRecibida>
{
	static Logger log = LogManager.getLogger(CursoInscripcionRecibida.class);
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
