package edumanage.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="honorario_profesores")
@Audited
public class HonorarioProfesor 
{
	@Id
	@GeneratedValue
	private long id;
	@NotNull
	private double precio_por_hora;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Moneda.class)
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	@JoinColumn(name="moneda_id")
	@NotNull
	private Moneda moneda;
	@NotEmpty
	private String descripcion;
	@NotNull
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=IdiomaEstudiar.class)
	@JoinColumn(name="idioma_estudiar_id")
	private IdiomaEstudiar idioma_estudiar;
	private double otro_honorario;
	private Date fecha_desde;
	private int especial;
	private int cambios;
	
	@Fetch(FetchMode.SELECT)
	@OneToMany(targetEntity=HonorarioAsignado.class,cascade={CascadeType.ALL},
	fetch=FetchType.LAZY
	)
	private List<HonorarioAsignado> asignaciones;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public double getPrecio_por_hora() {
		return precio_por_hora;
	}
	public void setPrecio_por_hora(double precio_por_hora) {
		this.precio_por_hora = precio_por_hora;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public IdiomaEstudiar getIdioma_estudiar() {
		return idioma_estudiar;
	}
	public void setIdioma_estudiar(IdiomaEstudiar idioma_estudiar) {
		this.idioma_estudiar = idioma_estudiar;
	}
	public double getOtro_honorario() {
		return otro_honorario;
	}
	public void setOtro_honorario(double otro_honorario) {
		this.otro_honorario = otro_honorario;
	}
	public Date getFecha_desde() {
		return fecha_desde;
	}
	public void setFecha_desde(Date fecha_desde) {
		this.fecha_desde = fecha_desde;
	}
	public int getEspecial() {
		return especial;
	}
	public void setEspecial(int especial) {
		this.especial = especial;
	}
	public List<HonorarioAsignado> getAsignaciones() {
		return asignaciones;
	}
	public void setAsignaciones(List<HonorarioAsignado> asignaciones) {
		this.asignaciones = asignaciones;
	}
	public Moneda getMoneda() {
		return moneda;
	}
	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
	public int getCambios() {
		return cambios;
	}
	public void setCambios(int cambios) {
		this.cambios = cambios;
	}
}
