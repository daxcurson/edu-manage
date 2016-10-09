package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Nacionalidad;
import edumanage.service.NacionalidadService;

public class NacionalidadEditor extends PropertyEditorSupport 
{

	private final NacionalidadService nacionalidadService;
	
	public NacionalidadEditor(NacionalidadService n)
	{
		this.nacionalidadService=n;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Nacionalidad nacionalidad = nacionalidadService.getById(Long.parseLong(text));
        setValue(nacionalidad);

	}

}
