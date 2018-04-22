import Vue from 'vue'
import VueResource from 'vue-resource'
import VuePaginator from 'vuejs-paginator'

Vue.use(VueResource)
$(document).ready(function() {
	$("#filtroCursos").structFilter({
		fields : [ 
			{id : "lastname",type : "text",	label : "Lastname"}, 
			{id : "firstname",type : "text",label : "Firstname"}, 
			{id : "active",type : "boolean",label : "Is active"}, 
			{id : "age",type : "number",label : "Age"}, 
			{id : "bday",type : "date",label : "Birthday"}, 
			{id : "category",type : "list",label : "Category",
			list : [
				{id : "1",label : "Family"}, 
				{id : "2",label : "Friends"}, 
				{id : "3",label : "Business"}, 
				{id : "4",label : "Acquaintances"}, 
				{id : "5",label : "Other"}
			]
		} ]
	});
	var tabla_paginada=new Vue({
		el: '#tablaPaginada',
		data () {
			return {
				// The resource variable
				animals: [],
				// Here you define the url of your paginated API
				resource_url: 'http://hootlex.github.io/vuejs-paginator/samples/animals1.json'
			}
		},
		components: {
			VPaginator: VuePaginator
		},
		methods: {
			updateResource(data)
			{
				this.animals = data
			}
		}
	});
});