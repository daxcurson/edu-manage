package edumanage.dao;

import java.util.List;

import edumanage.model.CargaHoraria;

public interface CargaHorariaDAO 
{
	public CargaHoraria getById(long id);
	public List<CargaHoraria> listarCargasHorarias();
	public void addCargaHoraria(CargaHoraria carga_horaria);
}
