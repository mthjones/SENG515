# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@add_expense = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $(link).closest("table").append(content.replace(regexp, new_id))

@remove_expense = (link) ->
  $(link).prev("input[type=hidden]").val(true)
  $(link).closest(".expense").hide()
