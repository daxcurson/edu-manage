package ar.com.strellis.edumanage.model;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.hibernate.envers.*;
import org.springframework.format.annotation.DateTimeFormat;

import ar.com.strellis.edumanage.model.validation.EdadMinima;

import java.util.*;

@Entity
@Table(name="personas")
@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
public class Persona 
{
	@Id
    @Column(name="id")
    @GeneratedValue
    private Integer id;

    @Column(name="nombre")
    @NotEmpty
    private String nombre;

    @Column(name="apellido")
    @NotEmpty
    private String apellido;

    @Column(name="email")
    @NotEmpty
    private String email;
    
    @Column(name="direccion")
    private String direccion;
    
    @Column(name="telefono")
    private String telefono;
    
    @Column(name="novedades")
    private boolean novedades;

    @Column(name="fecha_nacimiento")
    @EdadMinima(valor = 3)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date fecha_nacimiento;
    
    @Column(name="nombre_tutor")
    private String nombre_tutor;
    
    @Column(name="telefono_tutor")
    private String telefono_tutor;
    
    @Column(name="vinculo")
    private String vinculo;
    
    @ManyToOne
    @JoinColumn(name="nacionalidad_id")
    @NotNull
    private Nacionalidad nacionalidad;
    
    @ManyToOne
    @JoinColumn(name="idioma_nativo_id")
    @NotNull
    private IdiomaNativo idioma_nativo;
    
    @Column(name="pasaporte")
    @NotEmpty
    private String pasaporte;
    
    @Column(name="ocupacion")
    private String ocupacion;
    
    @Column(name="skype")
    private String skype;
    
    @Column(name="facebook")
    private String facebook;

    @ManyToOne
    @JoinColumn(name="como_supo_id")
    private ComoSupo como_supo;
    
    @Column(name="como_supo_otros")
    private String como_supo_otros;

    @Column(name="tiempo_clases")
    private String tiempo_clases;
    
    @Column(name="motivo_estudio")
    private String motivo_estudio;
    
    @Column(name="hizo_test_nivel")
    private String hizo_test_nivel;
    
    @OneToMany(mappedBy="persona")
    private Set<Inscripcion> inscripciones;
    
    @ManyToOne
    @JoinColumn(name="nivel_supuesto_estudiante_id")
    private Nivel nivel_supuesto_estudiante;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idioma_estudiar_id")
    private IdiomaEstudiar idiomaEstudiar;
    
    @ManyToOne
    @JoinColumn(name="nivel_id")
    private Nivel nivel;

    @ManyToOne
    @JoinColumn(name="estado_id")
    private PersonaEstado estado;
    @Column(name="baja")
    private int baja;
    @Column(name="fecha_baja")
    private Date fecha_baja;
    @Column(name="created",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP", insertable = true, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name="modified")
    private Date modified;
    
    public String getEmail() {
            return email;
    }
    public String getTelefono() {
            return telefono;
    }
    public void setEmail(String email) {
            this.email = email;
    }
    public void setTelefono(String telefono) {
            this.telefono = telefono;
    }
    public String getNombre() {
            return nombre;
    }
    public String getApellido() {
            return apellido;
    }
    public void setNombre(String nombre) {
            this.nombre = nombre;
    }
    public void setApellido(String apellido) {
            this.apellido = apellido;
    }
    public Integer getId() {
            return id;
    }
    public void setId(Integer id) {
            this.id = id;
    }
    public String getDireccion()
    {
    	return this.direccion;
    }
    public void setDireccion(String d)
    {
    	this.direccion=d;
    }
    public boolean getNovedades()
    {
    	return this.novedades;
    }
    public void setNovedades(boolean n)
    {
    	this.novedades=n;
    }
    public Date getFecha_nacimiento()
    {
    	return fecha_nacimiento;
    }
    public void setFecha_nacimiento(Date n)
    {
    	this.fecha_nacimiento=n;
    }
    public Set<Inscripcion> getInscripciones()
    {
    	return this.inscripciones;
    }
    public void setInscripciones(Set<Inscripcion> l)
    {
    	this.inscripciones=l;
    }
	public String getVinculo() {
		return vinculo;
	}
	public void setVinculo(String vinculo) {
		this.vinculo = vinculo;
	}
	public String getTelefono_tutor() {
		return telefono_tutor;
	}
	public void setTelefono_tutor(String telefono_tutor) {
		this.telefono_tutor = telefono_tutor;
	}
	public String getNombre_tutor() {
		return nombre_tutor;
	}
	public void setNombre_tutor(String nombre_tutor) {
		this.nombre_tutor = nombre_tutor;
	}
	public Nacionalidad getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(Nacionalidad nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	public IdiomaNativo getIdioma_nativo() {
		return idioma_nativo;
	}
	public void setIdioma_nativo(IdiomaNativo idioma_nativo) {
		this.idioma_nativo = idioma_nativo;
	}
	public String getPasaporte() {
		return pasaporte;
	}
	public void setPasaporte(String pasaporte) {
		this.pasaporte = pasaporte;
	}
	public String getOcupacion() {
		return ocupacion;
	}
	public void setOcupacion(String ocupacion) {
		this.ocupacion = ocupacion;
	}
	public String getSkype() {
		return skype;
	}
	public void setSkype(String skype) {
		this.skype = skype;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public ComoSupo getComo_supo() {
		return como_supo;
	}
	public void setComo_supo(ComoSupo como_supo) {
		this.como_supo = como_supo;
	}
	public String getComo_supo_otros() {
		return como_supo_otros;
	}
	public void setComo_supo_otros(String como_supo_otros) {
		this.como_supo_otros = como_supo_otros;
	}
	public String getTiempo_clases() {
		return tiempo_clases;
	}
	public void setTiempo_clases(String tiempo_clases) {
		this.tiempo_clases = tiempo_clases;
	}
	public String getMotivo_estudio() {
		return motivo_estudio;
	}
	public void setMotivo_estudio(String motivo_estudio) {
		this.motivo_estudio = motivo_estudio;
	}
	public String getHizo_test_nivel() {
		return hizo_test_nivel;
	}
	public void setHizo_test_nivel(String hizo_test_nivel) {
		this.hizo_test_nivel = hizo_test_nivel;
	}
	public Nivel getNivel_supuesto_estudiante() {
		return nivel_supuesto_estudiante;
	}
	public void setNivel_supuesto_estudiante(Nivel nivel_supuesto_estudiante) {
		this.nivel_supuesto_estudiante = nivel_supuesto_estudiante;
	}
	public IdiomaEstudiar getIdioma_estudiar() {
		return idiomaEstudiar;
	}
	public void setIdioma_estudiar(IdiomaEstudiar idiomaEstudiar) {
		this.idiomaEstudiar = idiomaEstudiar;
	}
	public Nivel getNivel() {
		return nivel;
	}
	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}
	public PersonaEstado getEstado() {
		return estado;
	}
	public void setEstado(PersonaEstado estado) {
		this.estado = estado;
	}
	public int getBaja() {
		return baja;
	}
	public void setBaja(int baja) {
		this.baja = baja;
	}
	public Date getFecha_baja() {
		return fecha_baja;
	}
	public void setFecha_baja(Date fecha_baja) {
		this.fecha_baja = fecha_baja;
	}
	public Date getModified() {
		return modified;
	}
	public void setModified(Date modified) {
		this.modified = modified;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
}
