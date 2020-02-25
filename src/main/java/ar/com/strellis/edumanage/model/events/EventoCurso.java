package ar.com.strellis.edumanage.model.events;

import org.springframework.context.ApplicationEvent;

public class EventoCurso extends ApplicationEvent
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7799592361143561243L;

	public EventoCurso(Object source) 
	{
		super(source);
	}
}
