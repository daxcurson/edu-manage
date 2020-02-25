package ar.com.strellis.edumanage.service;

import java.util.List;
import java.util.Map;

import ar.com.strellis.edumanage.exceptions.CursoInexistenteException;
import ar.com.strellis.edumanage.model.*;

public interface CursoService
{
	public Curso getById(long parseLong) throws CursoInexistenteException;
	public void addCurso(Curso curso);
	public List<TipoCurso> listarTiposCurso();
	public List<ModalidadPago> listarModalidadesPago();
	public List<Moneda> listarMonedas();
	public List<IdiomaEstudiar> listarIdiomasEstudiar();
	public List<Nivel> listarNiveles();
	public List<Sucursal> listarSucursales();
	public List<Inscripcion> listarIntegrantesCurso(CursoGenerico curso);
	public List<Curso> listarCursosVigentes();
	public List<Curso> listarCursos(Map<String, String> requestParams,int resultsPerPage);
	public List<Curso> listarCursosSinClases();
	public void save(CursoGenerico curso);
	public void asignarNuevoProfesor(Curso curso);
	public void planificarClases(Curso curso);
	
	public void cambiarEstado(CursoGenerico curso,CursoEstado nuevoEstado);
	public void realizarAperturaCurso(CursoGenerico curso);
	public void recibirInscripto(CursoGenerico curso,Inscripcion insc);
	List<Curso> listarCursosIdiomaNivel(IdiomaEstudiar idioma, Nivel nivel);
	
}
