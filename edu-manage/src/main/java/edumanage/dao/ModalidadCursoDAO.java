package edumanage.dao;

import java.util.List;

import edumanage.model.ModalidadCurso;
import edumanage.model.ModalidadDisponible;

public interface ModalidadCursoDAO 
{
	public ModalidadCurso getById(long id);
	public List<ModalidadCurso> listarModalidadesCurso();
	public void addModalidadCurso(ModalidadCurso modalidad_curso);
	public void edit(ModalidadCurso modalidad_curso);
	public List<ModalidadCurso> listarModalidadesCursoPorIdiomaTipo(int idioma_estudiar_id, int tipo_curso_id);
	public ModalidadDisponible grabarModalidadDisponible(ModalidadDisponible m);
	public ModalidadDisponible getModalidadDisponibleById(long id);
}
