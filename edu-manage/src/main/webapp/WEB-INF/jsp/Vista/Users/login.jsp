<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">Acceso al sistema Edu-Manage</h1>
						<div class="well no-padding">
							<form method="post" action="${pageContext.request.contextPath}/j_spring_security_check" id="login-form" class="smart-form client-form">
								<header>
									Sign In
								</header>
								<fieldset>
									
									<section>
										<label class="label">Login</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" name="j_username">
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Introduzca su nombre de usuario</b></label>
									</section>

									<section>
										<label class="label">Clave</label>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
											<input type="password" name="j_password">
											<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Introduzca la clave de acceso</b> </label>
										<div class="note">
											<a href="forgotpassword.html">Forgot password?</a>
										</div>
									</section>

									<section>
										<label class="checkbox">
											<input type="checkbox" name="_spring_security_remember_me" checked>
											<i></i>Stay signed in</label>
									</section>
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">
										Sign in
									</button>
								</footer>
							</form>

						</div>
						
						<h5 class="text-center"> - Or sign in using -</h5>
															
							<ul class="list-inline text-center">
								<li>
									<a href="javascript:void(0);" class="btn btn-primary btn-circle"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="javascript:void(0);" class="btn btn-info btn-circle"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="javascript:void(0);" class="btn btn-warning btn-circle"><i class="fa fa-linkedin"></i></a>
								</li>
							</ul>
						
					</div>
				</div>