package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.*;
import edumanage.service.*;

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
		DuracionModo duracion= duracionModoService.getById(Long.parseLong(text));
        setValue(duracion);
	}

}
