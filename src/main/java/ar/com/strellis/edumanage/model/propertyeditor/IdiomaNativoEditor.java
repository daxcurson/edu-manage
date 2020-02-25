package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.IdiomaNativoInexistente;
import ar.com.strellis.edumanage.model.IdiomaNativo;
import ar.com.strellis.edumanage.service.IdiomaNativoService;

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
		IdiomaNativo idioma;
		try {
			idioma = idiomaNativoService.getById(Long.parseLong(text));
			setValue(idioma);
		} catch (IdiomaNativoInexistente e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Idioma nativo inexistente");
		}
	}

}
