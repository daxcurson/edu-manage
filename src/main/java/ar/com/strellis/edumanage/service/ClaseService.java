package ar.com.strellis.edumanage.service;

import java.util.Date;
import java.util.List;

import ar.com.strellis.edumanage.model.Clase;

public interface ClaseService 
{
	public List<Clase> listarClasesActivasEntreFechas(Date desde,Date hasta);
}
