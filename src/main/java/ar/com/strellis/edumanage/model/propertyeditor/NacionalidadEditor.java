package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.NacionalidadInexistenteException;
import ar.com.strellis.edumanage.model.Nacionalidad;
import ar.com.strellis.edumanage.service.NacionalidadService;

public class NacionalidadEditor extends PropertyEditorSupport 
{

	private final NacionalidadService nacionalidadService;
	
	public NacionalidadEditor(NacionalidadService n)
	{
		this.nacionalidadService=n;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Nacionalidad nacionalidad;
		try {
			nacionalidad = nacionalidadService.getById(Long.parseLong(text));
			setValue(nacionalidad);
		} catch (NacionalidadInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Nacionalidad inexistente");
		}

	}

}
