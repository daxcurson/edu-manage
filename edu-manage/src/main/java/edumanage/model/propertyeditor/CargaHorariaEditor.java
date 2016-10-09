package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.*;
import edumanage.service.*;

public class CargaHorariaEditor extends PropertyEditorSupport
{
	private final CargaHorariaService cargaHorariaService;
	
	public CargaHorariaEditor(CargaHorariaService service)
	{
		this.cargaHorariaService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		CargaHoraria carga = cargaHorariaService.getById(Long.parseLong(text));
        setValue(carga);
	}

}
