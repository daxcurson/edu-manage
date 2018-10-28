package edumanage.dao;

import java.util.List;

import edumanage.model.Clase;
import edumanage.model.HorarioCurso;

public interface ClaseDAO 
{
	public Clase getById(long id);
	public List<Clase> getClasesSuperpuestas(Clase clase);
	public List<Clase> getClasesSuperpuestas(HorarioCurso horario);
	public List<Clase> getEntreFechas(String desde,String hasta);
}
