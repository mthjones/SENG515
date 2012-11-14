# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#room_equipment_ids").select2({
      placeholder: "Select Equipment this room contains",
      allowClear: true
    })