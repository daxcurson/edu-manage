package edumanage.model;

import javax.persistence.*;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="carga_horarias")
@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
public class CargaHoraria implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7454199703874810520L;
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="tipo_curso_id")
	private TipoCurso tipo_curso;
	private String descripcion;
	private String horas_semanales;
	private int dias_semana;
	private float horas_clase;
	
	public long getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id=id;
	}
	public TipoCurso getTipo_curso() {
		return tipo_curso;
	}
	public void setTipo_curso(TipoCurso tipo_curso) {
		this.tipo_curso = tipo_curso;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getHoras_semanales() {
		return horas_semanales;
	}
	public void setHoras_semanales(String horas_semanales) {
		this.horas_semanales = horas_semanales;
	}
	public int getDias_semana() {
		return dias_semana;
	}
	public void setDias_semana(int dias_semana) {
		this.dias_semana = dias_semana;
	}
	public float getHoras_clase() {
		return horas_clase;
	}
	public void setHoras_clase(float horas_clase) {
		this.horas_clase = horas_clase;
	}
	@Override
	public boolean equals(Object otro)
	{
		if(otro instanceof CargaHoraria)
		{
			CargaHoraria otraCarga=(CargaHoraria)otro;
			if(otraCarga.descripcion==this.descripcion
				&& otraCarga.dias_semana==this.dias_semana
				&& otraCarga.horas_clase==this.horas_clase
				&& otraCarga.horas_semanales==this.horas_semanales
				&& otraCarga.tipo_curso==this.tipo_curso)
				return true;
		}
		return false;
	}
	@Override
	public int hashCode()
	{
		return (int) (this.descripcion.hashCode()+this.dias_semana*10+this.horas_clase*100);
	}
}
