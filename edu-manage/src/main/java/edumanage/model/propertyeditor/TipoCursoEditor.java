package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.TipoCurso;
import edumanage.service.TipoCursoService;

public class TipoCursoEditor extends PropertyEditorSupport 
{
    private final TipoCursoService tipoCursoService;
    
    public TipoCursoEditor(TipoCursoService tipoCursoService) {
        this.tipoCursoService = tipoCursoService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		TipoCurso tipoCurso = tipoCursoService.getById(Long.parseLong(text));
        setValue(tipoCurso);
	}
}
