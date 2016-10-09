package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.PerfilProfesor;
import edumanage.service.ProfesorService;

public class PerfilProfesorEditor extends PropertyEditorSupport
{
	private final ProfesorService profesorService;
	
	public PerfilProfesorEditor(ProfesorService p)
	{
		this.profesorService=p;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException 
	{
		PerfilProfesor perfil= profesorService.getPerfilById(Long.parseLong(text));
        setValue(perfil);
	}
}
