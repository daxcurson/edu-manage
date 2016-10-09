package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Sucursal;
import edumanage.service.SucursalService;

public class SucursalEditor extends PropertyEditorSupport {
	 
    private final SucursalService sucursalService;
 
    public SucursalEditor(SucursalService sucursalService) {
        this.sucursalService = sucursalService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(!text.isEmpty())
		{
			Sucursal sucursal = sucursalService.getById(Long.parseLong(text));
			setValue(sucursal);
		}
	}
 
}