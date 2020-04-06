package ar.com.strellis.edumanage.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

import org.apache.commons.beanutils.converters.DateConverter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "cursos")
public class Curso implements Serializable {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@NotEmpty
	private String codigo_curso;
	private String descripcion_curso;
	@Temporal(TemporalType.DATE)
	@Convert(converter = DateConverter.class)
	private Date fecha_comienzo;
	@Temporal(TemporalType.DATE)
	@Convert(converter = DateConverter.class)
	private Date fecha_fin;
	@Temporal(TemporalType.DATE)
	@Convert(converter = DateConverter.class)
	private Date fecha_baja;
	@ManyToOne
	@JoinColumn(name = "tipo_curso_id")
	private TipoCurso tipo_curso;
	@ManyToOne
	@JoinColumn(name = "idioma_estudiar_id")
	private IdiomaEstudiar idioma_estudiar;
	@ManyToOne
	@JoinColumn(name = "nivel_id")
	private Nivel nivel;
	@ManyToOne
	@JoinColumn(name = "sucursal_id")
	private Sucursal sucursal;
	/**
	 * 
	 */
	private static final long serialVersionUID = -6290905877513676956L;
	@OneToMany(targetEntity = ModalidadDisponible.class, cascade = { CascadeType.ALL }, mappedBy = "modalidad_curso")
	@Fetch(FetchMode.SELECT)
	@JsonManagedReference
	protected List<ModalidadDisponible> modalidades_disponibles = new LinkedList<ModalidadDisponible>();

	public boolean equals(Object other) {
		final Curso otro = (Curso) other;
		if (otro.getCodigo_curso() == this.getCodigo_curso())
			return true;
		else
			return false;
	}

	public int hashCode() {
		return Objects.hash(getId(), getCodigo_curso());
	}
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCodigo_curso() {
		return codigo_curso;
	}

	public void setCodigo_curso(String codigo_curso) {
		this.codigo_curso = codigo_curso;
	}

	public String getDescripcion_curso() {
		return descripcion_curso;
	}

	public void setDescripcion_curso(String descripcion_curso) {
		this.descripcion_curso = descripcion_curso;
	}

	public Date getFecha_comienzo() {
		return fecha_comienzo;
	}

	public void setFecha_comienzo(Date fecha_comienzo) {
		this.fecha_comienzo = fecha_comienzo;
	}

	public Date getFecha_fin() {
		return fecha_fin;
	}

	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	public Date getFecha_baja() {
		return fecha_baja;
	}

	public void setFecha_baja(Date fecha_baja) {
		this.fecha_baja = fecha_baja;
	}

	public TipoCurso getTipo_curso() {
		return tipo_curso;
	}

	public void setTipo_curso(TipoCurso tipo_curso) {
		this.tipo_curso = tipo_curso;
	}

	public IdiomaEstudiar getIdioma_estudiar() {
		return idioma_estudiar;
	}

	public void setIdioma_estudiar(IdiomaEstudiar idioma_estudiar) {
		this.idioma_estudiar = idioma_estudiar;
	}

	public Nivel getNivel() {
		return nivel;
	}

	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}

	public Sucursal getSucursal() {
		return sucursal;
	}

	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
}
