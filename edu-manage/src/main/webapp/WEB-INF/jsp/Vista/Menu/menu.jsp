<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Conjunto de tarjetas con alguna informacion que tiene que estar a primera vista 
-->

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Men&uacute; principal</h1>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
		    <div class="row">
    		    <div class="col-md-4">
        		    <div class="card">
        		    	<div class="card-header">
                		    <h3 class="card-title">Estudiantes que terminan hoy</h3>
        		    	</div>
            		    <div class="card-body">
                    		<tiles:insertAttribute name="inscripcion_estudiantes_terminan_hoy"/>
		                </div>
    		        </div>
        		</div>
	        	<div class="col-md-4">
	    	    </div>
    	    	<div class="col-md-4">
	    	    </div>
	    	</div>
		</div>

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
	</div>
</div>