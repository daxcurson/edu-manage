$(document).ready(function()
{
	var dataContainer=$('#lista_cursos');
	$('#lista_cursos')
		.pagination(
				{
					dataSource : '${pageContext.request.contextPath}/cursos/listar_cursos',
					locator : 'items',
					totalNumber : 120,
					pageSize : 20,
					ajax : {
						beforeSend : function() {
							dataContainer
									.html('Loading data from flickr.com ...');
						}
					},
					callback : function(data, pagination) {
						// template method of yourself
						var html = template(data);
						dataContainer.html(html);
					}
				});
});