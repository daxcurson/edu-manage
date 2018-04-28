package edumanage.model;

public class CursoEstadoFactory
{
	public static CursoEstado crearEstado(String queEstado)
	{
		switch(queEstado)
		{
		case "S":return new CursoAbierto();
		case "B":return new CursoBaja();
		case "N":return new CursoCerrado();
		case "A":return new CursoEsperandoEstudiantes();
		case "E":return new CursoEsperandoProfesor();
		default: return new CursoCerrado();
		}
	}
}
