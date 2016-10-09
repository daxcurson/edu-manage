package edumanage.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="modalidad_disponibles")
@Audited
public class ModalidadDisponible implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1598072746113718197L;
	//private ModalidadDisponibleId pk=new ModalidadDisponibleId();
	private float precio_unidad_modalidad;
	@ManyToOne
	@JoinColumn(name="moneda_id")
	@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
	private Moneda moneda;

	@Id
	@GeneratedValue
	private long id;
	@ManyToOne
	@JoinColumn(name="curso_id")
	private Curso curso;
	@ManyToOne
	@JoinColumn(name="modalidad_curso_id")
	private ModalidadCurso modalidad_curso;
	
	@JsonBackReference
	public Curso getCurso() {
		return this.curso;
	}
	public void setCurso(Curso curso) {
		this.curso=curso;
	}
	public ModalidadCurso getModalidad_curso() {
		return this.modalidad_curso;
	}
	public void setModalidad_curso(ModalidadCurso modalidad_curso) {
		this.modalidad_curso=modalidad_curso;
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
	public void setMoneda(Moneda moneda_id) {
		this.moneda = moneda_id;
	}
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ModalidadDisponible that = (ModalidadDisponible) o;

		if( (curso != null ? !curso.equals(that.curso): that.curso != null)
				||
			(modalidad_curso!=null ? !modalidad_curso.equals(that.modalidad_curso): that.modalidad_curso != null)
			)
			return false;

		return true;
	}

	public int hashCode() {
		if(curso!=null && modalidad_curso!=null)
			return curso.hashCode()*29+modalidad_curso.hashCode();
		else
			return 0;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
}
