package edumanage.model;

import java.io.Serializable;
import java.util.*;

import javax.persistence.*;
import javax.validation.Valid;

import org.hibernate.envers.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import edumanage.model.validacion.InscripcionChecks;

@Entity
@Table(name="inscripciones")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="tipo",discriminatorType=DiscriminatorType.STRING)
@Audited
public abstract class Inscripcion implements Serializable 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5724038284651492231L;
	@Id
    @Column(name="id")
    @GeneratedValue
	protected int id;
	@ManyToOne
	@JoinColumn(name="curso_id")
	protected CursoGenerico curso;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="persona_id")
	@Valid
	protected Persona persona;
	@Column(name="confirmada")
	protected int confirmada;
	@Column(name="fecha_inscripcion")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotEmpty(groups=InscripcionChecks.class)
	protected Date fecha_inscripcion;
	@Column(name="fecha_comienzo")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotEmpty(groups=InscripcionChecks.class)
	protected Date fecha_comienzo;
	@Column(name="fecha_finalizacion")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	protected Date fecha_finalizacion;
	@Column(name="baja")
	protected int baja;
	@Column(name="fecha_baja")
	protected Date fecha_baja;
	@ManyToOne
	@JoinColumn(name = "modalidad_curso_id")
	protected ModalidadCurso modalidadCurso;
	@Column(name="empleado")
	private int empleado;
	@Column(name="borrada")
	private int borrada;
	@ManyToOne
	@JoinColumn(name="estado_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private EstadoInscripcion estadoInscripcion;
	@Column(name = "tipo", insertable = false, updatable = false)
	private String tipo;
    @Column(name="created",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
	private Date created;
	@Column(name="modified")
	private Date modified;
	
	public Inscripcion()
	{
		// programo los valores iniciales de una inscripcion.
		this.baja=0;
		this.confirmada=0;
		this.setBorrada(0);
		this.setEmpleado(0);
		this.fecha_inscripcion=new Date();
	}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the curso
	 */
	public CursoGenerico getCurso() {
		return curso;
	}
	/**
	 * @param curso the curso to set
	 */
	public void setCurso(CursoGenerico curso) {
		this.curso = curso;
	}
	/**
	 * @return the persona
	 */
	public Persona getPersona() {
		return persona;
	}
	/**
	 * @param persona the persona to set
	 */
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	/**
	 * @return the confirmada
	 */
	public int getConfirmada() {
		return confirmada;
	}
	/**
	 * @param confirmada the confirmada to set
	 */
	public void setConfirmada(int confirmada) {
		this.confirmada = confirmada;
	}
	/**
	 * @return the fecha_inscripcion
	 */
	public Date getFecha_inscripcion() {
		return fecha_inscripcion;
	}
	/**
	 * @param fecha_inscripcion the fecha_inscripcion to set
	 */
	public void setFecha_inscripcion(Date fecha_inscripcion) {
		this.fecha_inscripcion = fecha_inscripcion;
	}
	/**
	 * @return the fecha_comienzo
	 */
	public Date getFecha_comienzo() {
		return fecha_comienzo;
	}
	/**
	 * @param fecha_comienzo the fecha_comienzo to set
	 */
	public void setFecha_comienzo(Date fecha_comienzo) {
		this.fecha_comienzo = fecha_comienzo;
	}
	/**
	 * @return the fecha_finalizacion
	 */
	public Date getFecha_finalizacion() {
		return fecha_finalizacion;
	}
	/**
	 * @param fecha_finalizacion the fecha_finalizacion to set
	 */
	public void setFecha_finalizacion(Date fecha_finalizacion) {
		this.fecha_finalizacion = fecha_finalizacion;
	}
	/**
	 * @return the baja
	 */
	public int getBaja() {
		return baja;
	}
	/**
	 * @param baja the baja to set
	 */
	public void setBaja(int baja) {
		this.baja = baja;
	}
	/**
	 * @return the fecha_baja
	 */
	public Date getFecha_baja() {
		return fecha_baja;
	}
	/**
	 * @param fecha_baja the fecha_baja to set
	 */
	public void setFecha_baja(Date fecha_baja) {
		this.fecha_baja = fecha_baja;
	}
	/**
	 * @return the modalidadCurso
	 */
	public ModalidadCurso getModalidadCurso() {
		return modalidadCurso;
	}
	/**
	 * @param modalidadCurso the modalidadCurso to set
	 */
	public void setModalidadCurso(ModalidadCurso modalidadCurso) {
		this.modalidadCurso = modalidadCurso;
	}
	
	public int getEmpleado() {
		return empleado;
	}

	public void setEmpleado(int empleado) {
		this.empleado = empleado;
	}

	public int getBorrada() {
		return borrada;
	}

	public void setBorrada(int borrada) {
		this.borrada = borrada;
	}

	public abstract boolean esValida();

	public EstadoInscripcion getEstadoInscripcion() {
		return estadoInscripcion;
	}

	public void setEstadoInscripcion(EstadoInscripcion estadoInscripcion) {
		this.estadoInscripcion = estadoInscripcion;
	}
	@Transient
	public String getDiscriminatorValue(){
		DiscriminatorValue val = this.getClass().getAnnotation( DiscriminatorValue.class );

		return val == null ? null : val.value();
	}

	public String getTipo() 
	{
		return tipo;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
}
