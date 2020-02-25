package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.NacionalidadInexistenteException;
import ar.com.strellis.edumanage.model.Nacionalidad;

public interface NacionalidadService 
{
	public Nacionalidad getById(long id) throws NacionalidadInexistenteException;
	public List<Nacionalidad> listarNacionalidades();
}
