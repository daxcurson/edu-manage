package edumanage.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import edumanage.dao.ClaseDAO;
import edumanage.model.Clase;
import edumanage.service.ClaseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClaseServiceImpl implements ClaseService 
{
	@Autowired
	private ClaseDAO claseDAO;
	@Override
	public List<Clase> listarClasesActivasEntreFechas(Date desde, Date hasta) 
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return claseDAO.getEntreFechas(sdf.format(desde), sdf.format(hasta));
	}
}
