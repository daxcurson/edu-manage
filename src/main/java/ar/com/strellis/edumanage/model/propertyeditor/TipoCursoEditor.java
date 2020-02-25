package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.TipoCursoInexistenteException;
import ar.com.strellis.edumanage.model.TipoCurso;
import ar.com.strellis.edumanage.service.TipoCursoService;

public class TipoCursoEditor extends PropertyEditorSupport 
{
    private final TipoCursoService tipoCursoService;
    
    public TipoCursoEditor(TipoCursoService tipoCursoService) {
        this.tipoCursoService = tipoCursoService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		TipoCurso tipoCurso;
		try {
			tipoCurso = tipoCursoService.getById(Long.parseLong(text));
			setValue(tipoCurso);
		} catch (TipoCursoInexistenteException e) {
			throw new IllegalArgumentException("Tipo curso inexistente");
		}
	}
}
