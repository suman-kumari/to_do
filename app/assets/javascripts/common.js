$(document).on("click", "[data-remote]", function(event){
    var link = $(this);
    showRemoteModal.load(link.attr('href'));
    event.preventDefault();
});

showRemoteModal = {
    load: function(url,heading) {
	
	heading = heading || "Todo";
	var heading = "<h3>" + heading + "</h3>";
	
	var modalHeaderDiv = "<div class='modal-header'>" + "<button type ='button' class='close' data-dismiss='modal' aria-hidden='true'>x</button>" + heading + "</div>";
	
	var footer = "<div class='modal-footer'><button class='btn btn-primary' data-dismiss='modal' aria-hidden='true'>Close</button></div>"
	
	var div = $("<div id='remote-modal' class='modal fade'>" + modalHeaderDiv + "<div class='modal-body'></div>" + footer + "</div>");
	
	div.find('.modal-body').load(url, heading);
		
	div
	    .on('hidden', function() {
		$('#remote-modal').remove();
		
	    })
	    .modal();
    }
}

