package edumanage.service;

import java.util.List;

import edumanage.model.*;

public interface ModalidadPagoService 
{
	public ModalidadPago getById(long id);
	public List<ModalidadPago> listarModalidadesPago();
}
