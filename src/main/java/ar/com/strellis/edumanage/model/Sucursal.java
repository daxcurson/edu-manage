package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="sucursales")
public class Sucursal 
{
	@Id
	@GeneratedValue
	private long id;
	private String nombre;
	private String abreviatura;
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
	 * @return the abreviatura
	 */
	public String getAbreviatura() {
		return abreviatura;
	}
	/**
	 * @param abreviatura the abreviatura to set
	 */
	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}
	@Override
	public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || obj.getClass() != this.getClass()) {
            return false;
        }

        Sucursal guest = (Sucursal) obj;
        return id == guest.id
                && (nombre == guest.nombre
                     || (nombre != null && nombre.equals(guest.getNombre())));
    	}
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((nombre == null) ? 0 : nombre.hashCode());
        result = (int) (prime * result + id);
        return result;
    }
}
