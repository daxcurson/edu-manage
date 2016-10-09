package edumanage.dao;

import java.util.List;

import edumanage.model.TipoCurso;

public interface TipoCursoDAO 
{
	public List<TipoCurso> listarTiposCurso();
	public TipoCurso getById(long parseLong);
}
