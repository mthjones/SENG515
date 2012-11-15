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

update_rooms = () ->
  equipment_ids = (equipment.value for equipment in $("#equipment option:selected"))
  session_room_select = $("#session_room_id")
  session_room_select.empty()
  $.get "/rooms.json?equipment_ids=" + equipment_ids.join(","),
    (data) ->
      $.each data, (_, room) ->
        console.log room
        session_room_select.append($("<option></option>").attr("value", room.id).text(room.room_no + " - " + room.location))
      session_room_select.trigger("change")

$ ->
  if ($("#session-list .session").length)
    select_first_session()
  
  $("#session-info").on "change", "#equipment", () ->
    update_rooms()