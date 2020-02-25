package ar.com.strellis.edumanage.service;

import java.util.List;

import ar.com.strellis.edumanage.exceptions.ModalidadPagoInexistenteException;
import ar.com.strellis.edumanage.model.ModalidadPago;

public interface ModalidadPagoService 
{
	public ModalidadPago getById(long id) throws ModalidadPagoInexistenteException;
	public List<ModalidadPago> listarModalidadesPago();
}
