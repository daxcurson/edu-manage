package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Orientacion;
import edumanage.service.OrientacionService;

public class OrientacionEditor extends PropertyEditorSupport 
{
    private final OrientacionService orientacionService;
    public OrientacionEditor(OrientacionService o)
    {
    	orientacionService=o;
    }
	@Override
	public void setAsText(String arg0) throws IllegalArgumentException {
		Orientacion orientacion= orientacionService.getById(Long.parseLong(arg0));
        setValue(orientacion);
	}

}
