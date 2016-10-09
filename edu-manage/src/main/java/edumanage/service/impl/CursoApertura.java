package edumanage.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import edumanage.model.CursoGenerico;
import edumanage.model.eventos.AperturaCurso;
import edumanage.service.CursoService;

/**
 * Reacciona ante los eventos de apertura de curso.
 * @author daxcurson
 *
 */
@Component
public class CursoApertura implements ApplicationListener<AperturaCurso>
{
	static Logger log = Logger.getLogger(CursoApertura.class);

	@Autowired
	private CursoService cursoService;
	@Override
	/**
	 * Cuando se abre un curso, hay que informar al servicio de cursos que tiene
	 * que realizar las operaciones de apertura.
	 */
	public void onApplicationEvent(AperturaCurso event) 
	{
		log.trace("Capture el evento AperturaCurso! Voy a hacer la apertura.");
		CursoGenerico curso=(CursoGenerico) event.getSource();
		cursoService.realizarAperturaCurso(curso);
	}
}
