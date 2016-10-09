package edumanage.service;
import java.util.*;

import edumanage.model.*;

public interface ModalidadCursoService 
{
	public List<ModalidadCurso> listarModalidadesCurso();
	public List<IdiomaEstudiar> listarIdiomasAsignados(ModalidadCurso m);

	public void addModalidadCurso(ModalidadCurso modalidad_curso);
	public ModalidadCurso getById(long id);
	public void editModalidadCurso(ModalidadCurso modalidad_curso);
	public List<ModalidadCurso> listarModalidadesCursoPorIdioma(int idioma_estudiar_id, int tipo_curso_id);
	public ModalidadDisponible agregarModalidadDisponible(Curso curso,long modalidad_curso_id);
	public ModalidadDisponible leerModalidadDisponible(long id);
}
