package edumanage.dao;

import java.util.Date;
import java.util.List;

import edumanage.model.Feriado;

public interface FeriadosDAO 
{
	public List<Feriado> listarFeriados(Date desde,Date hasta);
	public Feriado buscarFeriadoEnFecha(Date fecha);
}
