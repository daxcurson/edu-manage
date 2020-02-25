<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%@page session="true" %>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
<%@include file="/WEB-INF/jsp/Vista/Users/login.js" %>
</script>
<body>
	<div class="middlePage">
		<div class="page-header">
			<h1 class="logo">
				Edu-Manage <small><spring:message
						code="label.bienvenida_edu_manage" /></small>
			</h1>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title"><spring:message code="label.login"/></h3>
			</div>
			<div class="panel-body">

				<div class="row">
				<c:set var="lang">${sessionScope['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}</c:set>
					<div class="col-md-5">
					   <div class="spacing">
					   <spring:message code="label.idioma"/>
					   <select id="SelectIdioma" class="form-control input-md" name="idioma" onchange="cambiar_idioma()">
					   <option <c:if test="${lang=='en_US'}">selected</c:if> value="en_US">English</option>
					   <option <c:if test="${empty lang || lang=='es'}">selected</c:if> value="es">Castellano</option>
					   </select>
					   </div>
					   <div class="spacing">
						<a href="#"><img src="${pageContext.request.contextPath}/img/login-facebook.png" /></a><br />
					   </div>
					   <div class="spacing">
						<a href="#"><img src="${pageContext.request.contextPath}/img/login-google.png" /></a>
					   </div>
					</div>

					<div class="col-md-7"
						style="border-left: 1px solid #ccc; height: 160px">
						<form class="form-horizontal" method="post"
							action="${pageContext.request.contextPath}/j_spring_security_check"
							id="login-form">
							<fieldset>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<label for="UserUsername"><spring:message
										code="label.username" /></label>
								<input name="username" type="text"
									id="UserUsername" placeholder="" class="form-control input-md">
								<div class="spacing">
									<input type="checkbox" name="_spring_security_remember_me" id="checkboxes-0"
										value="1"><small><spring:message
											code="label.remember_me" /></small>
								</div>
								<label for="UserUsername"><spring:message
										code="label.password" /></label>
								<input id="UserPassword"
									name="password" type="password" placeholder=""
									class="form-control input-md">
								<div class="spacing">
									<a href="#"><small><spring:message
												code="label.olvido_password" /></small></a><br />
								</div>
								<button id="singlebutton" name="singlebutton"
									class="btn btn-info btn-sm pull-right">
									<spring:message code="label.ingresar" />
								</button>


							</fieldset>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>