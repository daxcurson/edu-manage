package edumanage.model.listados;

import java.util.List;

/**
 * Clase con el formato que vuejs-paginator necesita para mostrar en el paginador.
 * @author Agustín Villafañe
 *
 */
public class ListadoPaginado<E>
{
	private List<E> data;
	private int total_registros;
	public List<E> getData()
	{
		return data;
	}
	public void setData(List<E> data)
	{
		this.data = data;
	}
	public int getTotal_registros()
	{
		return total_registros;
	}
	public void setTotal_registros(int total_registros)
	{
		this.total_registros = total_registros;
	}
}
