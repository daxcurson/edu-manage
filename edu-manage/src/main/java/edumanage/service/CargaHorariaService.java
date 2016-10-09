package edumanage.service;

import java.util.List;

import edumanage.model.CargaHoraria;

public interface CargaHorariaService 
{
	public CargaHoraria getById(long parseLong);
	public List<CargaHoraria> listarCargasHorarias();
	public void addCargaHoraria(CargaHoraria carga_horaria);
}
