package edumanage.model;

import org.hibernate.annotations.Type;
import org.hibernate.envers.*;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;
import javax.persistence.DiscriminatorType;

@Entity
@Table(name="cursos")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="es_paquete",discriminatorType=DiscriminatorType.INTEGER)
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class CursoGenerico 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	protected int id;
	@NotEmpty
	protected String codigo_curso;
	protected String descripcion_curso;
	protected boolean intensivo;
	protected String horario_curso;
	protected Date fecha_comienzo;
	protected Date fecha_fin;
	protected Date fecha_baja;
	@ManyToOne
	@JoinColumn(name="tipo_curso_id")
	protected TipoCurso tipo_curso;
	@ManyToOne
	@JoinColumn(name="idioma_estudiar_id")
	protected IdiomaEstudiar idioma_estudiar;
	@ManyToOne
	@JoinColumn(name="nivel_id")
	protected Nivel nivel;
	@ManyToOne
	@JoinColumn(name="sucursal_id")
	protected Sucursal sucursal;
	@Column(name="abierto")
	@Type(type="edumanage.model.CursoEstadoUserType")
	protected CursoEstado abierto;
	protected int inscriptos;
	protected int baja;
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
	 * @return the codigo_curso
	 */
	public String getCodigo_curso() {
		return codigo_curso;
	}
	/**
	 * @param codigo_curso the codigo_curso to set
	 */
	public void setCodigo_curso(String codigo_curso) {
		this.codigo_curso = codigo_curso;
	}
	/**
	 * @return the descripcion_curso
	 */
	public String getDescripcion_curso() {
		return descripcion_curso;
	}
	/**
	 * @param descripcion_curso the descripcion_curso to set
	 */
	public void setDescripcion_curso(String descripcion_curso) {
		this.descripcion_curso = descripcion_curso;
	}
	/**
	 * @return the horario_curso
	 */
	public String getHorario_curso() {
		return horario_curso;
	}
	/**
	 * @param horario_curso the horario_curso to set
	 */
	public void setHorario_curso(String horario_curso) {
		this.horario_curso = horario_curso;
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
	 * @return the fecha_fin
	 */
	public Date getFecha_fin() {
		return fecha_fin;
	}
	/**
	 * @param fecha_fin the fecha_fin to set
	 */
	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
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
	 * @return the idioma
	 */
	public IdiomaEstudiar getIdioma_estudiar() {
		return idioma_estudiar;
	}
	/**
	 * @param idioma the idioma to set
	 */
	public void setIdioma_estudiar(IdiomaEstudiar idioma) {
		this.idioma_estudiar = idioma;
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
	 * @return the sucursal
	 */
	public Sucursal getSucursal() {
		return sucursal;
	}
	/**
	 * @param sucursal the sucursal to set
	 */
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	/**
	 * @return the abierto
	 */
	public CursoEstado getAbierto() {
		return abierto;
	}
	/**
	 * @param abierto the abierto to set
	 */
	public void setAbierto(CursoEstado abierto) {
		this.abierto = abierto;
	}
	
	
	/**
	 * @return the inscriptos
	 */
	public int getInscriptos() {
		return inscriptos;
	}
	/**
	 * @param inscriptos the inscriptos to set
	 */
	public void setInscriptos(int inscriptos) {
		this.inscriptos = inscriptos;
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
	 * @return the intensivo
	 */
	public boolean getIntensivo() 
	{
		return intensivo;
	}
	/**
	 * @param intensivo the intensivo to set
	 */
	public void setIntensivo(boolean intensivo) 
	{
		this.intensivo = intensivo;
	}
	public TipoCurso getTipo_curso() 
	{
		return tipo_curso;
	}
	public void setTipo_curso(TipoCurso tipo_curso) 
	{
		this.tipo_curso = tipo_curso;
	}
	@Override
	public boolean equals(Object otro)
	{
		CursoGenerico otroCurso=(CursoGenerico) otro;
		if(otroCurso.descripcion_curso==this.descripcion_curso
				&& otroCurso.codigo_curso==this.codigo_curso)
			return true;
		return false;
	}
	@Override
	public int hashCode()
	{
		if(codigo_curso!=null && descripcion_curso!=null)
			return this.codigo_curso.hashCode()*10+this.descripcion_curso.hashCode();
		else
			return 0;
	}
	
	/*************************************************/
	/* Metodos de Negocio                            */
	/*************************************************/
	public void inscripcionRecibida(Inscripcion insc)
	{
		getAbierto().inscripcionRecibida(insc);
	}
}
