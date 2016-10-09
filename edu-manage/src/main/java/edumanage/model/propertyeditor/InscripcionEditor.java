package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Inscripcion;
import edumanage.service.InscripcionService;

public class InscripcionEditor extends PropertyEditorSupport
{
	private final InscripcionService inscripcionService;
	
	public InscripcionEditor(InscripcionService service)
	{
		this.inscripcionService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		Inscripcion inscripcion= inscripcionService.getById(Long.parseLong(text));
        setValue(inscripcion);
	}

}
