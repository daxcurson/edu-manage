package edumanage.dao;

import java.util.List;

import edumanage.model.ModalidadPago;

public interface ModalidadPagoDAO 
{
	public List<ModalidadPago> listarModalidadesPago();

	public ModalidadPago getById(long id);
}
