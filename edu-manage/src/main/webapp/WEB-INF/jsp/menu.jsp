<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<!-- 
				NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul>
					<li class="">						
						<a href="#" title="MenuPrincipal"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Menu Principal</span></a>
						<ul>
							<li class="">
								<a href="${pageContext.request.contextPath}/menu" title="MenuPrincipal"><span class="menu-item-parent">Men&uacute; Principal</span></a>
							</li>
						</ul>	
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/personas/index"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">Personas</span></a>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/personas/index">Inbox </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/personas/index">Email view </a>
							</li>
						</ul>	
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/inscripciones/index"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">Inscripciones</span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/cursos/index"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">Cursos</span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/profesores/index"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">Profesores</span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/configuracion/index"><i class="fa fa-lg fa-fw fa-gear"></i> <span class="menu-item-parent">Configuraci&oacute;n</span></a>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Informes</span></a>
						<ul>
							<li>
								<a href="ajax/flot.html">Flot Chart</a>
							</li>
							<li>
								<a href="ajax/morris.html">Morris Charts</a>
							</li>
							<li>
								<a href="ajax/sparkline-charts.html">Sparklines</a>
							</li>
							<li>
								<a href="ajax/easypie-charts.html">EasyPieCharts</a>
							</li>
							<li>
								<a href="ajax/dygraphs.html">Dygraphs</a>
							</li>
							<li>
								<a href="ajax/chartjs.html">Chart.js</a>
							</li>
							<li>
								<a href="ajax/hchartable.html">HighchartTable <span class="badge pull-right inbox-badge bg-color-yellow">new</span></a>
							</li>
						</ul>
					</li>
				</ul>