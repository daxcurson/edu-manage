package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.ModalidadPagoInexistenteException;
import ar.com.strellis.edumanage.model.ModalidadPago;
import ar.com.strellis.edumanage.service.ModalidadPagoService;

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
		ModalidadPago modalidad;
		try {
			modalidad = modalidadService.getById(Long.parseLong(text));
			setValue(modalidad);
		} catch (ModalidadPagoInexistenteException e) {
			e.printStackTrace();
			throw new IllegalArgumentException("ModalidadPago inexistente");
		}
	}
 
}
