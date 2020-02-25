package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.MonedaInexistenteException;
import ar.com.strellis.edumanage.model.Moneda;
import ar.com.strellis.edumanage.service.MonedaService;

public class MonedaEditor extends PropertyEditorSupport 
{
    private final MonedaService monedaService;
 
    public MonedaEditor(MonedaService monedaService) 
    {
        this.monedaService = monedaService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		Moneda moneda;
		try {
			moneda = monedaService.getById(Long.parseLong(text));
			setValue(moneda);
		} catch (MonedaInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Moneda inexistente");
		}
	}
 
}
