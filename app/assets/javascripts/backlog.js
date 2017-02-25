var ready;
ready = function() {

	$("#story_modal_button").click(function(event) {
		event.preventDefault();
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);