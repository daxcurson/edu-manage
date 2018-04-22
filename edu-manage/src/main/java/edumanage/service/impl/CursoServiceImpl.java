package edumanage.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationEventPublisher;
//import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edumanage.dao.*;
import edumanage.excepciones.ExceptionErrorAsignacionProfesor;
import edumanage.excepciones.ExceptionEstadoCursoInvalido;
import edumanage.model.*;
import edumanage.service.CursoService;

@Service
public class CursoServiceImpl implements CursoService //, ApplicationEventPublisherAware
{
	static Logger log = Logger.getLogger(CursoServiceImpl.class);
	
	@Autowired
	private TipoCursoDAO tipoCursoDAO;
	
	@Autowired
	private ModalidadPagoDAO modalidadPagoDAO;
	
	@Autowired
	private MonedaDAO monedaDAO;
	
	@Autowired
	private IdiomaEstudiarDAO idiomaEstudiarDAO;

	@Autowired
	private CursoDAO cursoDAO;
	
	@Autowired
	private NivelDAO nivelDAO;
	
	@Autowired
	private SucursalDAO sucursalDAO;
	
	@Autowired
	private InscripcionDAO inscripcionDAO;
	
	@Autowired
	private FeriadosDAO feriadosDAO;
	
	/*
	private ApplicationEventPublisher publisher;
	@Override
	public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) 
	{
		this.publisher=applicationEventPublisher;
	}
	*/
	
	@Override
	@Transactional
	public void addCurso(Curso curso) 
	{
		// Antes de grabar, tengo que asegurarme que el curso este Cerrado (abierto=N)
		curso.setAbierto(new edumanage.model.CursoCerrado());
		cursoDAO.addCurso(curso);
	}

	@Override
	@Transactional
	public List<TipoCurso> listarTiposCurso() 
	{
		return tipoCursoDAO.listarTiposCurso();
	}

	@Override
	@Transactional
	public List<ModalidadPago> listarModalidadesPago()
	{
		return modalidadPagoDAO.listarModalidadesPago();
	}

	@Override
	@Transactional
	public List<Moneda> listarMonedas() 
	{
		return monedaDAO.listarMonedas();
	}

	@Override
	@Transactional
	public List<IdiomaEstudiar> listarIdiomasEstudiar() 
	{
		return idiomaEstudiarDAO.listarIdiomasEstudiar();
	}

	@Override
	@Transactional
	public List<Nivel> listarNiveles() 
	{
		return nivelDAO.listarNiveles();
	}

	@Override
	@Transactional
	public List<Sucursal> listarSucursales()
	{
		return sucursalDAO.listarSucursales();
	}
	@Override
	@Transactional
	public List<Curso> listarCursosVigentes() 
	{
		return cursoDAO.listarCursosVigentes();
	}

	@Override
	public Curso getById(long parseLong) 
	{
		Curso curso=cursoDAO.getById(parseLong);
		Hibernate.initialize(curso.getHorario());
		return curso;

	}
	@Override
	@Transactional
	public List<Curso> listarCursosIdiomaNivel(int idioma, int nivel) 
	{
		List<Curso> listaCursos=cursoDAO.listarCursosIdiomaNivel(idioma,nivel);
		// Tengo que buscar las modalidades disponibles!
		for(Curso c:listaCursos)
		{
			Hibernate.initialize(c.getModalidades_disponibles());
			Hibernate.initialize(c.getHorario());
		}
		return listaCursos;
	}
	@Override
	@Transactional
	public List<Curso> listarCursosSinClases() 
	{
		List<Curso> listaCursos=cursoDAO.listarCursosSinClases();
		// Tengo que buscar las modalidades disponibles!
		for(Curso c:listaCursos)
		{
			Hibernate.initialize(c.getModalidades_disponibles());
			//Hibernate.initialize(c.getHorario());
		}
		return listaCursos;
	}

	@Override
	@Transactional
	public List<Curso> listarCursosNoTerminados(int tipo_curso_id, int idioma_estudiar_id, int nivel_id) 
	{
		List<Curso> listaCursos=cursoDAO.listarCursosNoTerminados(tipo_curso_id,idioma_estudiar_id,nivel_id);
		return listaCursos;
	}
	/**
	 * Cambia el estado de un curso
	 * @param curso
	 * @param evento
	 */
	@Override
	@Transactional
	public void cambiarEstado(CursoGenerico curso,CursoEstado estadoNuevo) 
	{
		// Hay que configurar el nuevo estado y grabar el curso.
		// Ademas hay que arrojar eventos.
		curso.setAbierto(estadoNuevo);
		cursoDAO.mergeCurso(curso);
	}

	@Override
	@Transactional
	public void save(CursoGenerico curso) 
	{
		cursoDAO.saveCurso(curso);
	}

	@Override
	public List<Inscripcion> listarIntegrantesCurso(CursoGenerico curso) 
	{
		return inscripcionDAO.buscarIntegrantesCurso(curso);
	}
	/**
	 * Abre un curso, carga cuotas a estudiantes, etc. Asume que la operacion
	 * de cambio de evento al estado abierto ya se hizo.
	 */
	@Override
	@Transactional
	public void realizarAperturaCurso(CursoGenerico curso)
	{
		log.trace("Estoy por abrir un curso!!!");
	}

