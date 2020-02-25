package ar.com.strellis.edumanage.model;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="cuotas")
@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="es_matricula",discriminatorType=DiscriminatorType.INTEGER)
public class Cuota 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="persona_id")
	private Persona persona;
	@ManyToOne
	@JoinColumn(name="inscripcion_id")
	private Inscripcion inscripcion;
	@ManyToOne
	@JoinColumn(name="extension_cursada_id")
	private ExtensionCursada extensionCursada;
	@ManyToOne
	@JoinColumn(name="curso_id")
	private Curso curso;
	@Column(name="descripcion")
	private String descripcion;
	@Column(name="confirmado")
	private int confirmada;
	@Column(name="fecha_vencimiento")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fecha_vencimiento;
	@Column(name="fecha_desde")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fecha_desde;
	@Column(name="fecha_hasta")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fecha_hasta;
	@Column(name="monto_pagar")
	private double monto_pagar;
	@Column(name="es_matricula")
	private int es_matricula;
	@ManyToOne
	@JoinColumn(name="moneda_id")
	private Moneda moneda;
	@Column(name="saldo_pagar")
	private double saldo_pagar;
	@Column(name="comentarios")
	private String comentarios;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Persona getPersona() {
		return persona;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	public Inscripcion getInscripcion() {
		return inscripcion;
	}
	public void setInscripcion(Inscripcion inscripcion) {
		this.inscripcion = inscripcion;
	}
	public ExtensionCursada getExtensionCursada() {
		return extensionCursada;
	}
	public void setExtensionCursada(ExtensionCursada extensionCursada) {
		this.extensionCursada = extensionCursada;
	}
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getConfirmada() {
		return confirmada;
	}
	public void setConfirmada(int confirmada) {
		this.confirmada = confirmada;
	}
	public Date getFecha_vencimiento() {
		return fecha_vencimiento;
	}
	public void setFecha_vencimiento(Date fecha_vencimiento) {
		this.fecha_vencimiento = fecha_vencimiento;
	}
	public Date getFecha_desde() {
		return fecha_desde;
	}
	public void setFecha_desde(Date fecha_desde) {
		this.fecha_desde = fecha_desde;
	}
	public Date getFecha_hasta() {
		return fecha_hasta;
	}
	public void setFecha_hasta(Date fecha_hasta) {
		this.fecha_hasta = fecha_hasta;
	}
	public double getMonto_pagar() {
		return monto_pagar;
	}
	public void setMonto_pagar(double monto_pagar) {
		this.monto_pagar = monto_pagar;
	}
	public Moneda getMoneda() {
		return moneda;
	}
	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
	public int getEs_matricula() {
		return es_matricula;
	}
	public void setEs_matricula(int es_matricula) {
		this.es_matricula = es_matricula;
	}
	public String getComentarios() {
		return comentarios;
	}
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}
}
