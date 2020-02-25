package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.DuracionModoInexistenteException;
import ar.com.strellis.edumanage.model.DuracionModo;

public interface DuracionModoService 
{
	public DuracionModo getById(long id) throws DuracionModoInexistenteException;
	public List<DuracionModo> listarModos();
}
