package edumanage.model;

import javax.persistence.*;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.validator.constraints.*;

import edumanage.model.validacion.InscripcionIndividualChecks;

@Entity
@DiscriminatorValue("Individual")
@Audited
public class InscripcionIndividual extends Inscripcion 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int clases_semanales;
	private String horas_clase;
	@NotEmpty(groups=InscripcionIndividualChecks.class)
	private String dias_preferidos;
	private String dias_alternativos;
	@NotEmpty(groups=InscripcionIndividualChecks.class)
	private String horario_preferido;
	private String horario_alternativo;
	private String sexo_profesor;
	private String preferencia_idioma;
	private String materia;
	private String cual_examen;
	private String otra_orientacion;
	@ManyToOne
	@JoinColumn(name="idioma_estudiar_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private IdiomaEstudiar idioma_estudiar;
	@ManyToOne
	@JoinColumn(name="nivel_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Nivel nivel;
	@ManyToOne
	@JoinColumn(name="orientacion_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Orientacion orientacion;
	@ManyToOne
	@JoinColumn(name="profesor_posible_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Profesor profesorPosible;
	@ManyToOne
	@JoinColumn(name="sucursal_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Sucursal sucursal;
	
	public InscripcionIndividual()
	{
	}
	/**
	 * @return the clases_semanales
	 */
	public int getClases_semanales() {
		return clases_semanales;
	}
	/**
	 * @param clases_semanales the clases_semanales to set
	 */
	public void setClases_semanales(int clases_semanales) {
		this.clases_semanales = clases_semanales;
	}
	/**
	 * @return the horas_clase
	 */
	public String getHoras_clase() {
		return horas_clase;
	}
	/**
	 * @param horas_clase the horas_clase to set
	 */
	public void setHoras_clase(String horas_clase) {
		this.horas_clase = horas_clase;
	}
	/**
	 * @return the dias_preferidos
	 */
	public String getDias_preferidos() {
		return dias_preferidos;
	}
	/**
	 * @param dias_preferidos the dias_preferidos to set
	 */
	public void setDias_preferidos(String dias_preferidos) {
		this.dias_preferidos = dias_preferidos;
	}
	/**
	 * @return the dias_alternativos
	 */
	public String getDias_alternativos() {
		return dias_alternativos;
	}
	/**
	 * @param dias_alternativos the dias_alternativos to set
	 */
	public void setDias_alternativos(String dias_alternativos) {
		this.dias_alternativos = dias_alternativos;
	}
	/**
	 * @return the horario_preferido
	 */
	public String getHorario_preferido() {
		return horario_preferido;
	}
	/**
	 * @param horario_preferido the horario_preferido to set
	 */
	public void setHorario_preferido(String horario_preferido) {
		this.horario_preferido = horario_preferido;
	}
	/**
	 * @return the horario_alternativo
	 */
	public String getHorario_alternativo() {
		return horario_alternativo;
	}
	/**
	 * @param horario_alternativo the horario_alternativo to set
	 */
	public void setHorario_alternativo(String horario_alternativo) {
		this.horario_alternativo = horario_alternativo;
	}
	/**
	 * @return the sexo_profesor
	 */
	public String getSexo_profesor() {
		return sexo_profesor;
	}
	/**
	 * @param sexo_profesor the sexo_profesor to set
	 */
	public void setSexo_profesor(String sexo_profesor) {
		this.sexo_profesor = sexo_profesor;
	}
	/**
	 * @return the preferencia_idioma
	 */
	public String getPreferencia_idioma() {
		return preferencia_idioma;
	}
	/**
	 * @param preferencia_idioma the preferencia_idioma to set
	 */
	public void setPreferencia_idioma(String preferencia_idioma) {
		this.preferencia_idioma = preferencia_idioma;
	}
	/**
	 * @return the idiomaEstudiar
	 */
	public IdiomaEstudiar getIdioma_estudiar() {
		return idioma_estudiar;
	}
	/**
	 * @param idiomaEstudiar the idiomaEstudiar to set
	 */
	public void setIdioma_estudiar(IdiomaEstudiar idiomaEstudiar) {
		this.idioma_estudiar = idiomaEstudiar;
	}
	/**
	 * @return the nivel
	 */
	public Nivel getNivel() {
		return nivel;
	}
	/**
	 * @param nivel the nivel to set
	 */
	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}
	/**
	 * @return the orientacion
	 */
	public Orientacion getOrientacion() {
		return orientacion;
	}
	/**
	 * @param orientacion the orientacion to set
	 */
	public void setOrientacion(Orientacion orientacion) {
		this.orientacion = orientacion;
	}
	/**
	 * @return the profesorPosible
	 */
	public Profesor getProfesorPosible() {
		return profesorPosible;
	}
	/**
	 * @param profesorPosible the profesorPosible to set
	 */
	public void setProfesorPosible(Profesor profesorPosible) {
		this.profesorPosible = profesorPosible;
	}
	public void setConfirmada(int c)
	{
		confirmada=c;
	}
	public int getConfirmada()
	{
		return confirmada;
	}
	/**
	 * @return the sucursal
	 */
	public Sucursal getSucursal() {
		return sucursal;
	}
	/**
	 * @param sucursal the sucursal to set
	 */
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	/**
	 * @return the materia
	 */
	public String getMateria() {
		return materia;
	}
	/**
	 * @param materia the materia to set
	 */
	public void setMateria(String materia) {
		this.materia = materia;
	}
	/**
	 * @return the cual_examen
	 */
	public String getCual_examen() {
		return cual_examen;
	}
	/**
	 * @param cual_examen the cual_examen to set
	 */
	public void setCual_examen(String cual_examen) {
		this.cual_examen = cual_examen;
	}
	/**
	 * @return the otra_orientacion
	 */
	public String getOtra_orientacion() {
		return otra_orientacion;
	}
	/**
	 * @param otra_orientacion the otra_orientacion to set
	 */
	public void setOtra_orientacion(String otra_orientacion) {
		this.otra_orientacion = otra_orientacion;
	}
	@Override
	public boolean esValida() 
	{
		return true;
	}
}
