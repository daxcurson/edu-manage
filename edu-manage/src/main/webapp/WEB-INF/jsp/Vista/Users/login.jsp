<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<h1 class="txt-color-red login-header-big">Acceso al sistema Edu-Manage</h1>
	<form method="post" action="${pageContext.request.contextPath}/j_spring_security_check" id="login-form">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<fieldset>
		<div class="form-group">
			<label for="UserUsername">Login</label>
			<input type="text" id="UserUsername" class="form-control" name="j_username">
		</div>
		<div class="form-group">
			<label for="UserPassword">Clave</label>
			<input type="password" id="UserPassword" class="form-control" name="j_password">
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox" name="_spring_security_remember_me" checked>Recordarme
			</label>
		</div>
	</fieldset>
	<footer>
		<button type="submit" class="btn btn-default">Sign in</button>
	</footer>
	</form>
</div>
<h5 class="text-center"> - Or sign in using -</h5>
	<ul class="list-inline text-center">
	<li>
		<a href="javascript:void(0);" class="btn">
		<img src="${pageContext.request.contextPath}/img/login-google.png"/>
		</a>
	</li>
	<li>
		<a href="javascript:void(0);" class="btn">
		<img src="${pageContext.request.contextPath}/img/login-facebook.png"/>
		</a>
	</li>
	</ul>