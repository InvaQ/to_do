
function time_remaining(endtime){
  var now = new Date();
  var t = endtime*1000 - now + now.getTimezoneOffset() * 60000;
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  var days = Math.floor( t/(1000*60*60*24) );
  return {'total':t, 'days':days, 'hours':hours, 'minutes':minutes, 'seconds':seconds};
}
function run_clock(id,endtime){
  var clock = document.getElementById(id);
  var timeinterval = setInterval(function(){
    var t = time_remaining(endtime);
    clock.innerHTML = 'days: '+t.days+'<br>hours: '+t.hours+'<br>minutes: '+t.minutes+'<br>seconds: '+t.seconds;
    if(t.total<=0){ clearInterval(timeinterval); }
  },1000);
}

 
$(document).ready(function(){
  console.log( "ready!" );
  var deadline =  $('#clockdiv').data('deadline');
  
  run_clock('clockdiv',deadline);
});