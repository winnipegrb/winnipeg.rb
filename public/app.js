$(document).ready(function(){
  $('ul#past_events a').bind('click', function(){
    if($(this).attr('class') == 'off'){
      $('ul#past_events a.on').attr('class', 'off');
      $(this).attr('class', 'on');
      $('dl#past_events_info dd.on').attr('class', 'off');
      $('dl#past_events_info dd#'+$(this).attr('id')+'_info').attr('class', 'on');
    }
  });
});