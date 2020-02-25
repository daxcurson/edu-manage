<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<form:form method="post" action="edit" commandName="group">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <tiles:insertAttribute name="form_group"/>
    <input type="submit" name="editar_grupo" value="Editar Grupo">
</form:form>