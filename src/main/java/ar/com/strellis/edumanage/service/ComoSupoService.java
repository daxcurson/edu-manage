package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.ComoSupoInexistente;
import ar.com.strellis.edumanage.model.ComoSupo;

public interface ComoSupoService 
{
	public ComoSupo getById(long id) throws ComoSupoInexistente;
	public List<ComoSupo> listarComoSupo();
}
