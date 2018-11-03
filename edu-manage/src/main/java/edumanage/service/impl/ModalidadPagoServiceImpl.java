package edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.ModalidadPagoDAO;
import edumanage.model.ModalidadPago;
import edumanage.service.*;

@Service
public class ModalidadPagoServiceImpl implements ModalidadPagoService
{
	@Autowired
	private ModalidadPagoDAO modalidadPagoDAO;
	@Override
	@Transactional
	public ModalidadPago getById(long id) 
	{
		return modalidadPagoDAO.getById(id);
	}
	@Override
	@Transactional
	public List<ModalidadPago> listarModalidadesPago() 
	{
		return modalidadPagoDAO.listarModalidadesPago();
	}

}
