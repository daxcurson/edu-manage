package ar.com.strellis.edumanage.documentation;

import java.lang.annotation.*;

/**
 * Define una custom annotation llamada descripcion, que va a describir brevemente
 * lo que hace el metodo descripto. Esto se va a usar para despues leerlo en la
 * pantalla de permisos, y va a representar el nombre del permiso que se debe
 * otorgar.
 * @author daxcurson
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Descripcion 
{
	String value() ;
	String permission();
}
