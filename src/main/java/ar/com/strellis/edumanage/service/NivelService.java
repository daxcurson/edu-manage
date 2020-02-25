package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.NivelInexistenteException;
import ar.com.strellis.edumanage.model.Nivel;

public interface NivelService 
{
	public Nivel getById(long id) throws NivelInexistenteException;
	public List<Nivel> listarNiveles();
}
