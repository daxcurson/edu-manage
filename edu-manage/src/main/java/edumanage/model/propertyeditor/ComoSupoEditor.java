package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.ComoSupo;
import edumanage.service.ComoSupoService;

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
		ComoSupo como= comoSupoService.getById(Long.parseLong(text));
        setValue(como);
	}

}
