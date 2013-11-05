$(function() {
  $("#todo_completed").click(function(){
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } 
    else {
      checked = false;
    } 
  });
  $.ajax({
    type: "PUT",
    url: "/todo/"#{todo.id}"",
    data: { $(this).is(':checked') }
  });  
});