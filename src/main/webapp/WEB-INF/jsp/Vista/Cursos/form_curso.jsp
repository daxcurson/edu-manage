<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-md-12">
	<fieldset>
		<div class="form-group col-md-12">
			<form:label path="codigo_curso">C&oacute;digo Curso</form:label>
			<form:input class="form-control" path="codigo_curso" />
			<form:errors path="codigo_curso" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="descripcion_curso">Descripci&oacute;n de Curso</form:label>
			<form:input class="form-control" path="descripcion_curso" />
			<form:errors path="descripcion_curso" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="horario_curso">Horario curso - descripcion de texto para mostrar en inscripcion</form:label>
			<form:input class="form-control" path="horario_curso" />
			<form:errors path="horario_curso" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="horario_curso">Libro</form:label>
			<form:input class="form-control" path="libro" />
			<form:errors path="libro" />
		</div>
		<div class="form-group col-md-12">
			<form:checkbox path="intensivo" />
			<form:label path="intensivo">Curso intensivo</form:label>
			<form:errors path="intensivo" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="fecha_comienzo">Fecha Comienzo</form:label>
			<form:input class="form-control" path="fecha_comienzo" id="CursoFechaComienzo" />
			<form:errors path="fecha_comienzo" />
		</div>
		<div class="form-group col-md-12">
			<form:label path="fecha_fin">Fecha Fin</form:label>
			<form:input class="form-control" path="fecha_fin" id="CursoFechaFin" />
			<form:errors path="fecha_fin" />
		</div>
		<div class="col-md-12">
			<h1>Modalidades de curso</h1>
			<p>
			Se podr&aacute;n agregar una o m&aacute;s modalidades a este curso, para que los estudiantes
			puedan anotarse.
			</p>
		</div>
		<div class="form-group col-md-12">
			<form:label path="idioma_estudiar">Idioma del Curso</form:label>
			<form:select class="form-control" path="idioma_estudiar" id="CursoIdiomaEstudiarId">
				<form:option value="0" label="Elija un idioma" />
				<form:options items="${idiomas}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group col-md-12">
			<form:select class="form-control" path="tipo_curso" id="CursoTipoCursoId">
				<form:options items="${tiposcurso}" itemValue="id" itemLabel="descripcion" />
			</form:select>
		</div>
		<div class="form-group col-md-12">
			<select class="form-control" name="modalidad_curso" id="CursoModalidadCursoId">
				<option value="0">No hay tipo de curso elegido ni idioma</option>
			</select>
			<input type="button" value="Agregar Modalidad" id="BotonAgregarModalidad" />
			<div id="ModalidadesDisponibles">
				<table class="table">
					<tr><th>Elegir</th><th>Descripci&oacute;n</th><th>Carga horaria</th><th>Duraci&oacute;n cantidad</th><th>Duraci&oacute;n modo</th><th>Precio</th><th>Moneda</th><th>Modalidad</th></tr>
					<c:choose>
						<c:when test="${not empty modalidades_disponibles}">
							<c:forEach items="${modalidades_disponibles}" var="modalidad">
								<tr>
									<td><input type="checkbox" name="modalidades_disponibles[${modalidad.id}]" value="${modalidad.id}" /></td>
									<td><c:out value="${modalidad.descripcion}" /></td>
									<td><c:out value="${modalidad.carga_horaria.descripcion}" /></td>
									<td><c:out value="${modalidad.duracion_modo.descripcion}" /></td>
									<td><c:out value="${modalidad.precio_unidad_modalidad}" /></td>
									<td><c:out value="${modalidad.moneda.descripcion}" /></td>
									<td><c:out value="${modalidad.modalidad_pago.descripcion}"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" style="text-align:center">-- No hay Modalidades elegidas --</td></tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		<div class="form-group col-md-12">
			<form:label path="nivel">Nivel</form:label>
			<form:select class="form-control" path="nivel">
			<form:options items="${niveles}" itemValue="id" itemLabel="descripcion" />
			</form:select>
			<form:errors path="nivel" />
		</div>
		<div class="form-group col-md-12">
			<h2>Cambiar la sucursal cambiar&aacute; la sucursal de todas las clases</h2>
			<form:label path="sucursal">Sucursal</form:label>
			<form:select class="form-control" path="sucursal">
				<form:options items="${sucursales}" itemValue="id" itemLabel="nombre" />
			</form:select>
			<form:errors path="sucursal" />
		</div>
	</fieldset>
</div>