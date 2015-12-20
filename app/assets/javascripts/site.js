//= require jquery
//= require lib/animatedModal.min.js

$(function () {

  $("#sign-up").animatedModal({
    modalTarget: 'sign-up-modal',
    animatedIn: 'bounceInRight',
    animatedOut: 'bounceOutLeft',
    color: 'rgba(127, 203, 148, 0.59)',
  });

  $("#sign-in").animatedModal({
    modalTarget: 'sign-in-modal',
    animatedIn: 'bounceInRight',
    animatedOut: 'bounceOutLeft',
    color: 'rgba(127, 203, 148, 0.59)',
  });

  $(document).on("click touch", ".btn-has-account", function() {
    $('.btn-sign-in').click();
  });

  $(document).on("click touch", ".btn-do-not-account", function() {
    $('.btn-get-started').click();
  });

});
