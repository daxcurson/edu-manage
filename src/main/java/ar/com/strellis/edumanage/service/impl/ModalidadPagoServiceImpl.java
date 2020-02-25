package ar.com.strellis.edumanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.ModalidadPagoDAO;
import ar.com.strellis.edumanage.exceptions.ModalidadPagoInexistenteException;
import ar.com.strellis.edumanage.model.ModalidadPago;
import ar.com.strellis.edumanage.service.*;

@Service
public class ModalidadPagoServiceImpl implements ModalidadPagoService
{
	@Autowired
	private ModalidadPagoDAO modalidadPagoDAO;
	@Override
	@Transactional
	public ModalidadPago getById(long id) throws ModalidadPagoInexistenteException 
	{
		return modalidadPagoDAO.findById(id).orElseThrow(ModalidadPagoInexistenteException::new);
	}
	@Override
	@Transactional
	public List<ModalidadPago> listarModalidadesPago() 
	{
		return modalidadPagoDAO.findAll();
	}

}
