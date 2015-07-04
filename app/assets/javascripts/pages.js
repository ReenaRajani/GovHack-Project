$(document).ready(function(){

$('.form_submit').on('click',function(e){
  e.preventdefault();
  $.ajax({
  url: '/details',
  dataType: 'json',
  }).done(function(response){
    $('#result_section').html(response)
  });
});
  
});
