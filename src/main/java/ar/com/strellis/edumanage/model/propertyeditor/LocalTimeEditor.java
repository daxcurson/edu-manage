package ar.com.strellis.edumanage.model.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.time.LocalTime;

import org.springframework.util.StringUtils;

public class LocalTimeEditor extends PropertyEditorSupport 
{
	private final boolean allowEmpty;

	public LocalTimeEditor( boolean allowEmpty) {
		this.allowEmpty = allowEmpty;
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (this.allowEmpty && !StringUtils.hasText(text)) {
			setValue(null);
		}
		else {
            setValue(LocalTime.parse(text));
        }
//        catch (ParseException ex) {
//            throw new IllegalArgumentException("Could not parse date: " + ex.getMessage(), ex);
//       }
    }

	@Override
	public String getAsText() {
		LocalTime value = LocalTime.parse(String.valueOf(getValue()));
		return (value != null ? value.toString() : "");
	}
}

