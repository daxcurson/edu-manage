package edumanage.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="honorario_asignados")
@Audited
public class HonorarioAsignado 
{
	@Id
	@GeneratedValue
	private long id;
	@ManyToOne
	@JoinColumn(name="profesor_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Profesor profesor;
	@ManyToOne
	@JoinColumn(name="honorario_profesor_id")
	private HonorarioProfesor honorarioProfesor;
	private Date fecha_asignacion;
	private Date fecha_desde;
	private Double precio_por_hora;
	@ManyToOne
	@JoinColumn(name="moneda_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Moneda moneda;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Profesor getProfesor() {
		return profesor;
	}
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
	public HonorarioProfesor getHonorarioProfesor() {
		return honorarioProfesor;
	}
	public void setHonorarioProfesor(HonorarioProfesor honorarioProfesor) {
		this.honorarioProfesor = honorarioProfesor;
	}
	public Date getFecha_asignacion() {
		return fecha_asignacion;
	}
	public void setFecha_asignacion(Date fecha_asignacion) {
		this.fecha_asignacion = fecha_asignacion;
	}
	public Date getFecha_desde() {
		return fecha_desde;
	}
	public void setFecha_desde(Date fecha_desde) {
		this.fecha_desde = fecha_desde;
	}
	public Double getPrecio_por_hora() {
		return precio_por_hora;
	}
	public void setPrecio_por_hora(Double precio_por_hora) {
		this.precio_por_hora = precio_por_hora;
	}
	public Moneda getMoneda() {
		return moneda;
	}
	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
}
