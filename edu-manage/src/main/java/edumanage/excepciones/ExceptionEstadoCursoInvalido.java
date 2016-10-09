package edumanage.excepciones;

/**
 * Arrojada cuando se intenta hacer una operacion sobre un estado de curso donde esa
 * operacion no esta permitida.
 * @author daxcurson
 *
 */
public class ExceptionEstadoCursoInvalido extends RuntimeException
{

	public ExceptionEstadoCursoInvalido(String mensaje) 
	{
		super(mensaje);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 5418599280016307109L;

}
