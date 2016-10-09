<script type="text/javascript">
/**
 * Nuestro problema es el siguiente: hay que poner un cuadro para preguntar
 * si se abre el curso cuando esta en el estado N o A y se lo pasa al S.
 * 
 * Hay un campo oculto en el formulario de edicion de curso para decir si se abre o no
 * el curso. Si el estado anterior era N o A y se selecciona el estado S, preguntar si
 * hay que abrir el curso. Si hay que abrir, cambiar de valor la variable oculta. Si
 * el estado es S, y se cambia de valor, preguntar si se quiere cerrar el curso. 
 */
$("CursoEditForm").submit(
{
	var estadoCurso=<?php echo $curso['Curso']['abierto']; ?>;
	// Ahora examino el valor de la variable abierto.
	if($("CursoAbierto").val()!=estadoCurso)
	{
		// Hay que avisar.
		if((estadoCurso=="N" || estadoCurso=="A") && $("CursoAbierto").val()=="S")
		{
			// Hay que abrir el curso.
			var resp=confirm("Desea abrir el curso? No tiene suficientes alumnos!")
		}
	}
}
);
</script>