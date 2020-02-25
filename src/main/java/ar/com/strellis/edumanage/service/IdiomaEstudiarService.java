package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;

public interface IdiomaEstudiarService 
{
	public IdiomaEstudiar getById(long id) throws IdiomaEstudiarInexistente;
	public List<IdiomaEstudiar> listarIdiomasEstudiar();
}
