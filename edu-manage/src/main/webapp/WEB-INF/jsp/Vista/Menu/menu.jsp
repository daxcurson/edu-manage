<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>Men&uacute; principal</h2>

<p>Bienvendo a la aplicaci&oacute;n LV-Studio. Haga click en alguna de las siguientes opciones para continuar.</p>

<ul>
<li><a href="${pageContext.request.contextPath}/personas/index">Personas</a></li>
<li><a href="${pageContext.request.contextPath}/inscripciones/index">Inscripciones</a></li>
<li><a href="${pageContext.request.contextPath}/cursos/index">Cursos</a></li>
<li><a href="${pageContext.request.contextPath}/profesores/index">Profesores</a></li>
<li><a href="${pageContext.request.contextPath}/honorarios/index">Honorarios</a></li>
<li><a href="${pageContext.request.contextPath}/configuracion/index">Configuraci&oacute;n</a></li>
</ul>