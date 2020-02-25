package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.service.IdiomaEstudiarService;

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
		// si text viene en blanco o es cero, evitar hacer esta busqueda.
		if(text==null || text.equals("") || Integer.parseInt(text)==0)
			setValue(null);
		else
		{
			IdiomaEstudiar idioma;
			try {
				idioma = idiomaEstudiarService.getById(Long.parseLong(text));
				setValue(idioma);
			} catch (IdiomaEstudiarInexistente e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new IllegalArgumentException("IdiomaEstudiar inexistente");
			}
		}
	}

}
