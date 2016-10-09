package edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;

import edumanage.model.Nivel;
import edumanage.service.NivelService;

public class NivelEditor extends PropertyEditorSupport {
	 
    private final NivelService nivelService;
 
    public NivelEditor(NivelService nivelService) {
        this.nivelService = nivelService;
    }
 
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Nivel nivel = nivelService.getById(Long.parseLong(text));
        setValue(nivel);
	}
 
}