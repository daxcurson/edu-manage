package ar.com.strellis.edumanage.service;

import java.util.*;

import ar.com.strellis.edumanage.model.Orientacion;
import ar.com.strellis.edumanage.service.impl.OrientacionInexistenteException;

public interface OrientacionService 
{
	public List<Orientacion> listarOrientaciones();
	public Orientacion getById(long parseLong) throws OrientacionInexistenteException;
}
