package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.model.Orientacion;
import ar.com.strellis.edumanage.service.OrientacionService;
import ar.com.strellis.edumanage.service.impl.OrientacionInexistenteException;

public class OrientacionEditor extends PropertyEditorSupport 
{
    private final OrientacionService orientacionService;
    public OrientacionEditor(OrientacionService o)
    {
    	orientacionService=o;
    }
	@Override
	public void setAsText(String arg0) throws IllegalArgumentException {
		Orientacion orientacion;
		try {
			orientacion = orientacionService.getById(Long.parseLong(arg0));
			setValue(orientacion);
		} catch (OrientacionInexistenteException e) {
			e.printStackTrace();
			throw new IllegalArgumentException("Orientacion Inexistente");
		}
	}

}
