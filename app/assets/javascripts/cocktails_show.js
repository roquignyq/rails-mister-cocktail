$(document).ready(function() {
  $('.see-ingredients').on('click', function(event) {
    event.preventDefault();
    var id = $(this).attr('id').slice($(this).attr('id').lastIndexOf("_") + 1);
    $('#list_ingredient_' + id).toggleClass('hidden')
  });
});
