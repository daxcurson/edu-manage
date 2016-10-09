package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Moneda;
import edumanage.service.MonedaService;

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
		Moneda moneda = monedaService.getById(Long.parseLong(text));
        setValue(moneda);
	}
 
}
