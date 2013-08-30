$(document).ready(function() {

  $('#new_post').on('click', function(e){
    e.preventDefault();
    $('#new_form').show();

    $('#post_form').on('submit', function(e){
      e.preventDefault();
      var $form_data = $('#post_form').serialize()
      $.post('/post/new', $form_data);
    });
  });


  $('#click_edit').on('click',  function(e){
    e.preventDefault();
    $('#edit_form').show();
  });

  $('#click_delete').on('click',  function(e){
    e.preventDefault();
    $('#delete_form').show();
  });

});
