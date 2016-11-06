package edumanage.model;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.usertype.UserType;

public class PersonaEstadoUserType implements UserType
{
	static Logger log = Logger.getLogger(PersonaEstadoUserType.class);

	@Override
	public int[] sqlTypes() 
	{
		log.trace("estoy en sqlTypes");
		return new int[] {Types.VARCHAR};
	}

	@Override
	public Class<PersonaEstado> returnedClass() 
	{
		log.trace("Estoy en returnedClass");
		return PersonaEstado.class;
	}

	@Override
	public boolean equals(Object x, Object y) throws HibernateException 
	{
		log.trace("Estoy en equals");
		PersonaEstado xEstado=(PersonaEstado) x;
		PersonaEstado yEstado=(PersonaEstado) y;
		if(xEstado.getDescripcion()==yEstado.getDescripcion())
			return true;
		else
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
		int name = rs.getInt(names[0]);
		switch (name) 
		{
		case PersonaEstadoInteresada.INTERESADO:
			log.trace("Creo un nuevo estado interesado");
			return new PersonaEstadoInteresada();
		case PersonaEstadoPendiente.PENDIENTE:
			log.trace("Creo un nuevo estado pendiente");
			return new PersonaEstadoPendiente();
		case PersonaEstadoEstudiante.ESTUDIANTE:
			log.trace("Creo un nuevo estado estudiante");
			return new PersonaEstadoEstudiante();
		case PersonaEstadoEstudianteSinCuotas.ESTUDIANTE_SIN_CUOTAS:
			log.trace("Creo un nuevo estado estudiante sin cuotas");
			return new PersonaEstadoEstudianteSinCuotas();
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
		PersonaEstado estado=(PersonaEstado) value;
		st.setString(index, estado.getDescripcion());
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
