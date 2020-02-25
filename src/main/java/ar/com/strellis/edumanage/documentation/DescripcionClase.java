package ar.com.strellis.edumanage.documentation;

import java.lang.annotation.*;

/**
 * Una custom annotation que se usa para describir brevemente la clase.
 * La voy a usar para los controllers, para luego leerla en la pantalla de permisos
 * y en vez de poner el nombre feo del controller, voy a poner el nombre
 * humano del valor de la Annotation.
 * @author daxcurson
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface DescripcionClase 
{
	String value() default "Clase no especificada";
}
