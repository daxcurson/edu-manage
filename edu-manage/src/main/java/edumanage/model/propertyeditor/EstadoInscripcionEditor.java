package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.EstadoInscripcion;
import edumanage.service.EstadoInscripcionService;

public class EstadoInscripcionEditor extends PropertyEditorSupport
{
	private final EstadoInscripcionService estadoInscripcionService;
	
	public EstadoInscripcionEditor(EstadoInscripcionService service)
	{
		this.estadoInscripcionService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		EstadoInscripcion estado = estadoInscripcionService.getById(Long.parseLong(text));
        setValue(estado);
	}

}
