package ar.com.strellis.edumanage.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import ar.com.strellis.edumanage.model.CursoGenerico;
import ar.com.strellis.edumanage.model.events.AperturaCurso;
import ar.com.strellis.edumanage.service.CursoService;

/**
 * Reacciona ante los eventos de apertura de curso.
 * @author daxcurson
 *
 */
@Component
public class CursoApertura implements ApplicationListener<AperturaCurso>
{
	static Logger log = LogManager.getLogger(CursoApertura.class);

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
