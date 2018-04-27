//import Vue from 'vue';
//import VueResource from 'vue-resource';
//import VuePaginator from 'vuejs-paginator';

Vue.use(VueResource)
$(document).ready(function() {
	$("#filtroCursos").structFilter({
		fields : [ 
			{id : "id",type : "number",	label : "Id"}, 
			{id : "codigo_curso",type : "text",label : "Codigo Curso"}, 
			{id : "descripcion_curso",type : "text",label : "Descripcion Curso"}, 
			{id : "fecha_comienzo",type : "date",label : "Fecha Comienzo"}, 
			{id : "fecha_fin",type : "date",label : "Fecha Fin"}, 
			{id : "vigente",type : "boolean",label : "Vigente"},
			{id : "estado",type : "list",label : "Estado",
			list : [
				{id : "S",label : "Abierto"}, 
				{id : "N",label : "Cerrado"}, 
				{id : "A",label : "Esperando Alumnos"}, 
				{id : "E",label : "Esperando Profesor"}, 
				{id : "B",label : "Baja"}
			]
		} ]
	});
	var tabla_paginada=new Vue({
		el: '#tablaPaginada',
		data () {
			return {
				// The resource variable
				cursos: [],
				// Here you define the url of your paginated API
				resource_url: '${pageContext.request.contextPath}/cursos/listar_cursos?'+$("#filtroCursos").structFilter("valUrl")
			}
		},
		components: {
			VPaginator: VuePaginator
		},
		methods: {
			updateResource(data)
			{
				this.cursos = data
			}
		}
	});
	$("#filtroCursos").on("change.search", function(event)
			{
				// do something
				tabla_paginada.$refs.tablaCursos.fetchData('${pageContext.request.contextPath}/cursos/listar_cursos?'+$("#filtroCursos").structFilter("valUrl"));
			});
			$("#filtroCursos").on("submit.search", function(event)
			{
				tabla_paginada.$refs.tablaCursos.fetchData('${pageContext.request.contextPath}/cursos/listar_cursos?'+$("#filtroCursos").structFilter("valUrl"));
			});
});
