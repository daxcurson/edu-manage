package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.IdiomaNativoInexistente;
import ar.com.strellis.edumanage.model.IdiomaNativo;

public interface IdiomaNativoService 
{
	public IdiomaNativo getById(long id) throws IdiomaNativoInexistente;
	public List<IdiomaNativo> listarIdiomasNativos();
}
