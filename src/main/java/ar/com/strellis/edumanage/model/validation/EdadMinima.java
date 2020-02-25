package ar.com.strellis.edumanage.model.validation;

import java.lang.annotation.*;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy=EdadMinimaValidator.class)
@Target({ElementType.METHOD,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EdadMinima 
{
	int valor();
	String message() default "{EdadMinima}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default{};
}
