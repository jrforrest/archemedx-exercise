# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('a.show-comment-form').click (e) ->
    $(this).parent().children('.new-comment').toggleClass('hidden')
    $(this).toggleClass('hidden')
    e.preventDefault()
