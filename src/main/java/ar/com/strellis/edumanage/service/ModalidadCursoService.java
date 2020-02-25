package ar.com.strellis.edumanage.service;
import java.util.*;

import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.exceptions.ModalidadCursoInexistenteException;
import ar.com.strellis.edumanage.model.Curso;
import ar.com.strellis.edumanage.model.IdiomaEstudiar;
import ar.com.strellis.edumanage.model.ModalidadCurso;
import ar.com.strellis.edumanage.model.ModalidadDisponible;

public interface ModalidadCursoService 
{
	public List<ModalidadCurso> listarModalidadesCurso();
	public List<IdiomaEstudiar> listarIdiomasAsignados(ModalidadCurso m);

	public void addModalidadCurso(ModalidadCurso modalidad_curso);
	public ModalidadCurso getById(long id) throws ModalidadCursoInexistenteException;
	public void editModalidadCurso(ModalidadCurso modalidad_curso);
	public ModalidadDisponible agregarModalidadDisponible(Curso curso,long modalidad_curso_id) throws ModalidadCursoInexistenteException;
	public ModalidadDisponible leerModalidadDisponible(long id);
	List<ModalidadCurso> listarModalidadesCursoPorIdioma(long idioma_estudiar_id, int tipo_curso_id) throws IdiomaEstudiarInexistente;
}
