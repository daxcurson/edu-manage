package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.HorarioCurso;
import edumanage.service.HorarioCursoService;

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
		HorarioCurso modalidad= horarioCursoService.getById(Long.parseLong(text));
        setValue(modalidad);
	}

}
