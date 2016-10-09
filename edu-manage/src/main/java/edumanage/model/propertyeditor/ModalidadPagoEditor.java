package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.ModalidadPago;
import edumanage.service.ModalidadPagoService;

public class ModalidadPagoEditor extends PropertyEditorSupport 
{
    private final ModalidadPagoService modalidadService;
 
    public ModalidadPagoEditor(ModalidadPagoService modalidadService) 
    {
        this.modalidadService = modalidadService;
    }
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		ModalidadPago modalidad = modalidadService.getById(Long.parseLong(text));
        setValue(modalidad);
	}
 
}
