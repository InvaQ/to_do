// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui
//= require jquery.turbolinks

$(document).ready(function() {

  $(".container-app").on("mouseover", ".task", function() {
      $(this).children(".control-task").css("display", "inline-block");
    }).on("mouseout", ".task", function() {
      $(this).children(".control-task").css("display", "none");
    });

  $(".container-app").on("mouseover", ".list-header", function() {
      $(this).children(".edit-list").css("display", "inline-block");
    }).on("mouseout", ".list-header", function() {
      $(this).children(".edit-list").css("display", "none");
    });

  $('.task-list').sortable({
    axis: 'y',
    update: function(){
      $.post('tasks/change_priority', $(this).sortable('serialize'));
    }
  });

  $(".task-check").on('click', function(){
      $.ajax({
        url: '/tasks/'+this.value+'/mark',
        type: 'POST',
        data: {"mark": this.checked}
      });
  });

});
