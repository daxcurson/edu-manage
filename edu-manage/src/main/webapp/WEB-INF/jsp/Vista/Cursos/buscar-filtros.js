$(document).ready(function()
{
	$("#tablaPaginada").jsGrid({
		width : "100%",
		height : "400px",

		inserting : true,
		editing : true,
		sorting : true,
		paging : true,
		filtering: true,

		data : [],
		controller:{
			loadData: function(filter)
			{
				cargarCursos(filter)
			},
			insertItem:$.noop,
			updateItem:$.noop,
			deleteItem:$.noop
		},

		fields : [ {
			name : "id",
			type : "number",
			width : 4
		}, {
			name : "codigo_curso",
			type : "text",
			width : 50
		}, {
			name : "descripcion_curso",
			type : "text",
			width : 200
		}, {
			name : "fecha_comienzo",
			type : "date",
			width : 10
		}, {
			name : "vigente",
			type : "checkbox",
			title : "Vigente",
			sorting : false
		}, {
			type : "control"
		} ]
	});
});
function cargarCursos(filter)
{
	var url="${pageContext.request.contextPath}/cursos/listar_cursos";
	// Aca irian parametros.
	var d=$.Deferred();
	$.getJSON(url,function(data)
	{
		d.resolve(data.value);
	});
	return d.promise();
}