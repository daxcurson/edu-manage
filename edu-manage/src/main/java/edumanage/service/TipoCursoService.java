package edumanage.service;

import java.util.List;

import edumanage.model.TipoCurso;

public interface TipoCursoService 
{
	public List<TipoCurso> listarTiposCurso();
	public TipoCurso getById(long parseLong);
}
