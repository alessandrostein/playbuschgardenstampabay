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

  $('.btn-comments').bind('click touch', function(e){
    if ($(".show-comments").is(":visible") == true ) {
      $(".show-comments").hide('slow');
    } else {
      $(".show-comments").show('slow');
    }
  });

  $('.btn-remove-post').bind('click touch', function(e){
    var postId = $(this).data('post-id');
    swal({
      title: "Você tem certeza que deseja excluir?",
      text: "Ao exluir a sua postagem, não haverá formas de recuperá-la mais tarde.",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Sim, exluir postagem!",
      cancelButtonText: "Cancelar",
      closeOnConfirm: false
    },
    function(isConfirm){
      if (isConfirm) {
        $.ajax({
          url: '/posts/' + postId,
          type: 'DELETE',
          success: function(result) {
            swal("Removido!", "Sua postagem foi removido com sucesso.", "success");
          },
          error: function(result){
            swal("Erro ao remover postagem!",
              "Por favor, entre em contato com nossa equipe.", "error");
          }
        });
      }
    });
  });

  $(document).on('ajax:success', '#new_comment', function(e, data, status, xhr){
    $('form')[0].reset();
    Turbolinks.visit('/posts');
    $(".show-comments").show('slow');
  });

  $('.btn-like').bind('ajax:complete', function() {
    Turbolinks.visit('/posts');
  });

  $('.btn-unlike').bind('ajax:complete', function() {
    Turbolinks.visit('/posts');
  });

});
