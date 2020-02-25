package ar.com.strellis.edumanage.model;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="profesores")
public class Profesor
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	private String nombre;
	@ManyToOne
	@JoinColumn(name="nacionalidad_id")
	private Nacionalidad nacionalidad;
	@ManyToOne
	@JoinColumn(name="idioma_nativo_id")
	private IdiomaNativo idioma_nativo;
	@ManyToMany(targetEntity=IdiomaEstudiar.class,cascade={CascadeType.ALL})
    @JoinTable(
          name="profesor_idiomas",
          joinColumns=@JoinColumn(name="profesor_id"),
          inverseJoinColumns=@JoinColumn(name="idioma_estudiar_id")
      )
	@Fetch(FetchMode.SELECT)
	private List<IdiomaEstudiar> idiomasEnsenados=new LinkedList<IdiomaEstudiar>();
	@ManyToOne
	@JoinColumn(name="nivel_id")
	private Nivel nivel;
	private Date fecha_nacimiento;
	private String email;
	private String email_otro;
	private String celular;
	private Date fecha_comienzo;
	private int deshabilitado;
	private Date fecha_baja;
	@ManyToOne
	@JoinColumn(name="perfil_profesor_id")
	private PerfilProfesor perfil_profesor;
	private String facebook;
	private String disponibilidad;
	private String anos_experiencia;
	private Date created;
	
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
	 * @return the celular
	 */
	public String getCelular() {
		return celular;
	}
	/**
	 * @param celular the celular to set
	 */
	public void setCelular(String celular) {
		this.celular = celular;
	}
	/**
	 * @return the email_otro
	 */
	public String getEmail_otro() {
		return email_otro;
	}
	/**
	 * @param email_otro the email_otro to set
	 */
	public void setEmail_otro(String email_otro) {
		this.email_otro = email_otro;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the fecha_nacimiento
	 */
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	/**
	 * @param fecha_nacimiento the fecha_nacimiento to set
	 */
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
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
	 * @return the idiomaNativo
	 */
	public IdiomaNativo getIdioma_nativo() {
		return idioma_nativo;
	}
	/**
	 * @param idiomaNativo the idiomaNativo to set
	 */
	public void setIdioma_nativo(IdiomaNativo idiomaNativo) {
		this.idioma_nativo = idiomaNativo;
	}
	/**
	 * @return the nacionalidad
	 */
	public Nacionalidad getNacionalidad() {
		return nacionalidad;
	}
	/**
	 * @param nacionalidad the nacionalidad to set
	 */
	public void setNacionalidad(Nacionalidad nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the idiomasEnsenados
	 */
	public List<IdiomaEstudiar> getIdiomasEnsenados() {
		return idiomasEnsenados;
	}
	/**
	 * @param idiomasEnsenados the idiomasEnsenados to set
	 */
	public void setIdiomasEnsenados(List<IdiomaEstudiar> idiomasEnsenados) {
		this.idiomasEnsenados = idiomasEnsenados;
	}
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	public int getDeshabilitado() {
		return deshabilitado;
	}
	public void setDeshabilitado(int deshabilitado) {
		this.deshabilitado = deshabilitado;
	}
	public PerfilProfesor getPerfil_profesor() {
		return perfil_profesor;
	}
	public void setPerfil_profesor(PerfilProfesor perfil_profesor) {
		this.perfil_profesor = perfil_profesor;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getDisponibilidad() {
		return disponibilidad;
	}
	public void setDisponibilidad(String disponibilidad) {
		this.disponibilidad = disponibilidad;
	}
	public String getAnos_experiencia() {
		return anos_experiencia;
	}
	public void setAnos_experiencia(String anos_experiencia) {
		this.anos_experiencia = anos_experiencia;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
}
