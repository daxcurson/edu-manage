package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Persona;
import edumanage.service.PersonaService;

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
		Persona persona = personaService.getById(Long.parseLong(text));
        setValue(persona);
	}

}
