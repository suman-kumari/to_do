$(document).ready(function(){
    $('.checkbox').each(function(){
	if ($(this).is(':checked'))
	{
	    $(this).parent().prev().prev().css("color", "red");
	}
	else
	{
	    $(this).parent().prev().prev().css("color", "black");
	}

    });

    $('.checkbox').click(function(){
	if($(this).is(':checked'))
	{
	    $(this).parent().prev().prev().css("color", "red");
	}
	else
	{
	    $(this).parent().prev().prev().css("color", "black");
	}
	    
    });
});