<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Edu-Manage</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			<c:set var="class" value=""/>
			<c:if test=${empty controller}>
			<c:set var="class" value="active"/>
			</c:if>
				<li class="${class}"><a href="${pageContext.request.contextPath}/menu">Pantalla Inicial</a></li>
				<sec:authorize access="hasRole('ROLE_PERSONAS_MOSTRAR_MENU')">
            <c:if test=${controller=="Personas"}>
            <c:set var="class" value="active"/>
            </c:if>
					<li class="${class}"><a href="${pageContext.request.contextPath}/personas/">Personas</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_INSCRIPCIONES_MOSTRAR_MENU')">
            <c:if test=${controller=="Inscripciones"}>
            <c:set var="class" value="active"/>
            </c:if>
					<li  class="${class}"><a href="${pageContext.request.contextPath}/inscripciones/">Inscripciones</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_CURSOS_MOSTRAR_MENU')">
            <c:if test=${controller=="Cursos"}>
            <c:set var="class" value="active"/>
            </c:if>
					<li class="${class}"><a href="${pageContext.request.contextPath}/cursos/">Cursos</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_PROFESORES_SERVICE')">
            <c:if test=${controller=="Profesores"}>
            <c:set var="class" value="active"/>
            </c:if>
					<li class="${class}"><a href="${pageContext.request.contextPath}/profesores/">Profesores</a></li>
				</sec:authorize>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="hasRole('ROLE_USER')">
					<li>
						<c:url value="/j_spring_security_logout" var="logoutUrl"/>
						<a href="${logoutUrl}">Salir</a>
					</li>
				</sec:authorize>
			</ul>
		</div><!--/.nav-collapse -->
	</div>