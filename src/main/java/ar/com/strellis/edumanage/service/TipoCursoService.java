package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.TipoCursoInexistenteException;
import ar.com.strellis.edumanage.model.TipoCurso;

public interface TipoCursoService 
{
	public List<TipoCurso> listarTiposCurso();
	public TipoCurso getById(long parseLong) throws TipoCursoInexistenteException;
}
