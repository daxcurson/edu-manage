<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Inscripciones</h1>

<ul>
<li><a href="${pageContext.request.contextPath}/inscripciones/inscribir">Inscribir nuevo estudiante</a></li>
<li><a href="${pageContext.request.contextPath}/inscripciones/listar_inscripciones_confirmar">Listar inscripciones a confirmar</a></li>
</ul>