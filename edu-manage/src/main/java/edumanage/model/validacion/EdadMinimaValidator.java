package edumanage.model.validacion;

import java.util.Calendar;
import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EdadMinimaValidator implements ConstraintValidator<EdadMinima,Date>
{
	private int edadMinima;
	@Override
	public void initialize(EdadMinima edad) 
	{
		this.edadMinima=edad.valor();
	}
	@Override
	public boolean isValid(Date target,ConstraintValidatorContext ctx)
	{
		if(target==null)
			return true;
		Calendar c=Calendar.getInstance();
		c.setTime(target);
		int ano=c.get(Calendar.YEAR);
		// la this.edadMinima es el valor que la diferencia entre
		// el ano actual y el ano de la fecha target debe superar!
		Calendar calendarioHoy=Calendar.getInstance();
		int anoHoy=calendarioHoy.get(Calendar.YEAR);
		return (anoHoy-ano)>=this.edadMinima;
	}
}
