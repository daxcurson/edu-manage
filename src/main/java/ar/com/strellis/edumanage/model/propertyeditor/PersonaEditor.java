package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.PersonaInexistenteException;
import ar.com.strellis.edumanage.model.Persona;
import ar.com.strellis.edumanage.service.PersonaService;

public class PersonaEditor extends PropertyEditorSupport
{
	private final PersonaService personaService;
	
	public PersonaEditor(PersonaService service)
	{
		this.personaService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		Persona persona;
		try {
			persona = personaService.getById(Long.parseLong(text));
			setValue(persona);
		} catch (PersonaInexistenteException e) {
			e.printStackTrace();
			throw new IllegalArgumentException("Persona inexistente");
		}
	}

}
