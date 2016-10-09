	<style>
	.ui-autocomplete-loading { background: white url('img/ui-anim_basic_16x16.gif') right center no-repeat; }
	</style>
	<script>
	$(function() 
	{
		function log(message) 
		{
			$("<div/>").text(message).prependTo("#log");
			$("#log").scrollTop(0);
		}

		$("#birds").autocomplete(
		{
			source: "../../personas",
			minLength: 2,
			select: function( event, ui ) 
			{
				log( ui.item ?
					"Selected: " + ui.item.value + " aka " + ui.item.id :
					"Nothing selected, input was " + this.value );
			}
		});
	});
	</script>



<div class="demo">

<div class="ui-widget">
	<label for="birds">Birds: </label>
	<input id="birds" />
</div>

<div class="ui-widget" style="margin-top:2em; font-family:Arial">
	Result:
	<div id="log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
</div>

</div><!-- End demo -->
