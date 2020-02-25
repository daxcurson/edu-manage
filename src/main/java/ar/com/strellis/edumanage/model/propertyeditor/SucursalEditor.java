package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.SucursalInexistenteException;
import ar.com.strellis.edumanage.model.Sucursal;
import ar.com.strellis.edumanage.service.SucursalService;

public class SucursalEditor extends PropertyEditorSupport {
	 
    private final SucursalService sucursalService;
 
    public SucursalEditor(SucursalService sucursalService) {
        this.sucursalService = sucursalService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(!text.isEmpty())
		{
			Sucursal sucursal;
			try {
				sucursal = sucursalService.getById(Long.parseLong(text));
				setValue(sucursal);
			} catch (SucursalInexistenteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new IllegalArgumentException("Sucursal inexistente");
			}
		}
	}
 
}