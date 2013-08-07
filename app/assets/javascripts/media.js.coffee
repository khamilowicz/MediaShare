# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.new_link').on 'click', ->
    $(this).find('a')[0].click()
  $('.medium').on 'click', ->
    $(this).find('.facebook_comments').toggleClass('visible')