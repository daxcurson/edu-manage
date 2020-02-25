package ar.com.strellis.edumanage.service;

import java.util.Date;
import java.util.List;

import ar.com.strellis.edumanage.model.Feriado;

public interface ConfiguracionService 
{
	public List<Feriado> listarFeriados(Date desde, Date hasta);
}
