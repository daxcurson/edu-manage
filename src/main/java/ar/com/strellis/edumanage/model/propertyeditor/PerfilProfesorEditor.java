package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.PerfilProfesorInexistenteException;
import ar.com.strellis.edumanage.model.PerfilProfesor;
import ar.com.strellis.edumanage.service.ProfesorService;

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
		PerfilProfesor perfil;
		try {
			perfil = profesorService.getPerfilById(Long.parseLong(text));
			setValue(perfil);
		} catch (PerfilProfesorInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Profesor inexistente");
		}
	}
}
