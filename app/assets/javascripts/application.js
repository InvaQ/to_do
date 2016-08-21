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

//= require_tree .
//= require jquery-ui
 


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

  $(".trash").on('click', function(){
    var task = $(this).parent().parent();
      $.ajax({
        method: 'delete',
        url: '/tasks/' + $(this).data('id'),
        dataType: "json",
        type: 'POST',
        data: {"_method": this.delete},
        success: function() {
          task.hide();
        }
      });
  });

  $(".complete").on('click', function(){
    var deadline = $('#clockdiv');
    var task = $('.task_edit');
    var target = $(this).parent();
      $.ajax({
        url: '/tasks/' + $(this).data('id-complete') + '/complete',        
        type: 'PATCH',
        data: {"complete_at": this.complete},
        success: function() {

            target.css( "background-color", "#c7c7c7" );
            task.hide();
             deadline.hide();        
        }
      });
  });

  /*$(".add-task").submit(function(data){
    var formData = $(".add-task").serialize();
    $.ajax({
        method: 'POST',
        url: '/tasks',
        dataType: "json",
        type: 'POST',
        data: formData,
        success: function(data) {

          $(".task-list").html(data)
        }
    });
  });*/

});
