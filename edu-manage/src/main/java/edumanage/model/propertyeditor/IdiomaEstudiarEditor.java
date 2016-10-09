package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.IdiomaEstudiar;
import edumanage.service.IdiomaEstudiarService;

public class IdiomaEstudiarEditor extends PropertyEditorSupport
{
	private final IdiomaEstudiarService idiomaEstudiarService;
	
	public IdiomaEstudiarEditor(IdiomaEstudiarService service)
	{
		this.idiomaEstudiarService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		IdiomaEstudiar idioma = idiomaEstudiarService.getById(Long.parseLong(text));
        setValue(idioma);
	}

}
