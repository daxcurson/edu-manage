package ar.com.strellis.edumanage.model;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.usertype.UserType;

public class CursoEstadoUserType implements UserType
{
	static Logger log = LogManager.getLogger(CursoEstadoUserType.class);

	@Override
	public int[] sqlTypes() 
	{
		log.trace("estoy en sqlTypes");
		return new int[] {Types.VARCHAR};
	}

	@Override
	public Class<CursoEstado> returnedClass() 
	{
		log.trace("Estoy en returnedClass");
		return CursoEstado.class;
	}

	@Override
	public boolean equals(Object x, Object y) throws HibernateException 
	{
		log.trace("Estoy en equals");
		if(x!=null && y!=null)
		{
			CursoEstado xEstado=(CursoEstado) x;
			CursoEstado yEstado=(CursoEstado) y;
			if(xEstado!=null && xEstado!=null
					&& xEstado.nombre!=null && xEstado.nombre!=null
					&& xEstado.nombre.equals(yEstado.nombre))
				return true;
		}
		return false;
	}

	@Override
	public int hashCode(Object x) throws HibernateException 
	{
		return x.hashCode();
	}
	@Override
	public Object nullSafeGet(ResultSet rs, String[] names, SharedSessionContractImplementor session, Object owner)
			throws HibernateException, SQLException 
	{
		// Null safe validations should be included
		log.trace("Estoy en nullSafeGet");
		String name = rs.getString(names[0]);
		switch (name) 
		{
		case CursoAbierto.ABIERTO:
			log.trace("Creo un nuevo estado abierto");
			return new CursoAbierto();
		case CursoBaja.BAJA:
			log.trace("Creo un nuevo estado baja");
			return new CursoBaja();
		case CursoCerrado.CERRADO:
			log.trace("Creo un nuevo estado cerrado");
			return new CursoCerrado();
		case CursoEsperandoEstudiantes.ESPERANDO_ESTUDIANTES:
			log.trace("Creo un nuevo estado esperando estudiantes");
			return new CursoEsperandoEstudiantes();
		case CursoEsperandoProfesor.ESPERANDO_PROFESOR:
			log.trace("Creo un nuevo estado esperando profesor");
			return new CursoEsperandoProfesor();
		default:
			log.trace("Creo un nuevo estado invalido");
			throw new RuntimeException("Estado invalido");
		}
	}
	@Override
	public void nullSafeSet(PreparedStatement st, Object value, int index, SharedSessionContractImplementor session)
			throws HibernateException, SQLException 
	{
		log.trace("Estoy en nullSafeSet");
		// Aqui puedo llegar a recibir un String...! O sea que tengo que buscar 
		// que string se parece a uno de mis nombres de estado, y asignar eso.
		CursoEstado estado=null;
		if(value instanceof String)
			estado=CursoEstadoFactory.crearEstado((String)value);
		else
			estado=(CursoEstado) value;
		st.setString(index, estado.nombre);
	}

	@Override
	public Object deepCopy(Object value) throws HibernateException {
		return value;
	}

	@Override
	public boolean isMutable() {
		log.trace("Estoy en isMutable");
		return true;
	}

	@Override
	public Serializable disassemble(Object value) throws HibernateException {
		return (Serializable) deepCopy(value);
	}

	@Override
	public Object assemble(Serializable cached, Object owner) throws HibernateException {
		return (Serializable) deepCopy(cached);
	}

	@Override
	public Object replace(Object original, Object target, Object owner) throws HibernateException {
		return deepCopy(original);
	}

}