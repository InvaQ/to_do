
function isDateFuture(date) {
  return new Date().getTime() - date <= 0 ? true : false
}

function time_remaining(endtime){
  var now = new Date();
  var t = endtime*1000 - now + now.getTimezoneOffset() * 60000;
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  var days = Math.floor( t/(1000*60*60*24) );
  return {'total':t, 'days':days, 'hours':hours, 'minutes':minutes, 'seconds':seconds};
}

function run_clock(clock,endtime){
  var timeinterval = setInterval(function(){
    var t = time_remaining(endtime);
    if(t.total<=0)
      { clock.innerHTML = 'deadline is over!';
        clock.style.color = "red"
        return; }
    else {
      clock.innerHTML = 'deadline: '+t.days+'d '+t.hours+'h '+t.minutes+'m '+t.seconds+'s ';
    }
  },1000);
}


$(document).ready(function(){
  var tasks = $('.task');

  $.each(tasks, function(index, task) {
    var task = $(this);
    var deadline = task.data('deadline');
    var clockdiv = task.find('#clockdiv')[0];
    run_clock(clockdiv, deadline);
  });
});