	@Override
	/**
	 * Recibido cuando se confirma una inscripcion. Hay que hacer las operaciones
	 * de apertura de curso.
	 */
	@Transactional
	public void recibirInscripto(CursoGenerico curso, Inscripcion insc) 
	{
		log.trace("Recibo a un inscripto en el curso.");
		// Fundamental. Ahora que esta ingresando la persona, tenemos
		// que aumentar la cantidad de estudiantes en el curso,
		// para que todo lo demas funcione. 
		try
		{
			log.trace("La cantidad de inscriptos es: "+curso.getInscriptos());
			curso.setInscriptos(curso.getInscriptos()+1);
			CursoEstado estadoActual=curso.getAbierto();
			// Ahora voy y averiguo si tengo que cambiar de estado!
			log.trace("Antes de avisar al curso, la cantidad de inscriptos es: "+curso.getInscriptos());
			CursoEstado nuevoEstado=curso.getAbierto().inscripcionRecibida(insc);
			CursoGenerico cursoPersistente=cursoDAO.mergeCurso(curso);
			log.trace("Grabe el curso, la cantidad de inscriptos es: "+cursoPersistente.getInscriptos());
			if(nuevoEstado!=estadoActual)
			{
				this.cambiarEstado(cursoPersistente, nuevoEstado);
				// Si el curso se abre como resultado de esta inscripcion,
				// el evento es generado y capturado en otro lado. 
			}
		}
		catch(ExceptionEstadoCursoInvalido e)
		{
			// Estamos en un estado invalido para la operacion que hay que hacer. 
			// Quiza en vez de capturar la excepcion, deberiamos dejarla
			// para que sea arrojada y capturada en la interfaz grafica... Para pensar!
		}
	}

	@Override
	/**
	 * Realiza la accion de asignar el profesor!!!!
	 * 
	 */
	@Transactional
	public void asignarNuevoProfesor(Curso curso) throws ExceptionErrorAsignacionProfesor
	{
		// El curso tiene todo lo que hay que hacer. El horario
		// del curso, la asignacion de profesores, todo. Hay que ver si
		// todo esto que estamos haciendo funciona!
		// Si este curso tiene clases, hay que arrojar excepcion.
		if(curso.getClases().size()>0)
			throw new ExceptionErrorAsignacionProfesor("Este curso ya tiene clases");
		// Supuestamente ya esta validado que el profesor no tenga un horario superpuesto.
		// Eso se va a arrojar como excepcion cuando el curso este por grabarse. 
		// Aqui tengo que crear las clases. 
	}
	
	@Transactional
	public void planificarClases(Curso curso)
	{	
		for(HorarioCurso horario:curso.getHorario())
		{
			// Sutileza a tener en cuenta: si la fecha de comienzo cae en el
			// dia de semana seleccionado, "next ".$dia va a dar el dia de la proxima
			// semana, no hoy, y por tanto agregaria una clase menos.
			// Entonces: si el dia de comienzo de curso no es el dia de semana
			// seleccionado, la proxima clase va a ser en el dia de la semana requerido.
			//Si no, la proxima clase es la fecha de comienzo.
			Calendar calendarFechaComienzo=Calendar.getInstance();
			calendarFechaComienzo.setTime(curso.getFecha_comienzo());
			// Precisamente, por eso guardo Fechas en los horarios de curso!!!
			// Tengo una fecha pero lo unico que me interesa de esa fecha es el dia
			// de la semana!
			Calendar fechaClase=Calendar.getInstance();
			fechaClase.setTime(horario.getFecha());
			Date fechaProxClase;
			if(calendarFechaComienzo.get(Calendar.DAY_OF_WEEK)!=fechaClase.get(Calendar.DAY_OF_WEEK))
			{
				fechaProxClase=Clase.getNextOccurenceOfDay(curso.getFecha_comienzo(), fechaClase.get(Calendar.DAY_OF_WEEK));
			}
			else
				fechaProxClase=curso.getFecha_comienzo();
			// Hay que recuperar un feriado por mes. Me preparo para contarlos.
			// En el sistema php uso arrays que son con claves hash. Aca uso un hashmap.
			// La clave de ese hashmap va a ser la misma que el de php: el mes mas
			// el id del horario.
			HashMap<String,Integer> feriados=new HashMap<String,Integer>();
			while(fechaProxClase.before(curso.getFecha_fin()))
			{
				// Creo clases!
				Feriado feriadosHoy=feriadosDAO.buscarFeriadoEnFecha(fechaProxClase);
				if(feriadosHoy==null) // Hoy no hay feriado
				{
					Clase clase=new Clase();
					clase.setFecha_clase(fechaProxClase);
					clase.setHora_comienzo(horario.getHora_inicio());
					clase.setHora_fin(horario.getHora_fin());
					clase.setSucursal(horario.getSucursal());
					//clase.setDomicilio_clase(horario.getD);
					curso.getClases().add(clase);
				}
				else
				{
					// Hay que recuperar esta clase si hay un feriado en el mes!!!
					Calendar calendarioFechaProxClase=Calendar.getInstance();
					calendarioFechaProxClase.setTime(fechaProxClase);
					String claveFeriados=String.valueOf(calendarioFechaProxClase.get(Calendar.YEAR))+String.valueOf(calendarioFechaProxClase.get(Calendar.MONTH))+" "+horario.getCalendar_id();
					log.debug("Hay feriados este mes. La cantidad contabilizada para el mes "+String.valueOf(calendarioFechaProxClase.get(Calendar.YEAR))+String.valueOf(calendarioFechaProxClase.get(Calendar.MONTH))+" es "+feriados.get(claveFeriados));
					if(feriadosHoy!=null && feriados.get(claveFeriados)==0)
					{
						feriados.put(claveFeriados, feriados.get(claveFeriados)+1);
					}
				}
			}
		}
	}

	@Override
	public List<Curso> listarCursos()
	{
		return this.cursoDAO.listarCursos();
	}
}
