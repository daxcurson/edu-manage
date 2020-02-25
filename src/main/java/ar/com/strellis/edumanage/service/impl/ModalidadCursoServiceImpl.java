package ar.com.strellis.edumanage.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.strellis.edumanage.dao.IdiomaEstudiarDAO;
import ar.com.strellis.edumanage.dao.ModalidadCursoDAO;
import ar.com.strellis.edumanage.exceptions.IdiomaEstudiarInexistente;
import ar.com.strellis.edumanage.exceptions.ModalidadCursoInexistenteException;
import ar.com.strellis.edumanage.model.*;
import ar.com.strellis.edumanage.service.ModalidadCursoService;

@Service
public class ModalidadCursoServiceImpl implements ModalidadCursoService 
{
	@Autowired
	private ModalidadCursoDAO modalidadCursoDAO;
	@Autowired
	private IdiomaEstudiarDAO idiomaEstudiarDAO;
	
	@Override
	@Transactional
	public List<ModalidadCurso> listarModalidadesCurso() 
	{
		return modalidadCursoDAO.findAll();
	}

	@Override
	@Transactional
	public void addModalidadCurso(ModalidadCurso modalidad_curso) 
	{
		modalidadCursoDAO.save(modalidad_curso);
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
	public ModalidadCurso getById(long id) throws ModalidadCursoInexistenteException 
	{
		return modalidadCursoDAO.findById(id).orElseThrow(ModalidadCursoInexistenteException::new);
	}

	@Override
	@Transactional
	public void editModalidadCurso(ModalidadCurso modalidad_curso) 
	{
		modalidadCursoDAO.save(modalidad_curso);
	}

	@Override
	@Transactional
	public List<ModalidadCurso> listarModalidadesCursoPorIdioma(long idioma_estudiar_id, int tipo_curso_id) throws IdiomaEstudiarInexistente
	{
		IdiomaEstudiar idioma_estudiar=idiomaEstudiarDAO.findById(idioma_estudiar_id).orElseThrow(IdiomaEstudiarInexistente::new);
		return modalidadCursoDAO.findByIdiomaEstudiar(idioma_estudiar);
	}

	@Override
	//Transactional
	public ModalidadDisponible agregarModalidadDisponible(Curso curso,long modalidad_curso_id) throws ModalidadCursoInexistenteException 
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
		return modalidadCursoDAO.findModalidadDisponible(id);
	}
	
}
