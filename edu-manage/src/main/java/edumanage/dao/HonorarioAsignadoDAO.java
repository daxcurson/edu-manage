package edumanage.dao;

import java.util.List;

import edumanage.model.HonorarioAsignado;

public interface HonorarioAsignadoDAO 
{
	public List<HonorarioAsignado> listarHonorariosAsignados(long profesorId);
}
