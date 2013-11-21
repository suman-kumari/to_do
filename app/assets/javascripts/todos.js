$(function() {
    $( ".datepicker" ).datepicker({
	dateFormat: 'dd-mm-yy'
    });
});


$(document).ready(function(){
    $('.checkbox').each(function(){
	if ($(this).is(':checked'))
	{
	    $(this).parent().prev().prev().css("text-decoration","line-through");
	}
	else
	{
	    $(this).parent().prev().prev().css("text-decoration", "none");
	}

    });

    $('.checkbox').click(function(){
	var id= $(this).parents('tr').attr('id');
	var checked= $(this).is(':checked')
	$.ajax({
	    url: "/todos/"+id,
	    type: "PATCH",
	    data: { completed : checked },
	    dataType: "script"
	/*,
	    success: function(data)
	    {
		$('.checkbox').hide();
	    } */
	});
    });
});



