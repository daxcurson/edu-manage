package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.IdiomaNativo;
import edumanage.service.IdiomaNativoService;

public class IdiomaNativoEditor extends PropertyEditorSupport
{
	private final IdiomaNativoService idiomaNativoService;
	
	public IdiomaNativoEditor(IdiomaNativoService service)
	{
		this.idiomaNativoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		IdiomaNativo idioma = idiomaNativoService.getById(Long.parseLong(text));
        setValue(idioma);
	}

}
