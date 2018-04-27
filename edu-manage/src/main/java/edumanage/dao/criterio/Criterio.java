package edumanage.dao.criterio;

/**
 * Un criterio de busqueda.
 * @author Agustín Villafañe
 *
 */
public class Criterio
{
	private String campo;
	private String operador;
	private String valor;
	public String getCampo()
	{
		return campo;
	}
	public void setCampo(String campo)
	{
		this.campo = campo;
	}
	public String getOperador()
	{
		return operador;
	}
	public void setOperador(String operador)
	{
		this.operador = operador;
	}
	public String getValor()
	{
		return valor;
	}
	public void setValor(String valor)
	{
		this.valor = valor;
	}
}
