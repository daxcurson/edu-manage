package ar.com.strellis.edumanage.model;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import ar.com.strellis.edumanage.model.validation.DesdeAntesDeHasta;

@Entity
@Table(name="horario_cursos")
@Audited
@DesdeAntesDeHasta
public class HorarioCurso extends FechaEnCalendario
{
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="curso_id")
	private Curso curso;
	@Transient
	private Date fecha;
	private String dia_semana=new String();
	private LocalTime hora_inicio=LocalTime.now();
	private LocalTime hora_fin=LocalTime.now();
	private Date fecha_desde;
	private Date fecha_hasta;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Profesor.class)
	@JoinColumn(name="profesor_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Profesor profesor;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=HonorarioProfesor.class)
	@JoinColumn(name="honorario_profesor_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private HonorarioProfesor honorario;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Sucursal.class)
	@JoinColumn(name="sucursal_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Sucursal sucursal;
	private double precio_por_hora;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Moneda.class)
	@JoinColumn(name="moneda_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Moneda moneda;
	
	public HorarioCurso()
	{
		// El Calendar id lo hago igual al id.
		calendar_id=String.valueOf(this.id);
		this.setAllDay(false);
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDia_semana() {
		return dia_semana;
	}
	public void setDia_semana(String dia_semana) {
		this.dia_semana = dia_semana;
	}
	public LocalTime getHora_inicio() {
		return hora_inicio;
	}
	public void setHora_inicio(LocalTime hora_inicio) {
		this.hora_inicio = hora_inicio;
	}
	public LocalTime getHora_fin() {
		return hora_fin;
	}
	public void setHora_fin(LocalTime hora_fin) {
		this.hora_fin = hora_fin;
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
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public Profesor getProfesor() {
		return profesor;
	}
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}

	public HonorarioProfesor getHonorario() {
		return honorario;
	}

	public void setHonorario(HonorarioProfesor honorario) {
		this.honorario = honorario;
	}

	public double getPrecio_por_hora() {
		return precio_por_hora;
	}

	public void setPrecio_por_hora(double precio_por_hora) {
		this.precio_por_hora = precio_por_hora;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
}
