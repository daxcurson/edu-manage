package ar.com.strellis.edumanage.model;

import java.util.*;
import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.envers.Audited;
import org.hibernate.validator.group.GroupSequenceProvider;
import ar.com.strellis.edumanage.model.validation.CursoSequenceProvider;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@DiscriminatorValue("0")
@GroupSequenceProvider(CursoSequenceProvider.class)
@Audited
public class Curso extends CursoGenerico implements java.io.Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8089908172474969299L;

	@OneToMany(targetEntity=ModalidadDisponible.class,cascade={CascadeType.ALL},
			mappedBy="modalidad_curso")
	@Fetch(FetchMode.SELECT)
	@JsonManagedReference
    protected List<ModalidadDisponible> modalidades_disponibles=new LinkedList<ModalidadDisponible>();

	@Fetch(FetchMode.SELECT)
	@OneToMany(targetEntity=HorarioCurso.class,cascade={CascadeType.ALL},
	fetch=FetchType.LAZY
	,mappedBy="curso"
	)
	private List<HorarioCurso> horario=new LinkedList<HorarioCurso>();

	private String libro;

	// Lista de clases del curso!!!
	@Fetch(FetchMode.SELECT)
	@OneToMany(targetEntity=Clase.class,cascade={CascadeType.ALL},
	mappedBy="curso",fetch=FetchType.EAGER)
	private List<Clase> clases=new LinkedList<Clase>();
	
	public List<Clase> getClases()
	{
		return clases;
	}
	public void setClases(List<Clase> clases)
	{
		this.clases=clases;
	}
	public List<ModalidadDisponible> getModalidades_disponibles() 
	{
		return modalidades_disponibles;
	}
	public void setModalidades_disponibles(List<ModalidadDisponible> modalidades_disponibles) 
	{
		this.modalidades_disponibles = modalidades_disponibles;
	}
	public String getLibro() 
	{
		return libro;
	}
	public void setLibro(String libro) 
	{
		this.libro = libro;
	}
	public List<HorarioCurso> getHorario() 
	{
		return horario;
	}
	public void setHorario(List<HorarioCurso> horario_curso_planificado) 
	{
		this.horario = horario_curso_planificado;
	}
	public boolean equals(Object other)
	{
		final Curso otro=(Curso) other;
		if(otro.getCodigo_curso()==this.getCodigo_curso())
			return true;
		else
			return false;
	}
	public int hashCode()
	{
		return Objects.hash(id,codigo_curso);
	}
}
