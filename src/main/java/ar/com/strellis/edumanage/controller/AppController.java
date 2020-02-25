package ar.com.strellis.edumanage.controller;

import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public abstract class AppController 
{
	private ApplicationContext context;
	private Locale locale;
	
	public AppController()
	{
		context=new ClassPathXmlApplicationContext("locale.xml");
	}
	
	public void autorizar()
	{
		// Aca controlamos si la persona esta autorizada
	}
	protected String getMessage(String cualMensaje)
	{
		locale=LocaleContextHolder.getLocale();
		return context.getMessage(cualMensaje, null, locale);
	}
}
