package ar.com.strellis.edumanage.model.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.CursoBaja;

@Component
public class CursoValidator implements Validator
{

	@Override
	public boolean supports(Class<?> clazz) 
	{
		return Curso.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) 
	{
		Curso c=(Curso)target;
		if(c.getAbierto().equals(new CursoBaja()))
			errors.reject("No se puede asignar profesor a un curso dado de baja");
	}
}
