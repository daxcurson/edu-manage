package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.PersonaEstado;
import edumanage.service.EstadoEstudianteService;

public class EstadoEstudianteEditor extends PropertyEditorSupport
{
	private final EstadoEstudianteService estadoEstudianteService;
	
	public EstadoEstudianteEditor(EstadoEstudianteService service)
	{
		this.estadoEstudianteService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		PersonaEstado estado= estadoEstudianteService.getById(Long.parseLong(text));
        setValue(estado);
	}

}
