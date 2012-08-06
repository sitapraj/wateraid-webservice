# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  baseTitle = document.title
  pathName = window.location.pathname
  fileName = pathName.substring(window.location.pathname.lastIndexOf("/") + 1)
  console.log pathName
  console.log pathName.indexOf("open-data-apps")
  if pathName.indexOf("apps") >= 0
    $("li#open-data-apps a").addClass "active"
  else $("li#open-data-datasets a").addClass "active"  if pathName.indexOf("datasets") >= 0
