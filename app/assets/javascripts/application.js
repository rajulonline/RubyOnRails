// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require_tree
$(document).ajaxError(function(event, request) {
	var msg = request.getResponseHeader('X-Message');
	if (msg)
		alert(msg);
});

$(document).ready(function() {
	$("#Search_button").click(function() {
		var search_param = $("#Search_value").val();

		$.ajax({
			type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
			},
			data : {
				id : search_param
			},
			url : 'get_search_result',
			dataType : "script"
		});

	});
	// Handler for .ready() called.

});
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );



