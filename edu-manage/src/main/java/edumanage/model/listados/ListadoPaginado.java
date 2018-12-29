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
	private int current_page;
	private int last_page;
	private String next_page_url;
	private String prev_page_url;
	private int registros_por_pagina;
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
	public int getCurrent_page() {
		return current_page;
	}
	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
		// Cuando me dicen el currentPage, calculo los demas datos.
		// Si puede haber una proxima,
		if(total_registros>=((current_page-1)*registros_por_pagina))
		{
			int next=current_page+1;
			next_page_url="?current_page="+next;
		}
		else
			next_page_url=null;
		if((current_page-1)>0)
		{
			int previous=current_page-1;
			prev_page_url="?current_page="+previous;
		}
		else
			prev_page_url=null;
		// Y cual seria la ultima pagina?!?!?
		last_page=(total_registros/registros_por_pagina);
	}
	public int getLast_page() {
		return last_page;
	}
	public void setLast_page(int last_page) {
		this.last_page = last_page;
	}
	public String getNext_page_url() {
		return next_page_url;
	}
	public void setNext_page_url(String next_page_url) {
		this.next_page_url = next_page_url;
	}
	public String getPrev_page_url() {
		return prev_page_url;
	}
	public void setPrev_page_url(String prev_page_url) {
		this.prev_page_url = prev_page_url;
	}
	public int getRegistros_por_pagina() {
		return registros_por_pagina;
	}
	public void setRegistros_por_pagina(int registros_por_pagina) {
		this.registros_por_pagina = registros_por_pagina;
	}
}
