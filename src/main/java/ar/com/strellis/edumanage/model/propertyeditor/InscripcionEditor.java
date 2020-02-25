package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.InscripcionInexistenteException;
import ar.com.strellis.edumanage.model.Inscripcion;
import ar.com.strellis.edumanage.service.InscripcionService;

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
		Inscripcion inscripcion;
		try {
			inscripcion = inscripcionService.getById(Long.parseLong(text));
			setValue(inscripcion);
		} catch (InscripcionInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Inscripcion Inexistente");
		}
	}

}
