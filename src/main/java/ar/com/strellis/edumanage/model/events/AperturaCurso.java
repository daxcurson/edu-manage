package ar.com.strellis.edumanage.model.events;

import org.springframework.context.ApplicationEvent;

public class AperturaCurso extends ApplicationEvent
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4826708795059858324L;

	public AperturaCurso(Object source) 
	{
		super(source);
	}
}
