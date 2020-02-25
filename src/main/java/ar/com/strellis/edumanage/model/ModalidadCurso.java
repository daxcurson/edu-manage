package ar.com.strellis.edumanage.model;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="modalidad_cursos")
@Audited
public class ModalidadCurso implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5362444860893722373L;
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	@ManyToOne
	@JoinColumn(name="carga_horaria_id")
	private CargaHoraria carga_horaria;
	@ManyToOne
	@JoinColumn(name="modalidad_pago_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private ModalidadPago modalidad_pago;
	private String descripcion;
	private String abreviatura;
	private float precio_unidad_modalidad;
	@ManyToOne
	@JoinColumn(name="moneda_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Moneda moneda;
	private int duracion_cantidad;
	@ManyToOne
	@JoinColumn(name="duracion_modo_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private DuracionModo duracion_modo;
	@ManyToMany(targetEntity=IdiomaEstudiar.class)
	@Fetch(FetchMode.JOIN)
    @JoinTable(
          name="idioma_modalidades",
          joinColumns=@JoinColumn(name="modalidad_curso_id"),
          inverseJoinColumns=@JoinColumn(name="idioma_estudiar_id")
      )
	@Cascade({CascadeType.SAVE_UPDATE})
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private List<IdiomaEstudiar> idiomas_asignados=new LinkedList<IdiomaEstudiar>();
	private boolean es_extra;
	
	//@ManyToMany(mappedBy="modalidades_disponibles")
	//private List<Curso> cursos_asignados=new LinkedList<Curso>();
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public CargaHoraria getCarga_horaria() {
		return carga_horaria;
	}
	public void setCarga_horaria(CargaHoraria carga_horaria) {
		this.carga_horaria = carga_horaria;
	}
	public ModalidadPago getModalidad_pago() {
		return modalidad_pago;
	}
	public void setModalidad_pago(ModalidadPago modalidad_pago) {
		this.modalidad_pago = modalidad_pago;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getAbreviatura() {
		return abreviatura;
	}
	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}
	public float getPrecio_unidad_modalidad() {
		return precio_unidad_modalidad;
	}
	public void setPrecio_unidad_modalidad(float precio_unidad_modalidad) {
		this.precio_unidad_modalidad = precio_unidad_modalidad;
	}
	public Moneda getMoneda() {
		return moneda;
	}
	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
	public int getDuracion_cantidad() {
		return duracion_cantidad;
	}
	public void setDuracion_cantidad(int duracion_cantidad) {
		this.duracion_cantidad = duracion_cantidad;
	}
	public DuracionModo getDuracion_modo() {
		return duracion_modo;
	}
	public void setDuracion_modo(DuracionModo duracion_modo) {
		this.duracion_modo = duracion_modo;
	}
	public boolean getEs_extra() {
		return es_extra;
	}
	public void setEs_extra(boolean es_extra) {
		this.es_extra = es_extra;
	}
	public List<IdiomaEstudiar> getIdiomas_asignados() {
		return this.idiomas_asignados;
	}
	public void setIdiomas_asignados(List<IdiomaEstudiar> idioma_estudiar) {
		this.idiomas_asignados = idioma_estudiar;
	}
	//public List<Curso> getCursos_asignados() {
	//	return cursos_asignados;
	//}
	//public void setCursos_asignados(List<Curso> cursos_asignados) {
	//	this.cursos_asignados = cursos_asignados;
	//}
	@Override
	public boolean equals(Object otro)
	{
		ModalidadCurso otraModalidad=(ModalidadCurso) otro;
		if(otraModalidad.descripcion==this.descripcion
				&& this.idiomas_asignados.equals(otraModalidad.idiomas_asignados) 
				&& otraModalidad.precio_unidad_modalidad==this.precio_unidad_modalidad
				&& otraModalidad.duracion_cantidad==this.duracion_cantidad
				&& otraModalidad.carga_horaria.equals(this.carga_horaria))
			return true;
		return false;
	}
	@Override
	public int hashCode()
	{
		// Devolver nada mas que la descripcion, total es lo unico que importa.
		return descripcion!=null ? descripcion.hashCode():0;
	}
	@Override
	public String toString()
	{
		return descripcion;
	}
}
