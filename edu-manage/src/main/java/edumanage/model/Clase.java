package edumanage.model;

import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="clases")
@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
public class Clase 
{
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	private Date fecha_clase;
	
	private LocalTime hora_comienzo;
	private LocalTime hora_fin;
	
	@ManyToOne
	@JoinColumn(name="profesor_id")
	private Profesor profesor;
	@ManyToOne
	@JoinColumn(name="curso_id")
	private Curso curso;
	
	private int cancelada;
	private int mostrar_cancelada;
	private String comentarios;
	private String grammar;
	private String vocabulary;
	private String communication;
	private String homework;
	private String book_pages;
	private String suggestions;
	
	@ManyToOne
	@JoinColumn(name="sucursal_id")
	private Sucursal sucursal;
	private String domicilio_clase;
	private int no_recuperar;
	private double precio_por_hora;
	@ManyToOne
	@JoinColumn(name="moneda_id")
	private Moneda moneda;
	
	/**
	 * @return the fecha_clase
	 */
	public Date getFecha_clase() {
		return fecha_clase;
	}
	/**
	 * @param fecha_clase the fecha_clase to set
	 */
	public void setFecha_clase(Date fecha_clase) {
		this.fecha_clase = fecha_clase;
	}
	/**
	 * @return the profesor
	 */
	public Profesor getProfesor() {
		return profesor;
	}
	/**
	 * @param profesor the profesor to set
	 */
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
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
	 * @return the curso
	 */
	public Curso getCurso() {
		return curso;
	}
	/**
	 * @param curso the curso to set
	 */
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public int getCancelada() {
		return cancelada;
	}
	public void setCancelada(int cancelada) {
		this.cancelada = cancelada;
	}
	public int getMostrar_cancelada() {
		return mostrar_cancelada;
	}
	public void setMostrar_cancelada(int mostrar_cancelada) {
		this.mostrar_cancelada = mostrar_cancelada;
	}
	public String getComentarios() {
		return comentarios;
	}
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}
	public String getGrammar() {
		return grammar;
	}
	public void setGrammar(String grammar) {
		this.grammar = grammar;
	}
	public String getVocabulary() {
		return vocabulary;
	}
	public void setVocabulary(String vocabulary) {
		this.vocabulary = vocabulary;
	}
	public String getCommunication() {
		return communication;
	}
	public void setCommunication(String communication) {
		this.communication = communication;
	}
	public String getHomework() {
		return homework;
	}
	public void setHomework(String homework) {
		this.homework = homework;
	}
	public String getBook_pages() {
		return book_pages;
	}
	public void setBook_pages(String book_pages) {
		this.book_pages = book_pages;
	}
	public String getSuggestions() {
		return suggestions;
	}
	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}
	public String getDomicilio_clase() {
		return domicilio_clase;
	}
	public void setDomicilio_clase(String domicilio_clase) {
		this.domicilio_clase = domicilio_clase;
	}
	public int getNo_recuperar() {
		return no_recuperar;
	}
	public void setNo_recuperar(int no_recuperar) {
		this.no_recuperar = no_recuperar;
	}
	public double getPrecio_por_hora() {
		return precio_por_hora;
	}
	public void setPrecio_por_hora(double precio_por_hora) {
		this.precio_por_hora = precio_por_hora;
	}
	public LocalTime getHora_comienzo() {
		return hora_comienzo;
	}
	public void setHora_comienzo(LocalTime hora_comienzo) {
		this.hora_comienzo = hora_comienzo;
	}
	public LocalTime getHora_fin() {
		return hora_fin;
	}
	public void setHora_fin(LocalTime hora_fin) {
		this.hora_fin = hora_fin;
	}
	public static Date getNextOccurenceOfDay(Date today, int dayOfWeek) 
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		int dow = cal.get(Calendar.DAY_OF_WEEK);
		int numDays = 7 - ((dow - dayOfWeek) % 7 + 7) % 7;
		cal.add(Calendar.DAY_OF_YEAR, numDays);
		return cal.getTime();
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	public Moneda getMoneda() {
		return moneda;
	}
	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}
}
