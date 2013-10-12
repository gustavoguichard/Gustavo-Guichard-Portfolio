# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("a[rel=tooltip]").tooltip({placement: 'bottom'})
  $("a.close").on "click", ->
    $(this).closest(".alert").fadeOut()
  $.stellar()

  
  $(".project_chart").each((i,chart)->
    context = chart.getContext("2d")
    dataLabels = $(chart).data('labels').split(',')
    dataValues = $(chart).data('values').split(',')
    if dataValues.length > 1 and dataLabels.length > 1
      data = {
        labels : dataLabels
        datasets : [
          {
            fillColor : "rgba(151,187,205,0.5)"
            strokeColor : "rgba(151,187,205,1)"
            pointColor : "rgba(151,187,205,1)"
            pointStrokeColor : "#fff"
            data : dataValues
          }
        ]
      }
      c = new Chart(context).Radar(data);
      console.log c
  )