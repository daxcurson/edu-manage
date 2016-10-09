package edumanage.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.ModalidadCursoDAO;
import edumanage.model.Curso;
import edumanage.model.IdiomaEstudiar;
import edumanage.model.ModalidadCurso;
import edumanage.model.ModalidadDisponible;
import edumanage.service.ModalidadCursoService;

@Service
public class ModalidadCursoServiceImpl implements ModalidadCursoService 
{
	@Autowired
	private ModalidadCursoDAO modalidadCursoDAO;
	
	@Override
	@Transactional
	public List<ModalidadCurso> listarModalidadesCurso() 
	{
		return modalidadCursoDAO.listarModalidadesCurso();
	}

	@Override
	@Transactional
	public void addModalidadCurso(ModalidadCurso modalidad_curso) 
	{
		modalidadCursoDAO.addModalidadCurso(modalidad_curso);
	}

	@Override
	@Transactional
	public List<IdiomaEstudiar> listarIdiomasAsignados(ModalidadCurso m) 
	{
		List<IdiomaEstudiar> lista=m.getIdiomas_asignados();
		return lista;
	}

	@Override
	@Transactional
	public ModalidadCurso getById(long id) 
	{
		return modalidadCursoDAO.getById(id);
	}

	@Override
	@Transactional
	public void editModalidadCurso(ModalidadCurso modalidad_curso) 
	{
		modalidadCursoDAO.edit(modalidad_curso);
	}

	@Override
	@Transactional
	public List<ModalidadCurso> listarModalidadesCursoPorIdioma(int idioma_estudiar_id, int tipo_curso_id)
	{
		return modalidadCursoDAO.listarModalidadesCursoPorIdiomaTipo(idioma_estudiar_id, tipo_curso_id);
	}

	@Override
	//Transactional
	public ModalidadDisponible agregarModalidadDisponible(Curso curso,long modalidad_curso_id) 
	{
		ModalidadDisponible m=new ModalidadDisponible();
		ModalidadCurso c=this.getById(modalidad_curso_id);
		m.setModalidad_curso(c);
		m.setPrecio_unidad_modalidad(c.getPrecio_unidad_modalidad());
		m.setMoneda(c.getMoneda());
		m.setCurso(curso);
		return m; // modalidadCursoDAO.grabarModalidadDisponible(m);
	}

	@Override
	public ModalidadDisponible leerModalidadDisponible(long id) 
	{
		return modalidadCursoDAO.getModalidadDisponibleById(id);
	}
	
}
