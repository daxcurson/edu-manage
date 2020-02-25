package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.HorarioCursoInexistente;
import ar.com.strellis.edumanage.model.HorarioCurso;
import ar.com.strellis.edumanage.service.HorarioCursoService;

public class HorarioCursoEditor extends PropertyEditorSupport
{
	private final HorarioCursoService horarioCursoService;
	
	public HorarioCursoEditor(HorarioCursoService service)
	{
		this.horarioCursoService=service;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		HorarioCurso modalidad;
		try {
			modalidad = horarioCursoService.getById(Long.parseLong(text));
			setValue(modalidad);
		} catch (HorarioCursoInexistente e) {
			e.printStackTrace();
			throw new IllegalArgumentException("HorarioCurso inexistente");
		}
	}

}
