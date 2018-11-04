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
		// Si el texto de la propiedad a comparar es en blanco, 
		// a la carga hay que darle el valor NULO, de lo contrario hay que 
		// ir a buscar el valor a la base de datos.
		CargaHoraria carga=null;
		if(text!=null && !text.equals("") && !text.equals("0"))
			carga = cargaHorariaService.getById(Long.parseLong(text));
        setValue(carga);
	}

}
