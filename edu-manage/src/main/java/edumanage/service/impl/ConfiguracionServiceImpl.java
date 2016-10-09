package edumanage.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edumanage.dao.FeriadosDAO;
import edumanage.model.Feriado;
import edumanage.service.ConfiguracionService;

@Service
public class ConfiguracionServiceImpl implements ConfiguracionService 
{
	@Autowired
	private FeriadosDAO feriadosDAO;
	@Override
	public List<Feriado> listarFeriados(Date desde,Date hasta) 
	{
		return feriadosDAO.listarFeriados(desde,hasta);
	}
}
