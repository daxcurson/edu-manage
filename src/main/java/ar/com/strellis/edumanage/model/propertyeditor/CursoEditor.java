package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.CursoInexistenteException;
import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.service.CursoService;

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
		Curso curso;
		try {
			curso = cursoService.getById(Long.parseLong(text));
			setValue(curso);
		} catch (CursoInexistenteException e) {
			e.printStackTrace();
			throw new IllegalArgumentException("Curso inexistente");
		}
	}

}
