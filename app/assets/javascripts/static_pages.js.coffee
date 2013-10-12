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
    dataLabels = $(chart).data('test').split(',')
    dataValues = $(chart).data('values').split(',')
    data = {
      labels : dataLabels
      datasets : [
        {
          fillColor : "rgba(151,187,205,0.5)"
          strokeColor : "rgba(151,187,205,1)"
          pointColor : "rgba(151,187,205,1)"
          pointStrokeColor : "#fff"
          scaleStartValue : 0
          data : dataValues
        }
      ]
    }
    new Chart(context).Radar(data);
  )