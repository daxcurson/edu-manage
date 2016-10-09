package edumanage.model;

import javax.validation.*;
import javax.validation.constraints.AssertTrue;
import edumanage.model.validacion.*;
import org.hibernate.validator.group.GroupSequenceProvider;

/**
 * Agrupa una persona, una inscripcion grupal y una individual, porque el formulario
 * de inscripcion es bastante complejo y tiene que tener la capacidad de guardar todas
 * estas entidades por separado.
 * @author daxcurson
 *
 */
@GroupSequenceProvider(ModeloFormInscripcionSequenceProvider.class)
public class ModeloFormInscripcion
{
	@Valid
	private Persona persona;
	@Valid
	private InscripcionGrupal inscripcionGrupal;
	@Valid
	private InscripcionIndividual inscripcionIndividual;
	
	@AssertTrue
	private boolean aceptoTerminos;
	
	public ModeloFormInscripcion()
	{
		// Por ahora nada...
	}
	public ModeloFormInscripcion(Persona p,InscripcionGrupal g, InscripcionIndividual i)
	{
		setPersona(p);
		setInscripcionGrupal(g);
		setInscripcionIndividual(i);
	}
	public Inscripcion getInscripcion()
	{
		// tiene que devolver ambos tipos de inscripciones. Eso lo logramos
		// preguntando el valor del campo tipo de inscripcion. 
		if(inscripcionGrupal.getCurso()!=null && inscripcionGrupal.getCurso().getTipo_curso().getDescripcion().equals("Grupal"))
			return inscripcionGrupal;
		else
			return inscripcionIndividual;
	}
	/**
	 * @return the persona
	 */
	public Persona getPersona() 
	{
		return persona;
	}
	/**
	 * @param persona the persona to set
	 */
	public void setPersona(Persona persona) 
	{
		this.persona = persona;
	}
	/**
	 * @return the inscripcionGrupal
	 */
	public InscripcionGrupal getInscripcionGrupal() 
	{
		return inscripcionGrupal;
	}
	/**
	 * @param inscripcionGrupal the inscripcionGrupal to set
	 */
	public void setInscripcionGrupal(InscripcionGrupal inscripcionGrupal) 
	{
		this.inscripcionGrupal = inscripcionGrupal;
	}
	/**
	 * @return the inscripcionIndividual
	 */
	public InscripcionIndividual getInscripcionIndividual() 
	{
		return inscripcionIndividual;
	}
	/**
	 * @param inscripcionIndividual the inscripcionIndividual to set
	 */
	public void setInscripcionIndividual(InscripcionIndividual inscripcionIndividual) 
	{
		this.inscripcionIndividual = inscripcionIndividual;
	}
	public boolean isAceptoTerminos() {
		return aceptoTerminos;
	}
	public void setAceptoTerminos(boolean aceptoTerminos) {
		this.aceptoTerminos = aceptoTerminos;
	}
}