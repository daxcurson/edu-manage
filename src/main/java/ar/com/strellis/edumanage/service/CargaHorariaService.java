package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.CargaHorariaInexistenteException;
import ar.com.strellis.edumanage.model.CargaHoraria;

public interface CargaHorariaService 
{
	public CargaHoraria getById(long parseLong) throws CargaHorariaInexistenteException;
	public List<CargaHoraria> listarCargasHorarias();
	public void addCargaHoraria(CargaHoraria carga_horaria);
}
