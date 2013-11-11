$(function() {
  $('.checkbox').change(function() {
    var value = $(this).is(':checked');
    var id = $(this).parent()[0].id;
    $.ajax({
      url: "todos/"+id,
      type: "PATCH",
      data: { completed: value },
      dataType: "ajax"
    });
  });
});


