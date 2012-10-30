# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@select_session = (id) ->
  session = $(".session[data-id="+id+"]")
  session.addClass("active")
  
  $.get(window.location.pathname + "/sessions/" + id, 
    () -> ,
    "script")

@select_first_session = () ->
  select_session($(".session").first().data('id'))

$ ->
  if ($("#session-list .session").length)
    select_first_session()