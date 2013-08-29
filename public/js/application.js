$(document).ready(function() {

  $('#new_post').on('click', function(e){
    e.preventDefault();
    $('#edit_form').show();

    $('#post_form').on('submit', function(e){
      e.preventDefault();
      var $form_data = $('#post_form').serialize()
      console.log($form_data);
      $.post('/post/new', $form_data, function(response){
        //response unused
      })
    });
  });
});
