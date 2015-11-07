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

  $('.btn-share').bind('click touch', function(e){
    var taskId = $(this).data('task-id');
    var taskTitle = $(this).data('task-title');
    swal({
      title: taskTitle,
      text: "Escreva algo sobre esta ação:",
      type: "input",
      showCancelButton: true,
      closeOnConfirm: false,
      animation: "slide-from-top",
      inputPlaceholder: "Digite a sua mensagem",
      confirmButtonText: "Compartilhar",
      cancelButtonText: "Cancelar"
    },
    function(inputValue){
      if (inputValue === false) return false;

      // /tasks/:id/share(.:format)

      if (inputValue === "") {
        swal.showInputError("You need to write something!");
        return false
      }

      $.post('/tasks/' + taskId + '/share', {'message': inputValue}, function(data){
        if (data.sucess) {
          swal("Obaa!", "Ação compartilhada na sua Timeline", "success");
        } else {
          swal("Ops!", "Algo inesperado aconteceu", "error");
        };
      });


    });
  });

});

// $.post('/panel/wedding/published', {'option': $(this).bootstrapSwitch('state')}, function(data){
//   if (data.ok) {
//
//   } else {
//
//   };
//
// });
