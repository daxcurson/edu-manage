package edumanage.dao;
import java.util.List;

import edumanage.model.Curso;
import edumanage.model.CursoGenerico;
import edumanage.model.listados.ListadoPaginado;
public interface CursoDAO 
{
	public List<Curso> listarCursosVigentes();
	public void addCurso(Curso curso);
	public void editCurso(Curso curso);
	public Curso getById(long parseLong);
	public List<Curso> listarCursosIdiomaNivel(int idioma,int nivel);
	public List<Curso> listarCursosSinClases();
	public List<Curso> listarCursosNoTerminados(int tipo_curso_id, int idioma_estudiar_id, int nivel_id);
	public void saveCurso(CursoGenerico curso);
	public CursoGenerico mergeCurso(CursoGenerico curso);
	ListadoPaginado<Curso> listarCursos(int firstResult, int maxResults);
}
