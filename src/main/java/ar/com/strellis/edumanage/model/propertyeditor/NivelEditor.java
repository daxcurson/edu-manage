package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import ar.com.strellis.edumanage.exceptions.NivelInexistenteException;
import ar.com.strellis.edumanage.model.Nivel;
import ar.com.strellis.edumanage.service.NivelService;

public class NivelEditor extends PropertyEditorSupport {
	 
    private final NivelService nivelService;
 
    public NivelEditor(NivelService nivelService) {
        this.nivelService = nivelService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Nivel nivel;
		try {
			nivel = nivelService.getById(Long.parseLong(text));
			setValue(nivel);
		} catch (NivelInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException("Nivel inexistente");
		}
	}
 
}