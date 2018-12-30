<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Edu-Manage</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<c:set var="clase" value="" />
			<c:if test="${empty controller || controller=='Menu'}">
				<c:set var="clase" value="active" />
			</c:if>
			<li class="${clase}"><a
				href="${pageContext.request.contextPath}/menu"><spring:message code="label.pantalla_inicial"/></a></li>
			<sec:authorize access="hasRole('ROLE_PERSONAS_MOSTRAR_MENU')">
				<c:set var="clase_personas" value="" />
				<c:if test="${controller=='Personas'}">
					<c:set var="clase_personas" value="active" />
				</c:if>
				<li class="${clase_personas}"><a
					href="${pageContext.request.contextPath}/personas/"><spring:message code="label.personas"/></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_INSCRIPCIONES_MOSTRAR_MENU')">
				<c:set var="clase_inscripciones" value="" />
				<c:if test="${controller=='Inscripciones'}">
					<c:set var="clase_inscripciones" value="active" />
				</c:if>
				<li class="${clase_inscripciones}"><a
					href="${pageContext.request.contextPath}/inscripciones/"><spring:message code="label.inscripciones"/></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_CURSOS_MOSTRAR_MENU')">
				<c:set var="clase_cursos" value="" />
				<c:if test="${controller=='Cursos'}">
					<c:set var="clase_cursos" value="active" />
				</c:if>
				<li class="${clase_cursos}"><a
					href="${pageContext.request.contextPath}/cursos/"><spring:message code="label.cursos"/></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_PROFESORES_SERVICE')">
				<c:set var="clase_profesores" value="" />
				<c:if test="${controller=='Profesores'}">
					<c:set var="clase_profesores" value="active" />
				</c:if>
				<li class="${clase_profesores}"><a
					href="${pageContext.request.contextPath}/profesores/"><spring:message code="label.profesores"/></a></li>
			</sec:authorize>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"><spring:message code="label.configuracion"/> <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<sec:authorize access="hasRole('ROLE_CONFIGURACION_MOSTRAR_MENU')">
						<li><a
							href="${pageContext.request.contextPath}/configuracion/index"><spring:message code="label.menu_configuracion"/></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_CARGA_HORARIA_MOSTRAR_MENU')">
						<li><a
							href="${pageContext.request.contextPath}/cargas_horarias/index"><spring:message code="label.carga_horaria"/></a></li>
					</sec:authorize>
					<sec:authorize
						access="hasRole('ROLE_MODALIDAD_CURSOS_MOSTRAR_MENU')">
						<li><a
							href="${pageContext.request.contextPath}/modalidades_curso/index"><spring:message code="label.modalidad_curso"/></a></li>
					</sec:authorize>
					<li role="separator" class="divider"></li>
					<li class="dropdown-header"><spring:message code="label.permisos_accesos"/></li>
					<sec:authorize access="hasRole('ROLE_USERS_ADMINISTRAR')">
						<li><a href="${pageContext.request.contextPath}/users/index"><spring:message code="label.usuarios"/></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_GROUPS_ADMINISTRAR')">
						<li><a href="${pageContext.request.contextPath}/groups/index"><spring:message code="label.grupos"/></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_PERMISOS_MOSTRAR_MENU')">
						<li><a
							href="${pageContext.request.contextPath}/permisos/index"><spring:message code="label.permisos"/></a></li>
					</sec:authorize>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<sec:authorize access="hasRole('ROLE_USER')">
				<li><c:url value="/users/logout" var="logoutUrl" />
					<a href="${logoutUrl}"><spring:message code="label.salir"/></a></li>
			</sec:authorize>
		</ul>
	</div>
	<!--/.nav-collapse -->
</div>