package edumanage.service;

import java.util.Date;
import java.util.List;

import edumanage.model.Feriado;

public interface ConfiguracionService 
{
	public List<Feriado> listarFeriados(Date desde, Date hasta);
}
