package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.ModalidadDisponible;
import edumanage.service.ModalidadCursoService;

public class ModalidadDisponibleEditor extends PropertyEditorSupport
{
	private final ModalidadCursoService modalidadCursoService;
	
	public ModalidadDisponibleEditor(ModalidadCursoService service)
	{
		this.modalidadCursoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		ModalidadDisponible modalidad=modalidadCursoService.leerModalidadDisponible(Long.parseLong(text));
        setValue(modalidad);
	}
}
