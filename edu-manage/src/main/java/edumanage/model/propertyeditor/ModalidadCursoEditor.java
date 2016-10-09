package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.ModalidadCurso;
import edumanage.service.ModalidadCursoService;

public class ModalidadCursoEditor extends PropertyEditorSupport
{
	private final ModalidadCursoService modalidadCursoService;
	
	public ModalidadCursoEditor(ModalidadCursoService service)
	{
		this.modalidadCursoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		ModalidadCurso modalidad= modalidadCursoService.getById(Long.parseLong(text));
        setValue(modalidad);
	}

}
