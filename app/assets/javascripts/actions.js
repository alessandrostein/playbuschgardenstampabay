$(function () {

  $('.btn-ok').bind('click touch', function(e){
    var taskId = $(this).data('task-id');
    var resource = '/actions/' + taskId + '/participate';

    $.post(resource, function(data){
      alert("Obaaaaa!");
    });

  });

  $('.btn-confirmate').bind('click touch', function(e){
    var actionId = $(this).data('action-id');
    var resource = '/actions/' + actionId + '/confirmate';

    $.post(resource, function(data){
      alert("Confirmado!");
    });

  });

  $('.btn-finalize').bind('click touch', function(e){
    var actionId = $(this).data('action-id');
    var resource = '/actions/' + actionId + '/finalize';

    $.post(resource, function(data){
      alert("Finalizado!");
    });

  });

});
