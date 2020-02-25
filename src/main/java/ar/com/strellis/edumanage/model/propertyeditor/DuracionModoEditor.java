package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.DuracionModoInexistenteException;
import ar.com.strellis.edumanage.model.*;
import ar.com.strellis.edumanage.service.*;

public class DuracionModoEditor extends PropertyEditorSupport
{
	private final DuracionModoService duracionModoService;
	
	public DuracionModoEditor(DuracionModoService service)
	{
		this.duracionModoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		DuracionModo duracion;
		try {
			duracion = duracionModoService.getById(Long.parseLong(text));
			setValue(duracion);
		} catch (DuracionModoInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("DuracionModo inexistente");
		}
	}

}
