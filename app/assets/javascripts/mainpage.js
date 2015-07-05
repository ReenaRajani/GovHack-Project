function doneTyping (e) {
  e.parent().next().fadeIn( "slow" );
}


$( document ).ready(function() {

  //Key Up Timer Code/////////////////////////////////////////////////////
  var typingTimer;                //timer identifier
  var doneTypingInterval = 500;  //time in ms, 5 second for example

  //on keyup, start the countdown
  $('.triggerElement').keyup(function(){
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping($(this)), doneTypingInterval);
  });

  //on keydown, clear the countdown 
  $('.triggerElement').keydown(function(){
    clearTimeout(typingTimer);
  });


  $('.triggerSelect').change(function(){
    doneTyping($(this));
    $('#selectRegion').attr('text-align', 'center');
    $('#three').addClass('.inlineformelement');
  });


});