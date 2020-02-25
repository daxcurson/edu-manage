package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.ComoSupoInexistente;
import ar.com.strellis.edumanage.model.ComoSupo;
import ar.com.strellis.edumanage.service.ComoSupoService;

public class ComoSupoEditor extends PropertyEditorSupport
{
	private final ComoSupoService comoSupoService;
	
	public ComoSupoEditor(ComoSupoService service)
	{
		this.comoSupoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		ComoSupo como;
		try {
			como = comoSupoService.getById(Long.parseLong(text));
			setValue(como);
		} catch (ComoSupoInexistente e) {
			e.printStackTrace();
			throw new IllegalArgumentException("ComoSupo inexistente");
		}
	}

}
