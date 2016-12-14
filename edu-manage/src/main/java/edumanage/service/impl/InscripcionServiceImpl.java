package edumanage.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.*;
import edumanage.model.*;
import edumanage.model.eventos.InscripcionRecibida;
import edumanage.service.InscripcionService;

@Service
public class InscripcionServiceImpl implements InscripcionService, ApplicationEventPublisherAware
{
	static Logger log = Logger.getLogger(InscripcionServiceImpl.class);
	
	@Autowired
	private InscripcionDAO inscripcionDAO;
	@Autowired
	private CursoDAO cursoDAO;
	@Autowired
	private EstadoInscripcionDAO estadoInscripcionDAO;
	@Autowired
	private PersonaDAO personaDAO;
	@Autowired
	private PersonaEstadoDAO estadoEstudianteDAO;
	private ApplicationEventPublisher publisher;
	
	@Override
	public Inscripcion getById(long id) 
	{
		Inscripcion inscripcion=inscripcionDAO.getById(id);
		
		return inscripcion;
	}

	@Override
	@Transactional
	public void grabar_inscripcion(Inscripcion insc,Persona persona) 
	{
		// Aca ademas de grabar, se realizan algunos cambios que tienen que ver con el negocio,
		// por ejemplo que si el curso ya esta abierto, la fecha de comienzo de cursada se pone
		// por defecto en la de comienzo del curso.
		// Voy a pedir el curso.
		// Una inscripcion individual no tiene curso asociado!
		insc.setPersona(persona);
		persona.setEstado(estadoEstudianteDAO.getById(4));
		personaDAO.save(persona);
		// Esto de aqui tiene sentido solamente para inscripcion grupal!!!
		if(insc.getClass().isAssignableFrom(InscripcionGrupal.class))
			log.trace("La inscripcion es de tipo '"+insc.getDiscriminatorValue()+"' y es para el curso "+insc.getCurso().getId()+", de codigo "+insc.getCurso().getCodigo_curso());
		if(insc.getDiscriminatorValue().equals("Grupal"))
		{
			CursoGenerico curso=cursoDAO.getById(insc.getCurso().getId());
			insc.setFecha_comienzo(curso.getFecha_comienzo());
			log.trace("Busque el curso de id "+curso.getId());
		}
		else
		{
			if(insc.getClass().isAssignableFrom(InscripcionGrupal.class))
				log.trace("El curso seleccionado en el form no es grupal. El curso es del tipo: "+insc.getDiscriminatorValue()+" y su ID es "+insc.getCurso().getId());
		}
		insc.setEstadoInscripcion(estadoInscripcionDAO.getByAbreviatura("N"));
		inscripcionDAO.grabarNueva(insc);
	}

	@Override
	public List<Inscripcion> listarInscripcionesAConfirmar() 
	{
		List<Inscripcion> lista=inscripcionDAO.listarInscripcionesAConfirmar();
		return lista;
	}

	@Override
	@Transactional
	/**
	 * Confirma la inscripcion en un curso.
	 */
	public void confirmar_inscripcion(Inscripcion insc) 
	{
		// Aca tenemos que disparar un evento para avisar que hay que ingresar un 
		// usuario nuevo en el curso!!
		log.trace("Voy a confirmar la inscripcion "+insc.getId());
		insc.setEstadoInscripcion(estadoInscripcionDAO.getByAbreviatura("C"));
		insc.setConfirmada(1);
		log.trace("Voy a grabarla");
		inscripcionDAO.grabar(insc);
		log.trace("Listo, la grabe");
		log.trace("Estoy por publicar un evento!");
		publisher.publishEvent(new InscripcionRecibida(insc));
		log.trace("Listo, lo publique");
	}

	@Override
	public void setApplicationEventPublisher(ApplicationEventPublisher publisher) 
	{
		this.publisher=publisher;
	}
}
