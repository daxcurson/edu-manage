package edumanage.model.listados;

import java.util.Date;

import edumanage.model.Curso;
import edumanage.model.criterio.CursoVigente;

/**
 * Lista las propiedades de un curso que a mi me interesa destacar. 
 * @author Agustín Villafañe
 *
 */
public class ListadoCursosItem
{
	private int id;
	private String codigo_curso;
	private String descripcion_curso;
	private Date fecha_comienzo;
	private Date fecha_fin;
	private Date fecha_baja;
	private String estado;
	private boolean vigente;
	private boolean baja;
	
	/**
	 * construimos un item de listado de cursos con un curso como base.
	 * @param curso
	 */
	public ListadoCursosItem(Curso curso)
	{
		this.id=curso.getId();
		this.codigo_curso=curso.getCodigo_curso();
		this.descripcion_curso=curso.getDescripcion_curso();
		this.fecha_comienzo=curso.getFecha_comienzo();
		this.fecha_fin=curso.getFecha_fin();
		this.fecha_baja=curso.getFecha_baja();
		this.estado=curso.getAbierto().nombre;
		// Ahora, aca viene algo de magia. 
		// Delego en una clase que me diga si este curso es vigente.
		// Tal clase va a estar separada de lo que es la entidad curso, para garantizar
		// que esta despues se pueda usar para crear criterios de busqueda para por ejemplo
		// Hibernate, asi logro que los criterios de busqueda esten en un lugar solo.
		this.vigente=CursoVigente.estaVigente(curso);
	}
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getCodigo_curso()
	{
		return codigo_curso;
	}
	public void setCodigo_curso(String codigo_curso)
	{
		this.codigo_curso = codigo_curso;
	}
	public String getDescripcion_curso()
	{
		return descripcion_curso;
	}
	public void setDescripcion_curso(String descripcion_curso)
	{
		this.descripcion_curso = descripcion_curso;
	}
	public Date getFecha_comienzo()
	{
		return fecha_comienzo;
	}
	public void setFecha_comienzo(Date fecha_comienzo)
	{
		this.fecha_comienzo = fecha_comienzo;
	}
	public Date getFecha_fin()
	{
		return fecha_fin;
	}
	public void setFecha_fin(Date fecha_fin)
	{
		this.fecha_fin = fecha_fin;
	}
	public String getEstado()
	{
		return estado;
	}
	public void setEstado(String estado)
	{
		this.estado = estado;
	}
	public boolean isVigente()
	{
		return vigente;
	}
	public void setVigente(boolean vigente)
	{
		this.vigente = vigente;
	}

	public boolean isBaja()
	{
		return baja;
	}

	public void setBaja(boolean baja)
	{
		this.baja = baja;
	}

	public Date getFecha_baja()
	{
		return fecha_baja;
	}

	public void setFecha_baja(Date fecha_baja)
	{
		this.fecha_baja = fecha_baja;
	}
}
