# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  first_session = $(".session").first()
  first_session.addClass("active")
  
  $.get(window.location.pathname + "/sessions/" + first_session.data('id'),
        () -> ,
        "script")