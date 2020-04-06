package ar.com.strellis.edumanage.model.propertyeditor;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.AttributeConverter;

public class DateConverter implements AttributeConverter<String,Date>
{

	@Override
	public Date convertToDatabaseColumn(String attribute)
	{
		// Convertimos la fecha del atributo a una columna de la base de datos.
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try
		{
			return sdf.parse(attribute);
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String convertToEntityAttribute(Date dbData)
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(dbData);
	}

}
