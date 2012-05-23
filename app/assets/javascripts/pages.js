$(document).ready(function() {
	$('#2ndimg').hide();
	$('#3rdimg').hide();
	$('#2ndtab').bind('click', function(event) {
		$('#2ndimg').slideDown();
	});
});
