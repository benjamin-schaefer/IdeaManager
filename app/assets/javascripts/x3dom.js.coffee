# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggle_light = ->
  light = $('directionallight')[0]
  console.log light
  light._x3domNode._vf.on ^= 1
