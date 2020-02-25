package ar.com.strellis.edumanage.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.com.strellis.edumanage.dao.FeriadosDAO;
import ar.com.strellis.edumanage.model.Feriado;
import ar.com.strellis.edumanage.service.ConfiguracionService;

@Service
public class ConfiguracionServiceImpl implements ConfiguracionService 
{
	@Autowired
	private FeriadosDAO feriadosDAO;
	@Override
	public List<Feriado> listarFeriados(Date desde,Date hasta) 
	{
		return feriadosDAO.findEntreFechas(desde,hasta);
	}
}
