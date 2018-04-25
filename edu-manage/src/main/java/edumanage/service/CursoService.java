package edumanage.service;

import java.util.List;

import edumanage.model.*;
import edumanage.model.listados.ListadoPaginado;

public interface CursoService
{
	public Curso getById(long parseLong);
	public void addCurso(Curso curso);
	public List<TipoCurso> listarTiposCurso();
	public List<ModalidadPago> listarModalidadesPago();
	public List<Moneda> listarMonedas();
	public List<IdiomaEstudiar> listarIdiomasEstudiar();
	public List<Nivel> listarNiveles();
	public List<Sucursal> listarSucursales();
	public List<Inscripcion> listarIntegrantesCurso(CursoGenerico curso);
	public List<Curso> listarCursosVigentes();
	public ListadoPaginado<Curso> listarCursos(int firstResult, int maxResults);
	public List<Curso> listarCursosIdiomaNivel(int idioma,int nivel);
	public List<Curso> listarCursosSinClases();
	public List<Curso> listarCursosNoTerminados(int tipo_curso_id, int idioma_estudiar_id, int nivel_id);
	public void save(CursoGenerico curso);
	public void asignarNuevoProfesor(Curso curso);
	public void planificarClases(Curso curso);
	
	public void cambiarEstado(CursoGenerico curso,CursoEstado nuevoEstado);
	public void realizarAperturaCurso(CursoGenerico curso);
	public void recibirInscripto(CursoGenerico curso,Inscripcion insc);
	
}
