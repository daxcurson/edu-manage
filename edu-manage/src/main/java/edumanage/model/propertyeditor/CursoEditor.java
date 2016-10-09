package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Curso;
import edumanage.service.CursoService;

public class CursoEditor extends PropertyEditorSupport
{
	private final CursoService cursoService;
	
	public CursoEditor(CursoService service)
	{
		this.cursoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		Curso curso = cursoService.getById(Long.parseLong(text));
        setValue(curso);
	}

}
